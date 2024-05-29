'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "009c9e65172e010890f7f65fde438006",
"main.dart.js": "8455507a39a76bf8ffcc76b02f78a1d9",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/AssetManifest.bin.json": "631f7008e12b584da9346667098efc8b",
"assets/NOTICES": "cba0a8be578bd7de684b29684bf96ef0",
"assets/AssetManifest.json": "415565441363923c4d67af1f4b99253c",
"assets/assets/icons/linux.png": "f213a9d20832f6f324718e9d7728b6ca",
"assets/assets/icons/unity-original.svg": "6c6026d853495519f672912cadb3d702",
"assets/assets/icons/gimp.png": "8e12aecd42d3a13634cdad1f2fa5c19a",
"assets/assets/icons/neovim-original.svg": "3d6ffa0df6727fddc53d7484374c26e6",
"assets/assets/icons/c-original.svg": "7984f1f99e00b58e6402c5624e1dc298",
"assets/assets/icons/inkscape.png": "8ad2ed0ffbd8a198bf941689db529607",
"assets/assets/icons/css3-original.svg": "a55118403c13e2719d453b74dffa80f8",
"assets/assets/icons/javascript.png": "6095119e80cda4e4cb958440560a2588",
"assets/assets/icons/javascript-original.svg": "0c1f700da144243c526f252e59362138",
"assets/assets/icons/gimp-original.svg": "f6de24ef3a4fb2561a485b21491c8f1a",
"assets/assets/icons/neovim.png": "ade95e48cb2b718c9660d17796ecb76f",
"assets/assets/icons/csharp-original.svg": "ec7be0a3500b106a4e451fd951e1c717",
"assets/assets/icons/git-original.svg": "fef8e95112e6ab6f2169430ee510db5e",
"assets/assets/icons/csharp.png": "145bb6eba358fe62e02281ec52161ed7",
"assets/assets/icons/linux-original.svg": "17eb8f433d72c073ec12417f3ca5d157",
"assets/assets/icons/html.png": "7f790950575b775399447dcc21158bfe",
"assets/assets/icons/python-original.svg": "71374043d9b3d9ea7fa09976a747d475",
"assets/assets/icons/flutter.png": "db46d57884bb5ba2393fafc4960201d4",
"assets/assets/icons/html5-original.svg": "16d07e8682a531f3bc1e9fb01bd59740",
"assets/assets/icons/css.png": "baea605d60664c43fb214c1fbdd20395",
"assets/assets/icons/c.png": "3f5519e1cdea3d31d9ad186b496bb66c",
"assets/assets/icons/git.png": "4719dd46ee701ca393a167e363a9779e",
"assets/assets/icons/flutter-original.svg": "5ff1722cbed36fdb869cba0c95788d42",
"assets/assets/icons/inkscape-original.svg": "f5193a7d38bffb32a7f1064c09339c06",
"assets/assets/icons/unity.png": "41886bf546aefd1cb8e58a9f00890b24",
"assets/assets/icons/python.png": "c95a5b932a07c9201baa6d75898aa497",
"assets/assets/profile_placeholder.png": "88425f1f2dce9bdd1fa341919e4b12f3",
"assets/assets/skills.json": "d8f9be5024b21cd2491cd90719084492",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "005fb68408d0149c86af11c399408f3b",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"flutter_bootstrap.js": "527178ed611256a250657e5f7419b101",
"index.html": "70404c636ebf66d8d20cf2d0db067fd1",
"/": "70404c636ebf66d8d20cf2d0db067fd1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
