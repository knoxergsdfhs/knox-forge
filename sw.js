// Knox Forge — minimal service worker.
// Purpose: makes the site PWA-installable (Chrome requires a worker to enable
// the "Install Knox Forge" omnibox prompt). We do NOT cache aggressively because
// Forge is a single index.html that updates often. We just pass everything
// through to the network so users always get the latest deploy.
const VERSION = "forge-sw-v3";

self.addEventListener("install", (event) => {
  // Activate immediately so updated workers don't sit pending
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(self.clients.claim());
});

self.addEventListener("fetch", (event) => {
  // Pure pass-through — let the network handle every request.
  // No caching, no offline mode. Forge is always live-loaded.
  return;
});
