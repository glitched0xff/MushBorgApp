const CACHE_NAME = 'qr-decoder-v1';
const ASSETS_TO_CACHE = [
  './',
  './index.html',
  './manifest.json',
  './LogoMushborgWeb.png',
  'https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css',
  'https://unpkg.com/html5-qrcode@2.3.8/html5-qrcode.min.js'
];

// Installazione Service Worker e caching delle risorse
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS_TO_CACHE);
    })
  );
  self.skipWaiting();
});

// Attivazione e pulizia vecchie cache
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        })
      );
    })
  );
  self.clients.claim();
});

// Intercettazione richieste e risposta da cache
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request).then((cachedResponse) => {
      return cachedResponse || fetch(event.request);
    })
  );
});