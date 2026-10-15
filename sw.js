// Minimal service worker: keeps the app installable, caches nothing.
// On activation it deletes any caches left behind by older versions.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys()
      .then((keys) => Promise.all(keys.map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});
self.addEventListener('fetch', () => { /* always go to the network */ });
