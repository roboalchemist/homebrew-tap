# Worklog

## 2026-07-27 — Reticle MLX 0.7.0

- Bumped the CLI formula and signed/notarized app cask to Reticle MLX 0.7.0.
- Verified the cask digest against the GitHub release DMG. This is the bootstrap release for Sparkle auto-updates and carries the current white-transparent Reticle menu-bar template icon.

## 2026-07-27 — Reticle MLX app and generic service

- Added `reticle-mlx`, the renamed model-agnostic MLX-LM service manager with Seed, Qwen, and custom-model support.
- Added the Developer ID signed, Apple-notarized, and stapled Reticle MLX 0.6.0 menu-bar app as a cask.
- Deprecated the old `reticle-seed-mlx` formula without removing it so existing installations retain a clear migration path.
- Verified the release archive and DMG checksums against the public GitHub assets.

## 2026-07-27 — Reticle Seed-Coder MLX formula

- Added an Apple-Silicon-only formula for the Reticle 0.5.0 Seed-Coder MLX service manager.
- Depend on Homebrew Python 3.12 while leaving the pinned MLX/MLX-LM environment and public model download isolated under the user's Reticle runtime directory.
- Verified the source archive checksum and Ruby style. The service manager itself passed a clean installation, public-model download, launchd startup, runtime-version check, suffix-dependent FIM doctor probe, and live Reticle integration on an M3 Max.

## 2026-07-26 — Reticle MTPLX formula

- Added a macOS/Apple-Silicon formula that installs the versioned Reticle MTPLX service manager as `reticle-mtplx`.
- Kept the official MTPLX runtime and model installation in the manager so the formula remains small and its help test is offline.
- Validated the manager and Reticle 0.3.0 on an M1 Mac mini with 16 GB unified memory before publishing the formula.

## 2026-07-26 — Reticle MTPLX 0.3.1

- Updated the formula to the signed Reticle v0.3.1 tag after mini exposed a misleading generic diagnostic.
- Added the installed-service `doctor` command to the formula caveats; it now remembers custom LaunchAgent settings and verifies the real suffix-dependent FIM path.
