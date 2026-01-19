/**
 * This function is based on heic2any
 * Bring the file also heic and 
 * - replace space in filename with _
 * - convert the image on jpg
 * - resize image as maxSize (default 1024x1024 proportional)
 * - send back the image ready to send to server
 */

async function convertAndResizeImage(file, maxSize = 1024) {
  let blob = file;

  // HEIC → JPG
  if (
    file.type.includes("heic") ||
    file.name.toLowerCase().endsWith(".heic")
  ) {
    blob = await heic2any({
      blob: file,
      toType: "image/jpeg",
      quality: 0.9
    });
  }

  return new Promise((resolve) => {
    const img = new Image();
    const reader = new FileReader();

    reader.onload = e => img.src = e.target.result;

    img.onload = () => {
      let { width, height } = img;

      // calcolo proporzioni
      if (width > height && width > maxSize) {
        height = Math.round(height * (maxSize / width));
        width = maxSize;
      } else if (height > maxSize) {
        width = Math.round(width * (maxSize / height));
        height = maxSize;
      }

      const canvas = document.createElement("canvas");
      canvas.width = width;
      canvas.height = height;
      canvas.getContext("2d").drawImage(img, 0, 0, width, height);

      canvas.toBlob(
        (resizedBlob) => resolve(resizedBlob),
        "image/jpeg",
        0.8
      );
    };

    reader.readAsDataURL(blob);
  });
}


