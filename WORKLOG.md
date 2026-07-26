# Worklog

## 2026-07-26 — Reticle MTPLX formula

- Added a macOS/Apple-Silicon formula that installs the versioned Reticle MTPLX service manager as `reticle-mtplx`.
- Kept the official MTPLX runtime and model installation in the manager so the formula remains small and its help test is offline.
- Validated the manager and Reticle 0.3.0 on an M1 Mac mini with 16 GB unified memory before publishing the formula.

## 2026-07-26 — Reticle MTPLX 0.3.1

- Updated the formula to the signed Reticle v0.3.1 tag after mini exposed a misleading generic diagnostic.
- Added the installed-service `doctor` command to the formula caveats; it now remembers custom LaunchAgent settings and verifies the real suffix-dependent FIM path.
