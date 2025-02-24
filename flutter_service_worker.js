'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "47bec950d7651308253e3c572bb1889c",
"version.json": "b3b87f9153d4406c14bc11865bbe1089",
"favicon.ico": "e50b32f37baaa16e8093cc9ebaeb2c11",
"index.html": "2dbb92aee4aa39161c65c704a6f2873c",
"/": "2dbb92aee4aa39161c65c704a6f2873c",
"main.dart.js": "8583b6a0b51c10cdfb158bab078a0445",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/logoSymbol.png": "897f13615f85a82616d4a98ae094dfff",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "901d86fb8842ec0d66225a542131d689",
"assets/AssetManifest.json": "5409cb130ff27e203ee452920bd5d89d",
"assets/NOTICES": "426f3721c202cdc52729074f978a9950",
"assets/FontManifest.json": "9fa93c96d21b9d1cd7c631c021131085",
"assets/AssetManifest.bin.json": "f1aee084e304904623ab5add98d92076",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "7a77e2c28b7d879b6f853c19a11849c0",
"assets/fonts/Helvetica_CE_Medium.otf": "7f29fe5a660714f1dc6ed0981a199706",
"assets/fonts/Thonburi-Bold.ttf": "2160a66fbeecc1a768e01b3c470cb7b8",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/fonts/Thonburi.ttf": "62b0e8982d6bda8c45021e0cfe47658f",
"assets/assets/spotify.png": "19e0f6b1ec9fad061fb83b1ee546dd57",
"assets/assets/favicon.ico": "e50b32f37baaa16e8093cc9ebaeb2c11",
"assets/assets/instagram.png": "231cce75a2c2abc109b08f7f1e6b6e17",
"assets/assets/publishInstructions.txt": "cd53adb9ac37f5cdf85a2b63270b473f",
"assets/assets/pastel_blue.jpg": "520dbfc1a2de6927655d22cdeb724125",
"assets/assets/content/wuzyPage.txt": "cf9c15d050d9cb92d28206027273a3ff",
"assets/assets/content/notahomewithoutyou_lyrics.txt": "3bc86ace12fe5f2131a3773a42fcafe8",
"assets/assets/content/cloudsInSeoulPage.txt": "05029f7e03ef4ebf553570ab7bd06551",
"assets/assets/content/careless_whisper_lyrics.txt": "5b78b6b6dc5ab528d6883d02ff17ea83",
"assets/assets/CloudsInSeoulZero.png": "ce4e8a5e909bf21208520c784e2d2c58",
"assets/assets/pastel_purple.jpg": "f6fa49cc32f3dc2b1fa89b0e226cee24",
"assets/assets/patientCoverPhoto.jpg": "8bc25434fb91707273dc71d60652f8a3",
"assets/assets/logoSymbol.png": "897f13615f85a82616d4a98ae094dfff",
"assets/assets/cloudsInSeoulTempPic.png": "379dea34fa17581ad00967eadc35d70f",
"assets/assets/applemusic.png": "f96074ef2fbbb73a7ce1f7a795e2eed0",
"assets/assets/bloomingLateCoverArt.jpeg": "19c36ceda2295cc6fccc61b88da8af03",
"assets/assets/tiktok.png": "6b22c31470c9ed6d8d28278a4fbc978b",
"assets/assets/bareuloh_website_preview.png": "1d7614d83cb6ea553da2ec1b3fdceaa2",
"assets/assets/logo.png": "60078e9e327f438228b3233a12175030",
"assets/assets/pastel_light_purple.jpg": "b5caf7a2cdd3d9b2b9651e1b0630396e",
"assets/assets/footerLogo.png": "69594ee1dcc7df3bcc9225f3c3b43616",
"assets/assets/careless_whisper_cover_art.png": "0eed096f12d6cde3e7ef7ee27d549fdf",
"assets/assets/wuzyTempPic.png": "39806a067e50dd7af84b036284e33ee6",
"assets/assets/cover_art_images/notahomewithoutyou.jpg": "270f092227261bab755074d9f3599454",
"assets/assets/youtube.png": "0c8b5910b04bf218a725af3c4808cec3",
"assets/assets/wuzy.png": "2b81f93d4fccbab25cfe07136a637359",
"assets/assets/cloudsinseoul.png": "6a225082fc912babcf8ac186a022d3e2",
"assets/assets/artists1_5x.png": "1cc6b881301f6588d09fe65e0ccefe45",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
