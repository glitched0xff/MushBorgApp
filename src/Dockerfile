# Immagine linux con nodejs 24
FROM node:24-alpine 

# Imposta variabili d'ambiente cruciali per Puppeteer su Alpine
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Directory di lavoro sul Docker dove verranno copiati i file dell'app
WORKDIR /app 

# Installa le dipendenze per Canvas E Chromium per Puppeteer con i font necessari
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
    ttf-freefont

# Copia i file dei pacchetti
COPY package*.json ./

# Sblocca gli script di post-installazione e installa i moduli Node.js
RUN apk add --no-cache git && \
    npm config set ignore-scripts false && \
    npm install

# Copia il resto dell'applicazione
COPY . .

EXPOSE 3000

CMD ["npm", "start"]
