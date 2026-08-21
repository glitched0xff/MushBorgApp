/**
 * Funzione di generazione pdf
 * 
 * Parametri
 * data = Dati della query da mettere nel template
 * ejsTemplate=File di tempalte
 * headerText=
 */
const ejs=require("ejs")
const moment=require("moment")
const puppeteer=require("puppeteer")
const fs=require("fs")
const path=require("path")
const { mushElement } = require("../models")

// const { jsPDF } = require("jspdf");
// const { JSDOM } = require("jsdom");

/* Puppetter */
module.exports=async (data,ejsTemplate,headerText=false,footerText=false)=>{
    // console.log("gen")
    const launchOptions = {
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage', 
            '--disable-accelerated-2d-canvas',
            '--disable-gpu',           
            '--no-first-run',
            '--no-zygote',
            '--single-process' // Ottimo per il Raspberry, innocuo sul PC
        ]
        };
    if (process.env.IS_DOCKER === "true") {
        launchOptions.executablePath = '/usr/bin/chromium-browser';
    }

     console.log(data.mushElementObj.parentElement)

    //Converto il logo in Base64
    const logoPath = path.join(process.cwd(), "public/dist/img/", "LogoMushborgReport.png");
    const logoBuffer = fs.readFileSync(logoPath);
    const logoBase64 = `data:image/png;base64,${logoBuffer.toString("base64")}`;

    const html = await ejs.renderFile("views/report/"+ejsTemplate, { data: data.mushElementObj,logoBase64:logoBase64 });
    const headerTemplate= await ejs.renderFile("views/report/reportHeader.ejs", { today: moment().format("DD-MM-YY HH:MM") });
    const footerTemplate= await ejs.renderFile("views/report/reportFooter.ejs",{logoBase64:logoBase64});
   
    const browser = await puppeteer.launch({
                    headless: true,
                    args: ["--no-sandbox", "--disable-setuid-sandbox"],
                    });
    const page = await browser.newPage();

    // Rimuove i timeout (Su PC sarà istantaneo, il Raspberry si prenderà il suo tempo senza crashare)
    await page.setDefaultNavigationTimeout(0);
    await page.setDefaultTimeout(0);

    // Esegui il setContent con il timeout disattivato
    await page.setContent(html, { 
    waitUntil: 'networkidle0',
    timeout: 0 
    });

    //await page.setContent(html, { waitUntil: "networkidle0" });
    
    const pdf = await page.pdf({ format: "A4", 
                                    printBackground: true,
                                displayHeaderFooter: true,
                                headerTemplate,
                                footerTemplate,
                                margin: { top: "1.5cm", bottom: "1.5cm", left: "1cm", right: "1cm" }, 
                            });
    await browser.close();
    return pdf
}


// module.exports = async (data, ejsTemplate, headerText = false, footerText = false) => {
//     // Converto il logo in Base64
//     const logoPath = path.join(process.cwd(), "public/dist/img/", "LogoMushborgReport.png");
//     const logoBuffer = fs.readFileSync(logoPath);
//     const logoBase64 = `data:image/png;base64,${logoBuffer.toString("base64")}`;

//     const mainHtml = await ejs.renderFile("views/report/" + ejsTemplate, { data: data, logoBase64: logoBase64 });
//     const headerHtml = await ejs.renderFile("views/report/reportHeader.ejs", { today: moment().format("DD-MM-YY HH:MM") });
//     const footerHtml = await ejs.renderFile("views/report/reportFooter.ejs", { logoBase64: logoBase64 });
    
//     // Uniamo i pezzi in un unico HTML strutturato
//     const fullHtml = `
//     <html>
//         <head>
//             <style>
//                 html, body { 
//                     margin: 0; 
//                     padding: 0; 
//                     display: block; 
//                     min-height: 100%; 
//                     height: auto !important;
//                 }
//             </style>
//         </head>
//         <body>
//             <header>${headerHtml}</header>
//             <main>${mainHtml}</main>
//             <footer>${footerHtml}</footer>
//         </body>
//     </html>
//     `;

//    // 1. Crea il DOM virtuale con JSDOM
//     const dom = new JSDOM(fullHtml, {
//         virtualConsole: new (require("jsdom")).VirtualConsole() 
//     });

//     // 2. Configura le variabili globali
//     global.window = dom.window;
//     global.document = dom.window.document;
//     global.HTMLCanvasElement = dom.window.HTMLCanvasElement;
//     global.Node = dom.window.Node;           
//     global.Image = dom.window.Image;         
//     global.navigator = dom.window.navigator; 
//     global.getComputedStyle = dom.window.getComputedStyle; 

//     // --- PULIZIA DI SICUREZZA PER EVITARE IL CRASH DI HTML2CANVAS ---
    
//     // Rimuove i commenti CSS dentro tutti i tag <style> (causa comune di unexpected EOF)
//     const styleTags = dom.window.document.querySelectorAll("style");
//     styleTags.forEach(tag => {
//         let cssText = tag.textContent;
//         // Rimuove i commenti /* ... */ che confondono il parser di html2canvas
//         cssText = cssText.replace(/\/\*[\s\S]*?\*\//g, "");
//         // Rimuove spazi bianchi eccessivi e punti e virgola isolati alla fine
//         tag.textContent = cssText.trim();
//     });

//     // Rimuove o corregge gli stili inline vuoti o incompleti (es: style="color: ;")
//     const allElements = dom.window.document.querySelectorAll("[style]");
//     allElements.forEach(el => {
//         let styleAttr = el.getAttribute("style");
//         if (styleAttr) {
//             // Rimuove i commenti dagli stili inline
//             styleAttr = styleAttr.replace(/\/\*[\s\S]*?\*\//g, "").trim();
//             // Se finisce male o contiene valori vuoti (es: "width: ;") lo ripuliamo
//             if (styleAttr === "" || styleAttr.endsWith(":") || styleAttr.includes(": ;")) {
//                 el.removeAttribute("style");
//             } else {
//                 el.setAttribute("style", styleAttr);
//             }
//         }
//     });

//     // 3. Inizializza jsPDF
//     const doc = new jsPDF({
//         orientation: "portrait",
//         unit: "mm",
//         format: "a4"
//     });

//     // Usiamo direttamente l'elemento body ripulito
//     const bodyElement = dom.window.document.body;

//     // 4. Esegui il rendering asincrono dentro una Promise
//     await new Promise((resolve, reject) => {
//         doc.html(bodyElement, {
//             x: 10,
//             y: 15,
//             width: 190,
//             windowWidth: 800,
//             autoPaging: 'text',
//             html2canvas: {
//                 logging: false,
//                 useCORS: true
//             },
//             callback: function (pdfDoc) {
//                 resolve(pdfDoc);
//             }
//         }).catch(err => reject(err));
//     });

//     // 5. Estrai il buffer finale
//     const pdfArrayBuffer = doc.output("arraybuffer");
//     const pdf = Buffer.from(pdfArrayBuffer);

//     return pdf; 
// };
