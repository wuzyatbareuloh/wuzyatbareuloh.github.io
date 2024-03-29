'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "b3b87f9153d4406c14bc11865bbe1089",
"index.html": "86028973bd16c78a41b7dca5123f11a7",
"/": "86028973bd16c78a41b7dca5123f11a7",
"main.dart.js": "786d20152f44da2786d6e667efd6399d",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "901d86fb8842ec0d66225a542131d689",
"assets/AssetManifest.json": "87601f75d380304082839f89d8e2c20a",
"assets/NOTICES": "da946849eeac90afd20a87762b3e683a",
"assets/FontManifest.json": "9fa93c96d21b9d1cd7c631c021131085",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/Helvetica_CE_Medium.otf": "7f29fe5a660714f1dc6ed0981a199706",
"assets/fonts/Thonburi-Bold.ttf": "2160a66fbeecc1a768e01b3c470cb7b8",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/fonts/Thonburi.ttf": "62b0e8982d6bda8c45021e0cfe47658f",
"assets/assets/spotify.png": "19e0f6b1ec9fad061fb83b1ee546dd57",
"assets/assets/static5.png": "fae3c731b445a01e7e117243cab347e2",
"assets/assets/static4.png": "5b12e41ad22ec6feaa9db59a0a521b03",
"assets/assets/static6.png": "5b12e41ad22ec6feaa9db59a0a521b03",
"assets/assets/static3.png": "473e5c9d49ee60b16a8f86cb07a91364",
"assets/assets/instagram.png": "231cce75a2c2abc109b08f7f1e6b6e17",
"assets/assets/content/wuzyPage.txt": "cf9c15d050d9cb92d28206027273a3ff",
"assets/assets/content/cloudsInSeoulPage.txt": "05029f7e03ef4ebf553570ab7bd06551",
"assets/assets/CloudsInSeoulZero.png": "ce4e8a5e909bf21208520c784e2d2c58",
"assets/assets/patientCoverPhoto.jpg": "8bc25434fb91707273dc71d60652f8a3",
"assets/assets/logoSymbol.png": "897f13615f85a82616d4a98ae094dfff",
"assets/assets/cloudsInSeoulTempPic.png": "379dea34fa17581ad00967eadc35d70f",
"assets/assets/applemusic.png": "f96074ef2fbbb73a7ce1f7a795e2eed0",
"assets/assets/bloomingLateCoverArt.jpeg": "19c36ceda2295cc6fccc61b88da8af03",
"assets/assets/tiktok.png": "6b22c31470c9ed6d8d28278a4fbc978b",
"assets/assets/static2.jpeg": "ef7ead317bf1ed102ad8297bb7e36bf0",
"assets/assets/wuzyPatient.mp3": "1e8471c47a6abe61390ad0b3b7485e2c",
"assets/assets/logo.png": "60078e9e327f438228b3233a12175030",
"assets/assets/footerLogo.png": "69594ee1dcc7df3bcc9225f3c3b43616",
"assets/assets/wuzyBloomingLate.mp3": "86fcd31443c7ac5063ee0eb93e82b112",
"assets/assets/texture1.jpeg": "c91aa7676bb6ff7be4baf0bed8cd22e9",
"assets/assets/wuzyTempPic.png": "39806a067e50dd7af84b036284e33ee6",
"assets/assets/youtube.png": "0c8b5910b04bf218a725af3c4808cec3",
"assets/assets/wuzy.png": "2b81f93d4fccbab25cfe07136a637359",
"assets/assets/cloudsinseoul.png": "6a225082fc912babcf8ac186a022d3e2",
"assets/assets/artists1_5x.png": "1cc6b881301f6588d09fe65e0ccefe45",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
