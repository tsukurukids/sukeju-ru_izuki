const CACHE_NAME = 'focus-alarm-v1';
const ASSETS = [
  'preview.html',
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

/* オフラインのときでもキャッシュからファイルを読み込んで動くようにするよ */
self.addEventListener('fetch', (e) => {
  e.respondWith(
    caches.match(e.request).then((response) => {
      return response || fetch(e.request);
    })
  );
});
