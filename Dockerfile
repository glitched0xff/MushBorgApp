# 1. Base image con Node.js 24 su Alpine Linux
FROM node:24-alpine 

# 2. Imposta variabili d'ambiente cruciali per Puppeteer su Alpine
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# 3. Directory di lavoro principale all'interno del container
WORKDIR /app 

# 4. Installa le dipendenze di sistema necessarie per Canvas, Chromium e Git
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    pixman-dev \
    cairo-dev \
    pango-dev \
    jpeg-dev \
    giflib-dev \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    git

# 5. Copia i file dei pacchetti dalla cartella src locale a quella del container
COPY src/package*.json ./src/

# 6. Ci spostiamo in /app/src per installare i moduli di Node.js
WORKDIR /app/src

# 7. Abilita gli script post-installazione e installa i moduli Node.js (comprese le devDependencies)
RUN npm config set ignore-scripts false && \
    npm install

# 8. Ritorniamo alla directory radice /app
WORKDIR /app

# 9. Copia il resto dell'applicazione dal computer locale a /app
COPY . .

# 10. Espone la porta interna dell'applicazione
EXPOSE 3000

# 11. Avvia l'app entrando in src ed eseguendo npm start
CMD ["npm", "start"]
