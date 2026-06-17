const CACHE_NAME = 'focus-alarm-v2';
const ASSETS = [
  'index.html',
  'manifest.json',
  'icon.svg'
];

/* サービスワーカーをインストールして、ファイルをキャッシュ（保存）するよ */
self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      return cache.addAll(ASSETS);
    })
  );
});

/* 新しいバージョンになったら古いキャッシュを消して更新するよ */
self.addEventListener('activate', (e) => {
  e.waitUntil(
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
});

/* オフラインのときでもキャッシュからファイルを読み込んで動くようにするよ */
self.addEventListener('fetch', (e) => {
  e.respondWith(
    caches.match(e.request).then((response) => {
      return response || fetch(e.request);
    })
  );
});
