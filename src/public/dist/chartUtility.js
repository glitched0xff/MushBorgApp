function lttbXY(data, threshold = 50) {
        if (!Array.isArray(data)) throw new Error('data must be an array');
        if (data.length <= threshold) return data;

        // sicurezza: ordina per tempo
        const sorted = [...data].sort(
          (a, b) => new Date(a.x).getTime() - new Date(b.x).getTime()
        );

        const sampled = [];
        const n = sorted.length;
        const bucketSize = (n - 2) / (threshold - 2);

        let a = 0;
        sampled.push(sorted[a]); // primo punto

        for (let i = 0; i < threshold - 2; i++) {
          const rangeStart = Math.floor((i + 1) * bucketSize) + 1;
          const rangeEnd = Math.floor((i + 2) * bucketSize) + 1;

          const bucket = sorted.slice(rangeStart, rangeEnd);

          // 🔥 fallback se bucket vuoto
          if (bucket.length === 0) continue;

          let avgX = 0;
          let avgY = 0;
          for (const p of bucket) {
            avgX += new Date(p.x).getTime();
            avgY += p.y;
          }
          avgX /= bucket.length;
          avgY /= bucket.length;

          let maxArea = -1;
          let maxPoint = bucket[0];

          const prevStart = Math.floor(i * bucketSize) + 1;
          const prevEnd = Math.floor((i + 1) * bucketSize) + 1;
          const range = sorted.slice(prevStart, prevEnd);

          for (const p of range) {
            const area = Math.abs(
              (new Date(sorted[a].x).getTime() - avgX) * (p.y - sorted[a].y) -
              (new Date(sorted[a].x).getTime() - new Date(p.x).getTime()) * (avgY - sorted[a].y)
            );

            if (area > maxArea) {
              maxArea = area;
              maxPoint = p;
            }
          }

          sampled.push(maxPoint);
          a = sorted.indexOf(maxPoint);
        }

        sampled.push(sorted[n - 1]); // ultimo punto

        // 🔒 forza numero punti
        return sampled.slice(0, threshold);
      }

      function extractSeries(records, fieldName) {
        console.log("fieldName")
        console.log(fieldName)
        console.log("xxxxx")

          return records
            .filter(r => r[fieldName] !== null && r[fieldName] !== undefined)
            .map(r => ({
              x: new Date(r.createdAt).toISOString(),
              y: Number(r[fieldName])
            }));
        }