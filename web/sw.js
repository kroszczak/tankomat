
importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

workbox.precaching.precacheAndRoute([
  {url: '/index.html', revision: '383676' },
  {url: '/favicon.png', revision: 'null' },
  {url: '/icons/logo-128.png', revision: 'null' },
  {url: '/icons/logo-512.png', revision: 'null' },
  {url: '/icons/logo-256.png', revision: 'null' },
  {url: '/icons/logo-192.png', revision: 'null' },

]);



workbox.routing.registerRoute(
  ({request}) => request.destination === 'images',
  new workbox.strategies.CacheFirst({
    cacheName: 'tankomat-assets'
  })
);

workbox.routing.registerRoute(
  ({request}) => request.destination === 'script',
  new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'tankomat-app'
  })
);
