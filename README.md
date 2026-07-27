# homebrew-tap

Public Homebrew tap for [roboalchemist](https://github.com/roboalchemist) tools.

## Install

```bash
brew tap roboalchemist/tap
brew install <formula>
```

## Formulas

| Formula | Description |
|---------|-------------|
| `any2md` | Convert any file format to markdown (AI-powered, Apple Silicon) |
| `buildbuddy-cli` | CLI for the BuildBuddy Enterprise API |
| `docmost-cli` | CLI for the Docmost wiki API |
| `exa-cli` | CLI for the Exa AI search API |
| `freshrss-cli` | CLI for FreshRSS feed management via Google Reader API |
| `jopctl` | Joplin Data API CLI (full CRUDL) |
| `linear-cli` | Comprehensive Linear API CLI |
| `md2notion` | Convert Markdown documents to Notion pages |
| `opsgenie-cli` | CLI for OpsGenie REST API v2 |
| `perplexity-cli` | Command-line client for Perplexity AI API |
| `reticle-mlx` | Model-agnostic MLX autocomplete service manager for Reticle |
| `reticle-mtplx` | Install and operate a local MTPLX autocomplete service for Reticle |
| `tavily-cli` | CLI for the Tavily AI search API |

## Casks

| Cask | Description |
|------|-------------|
| `reticle-mlx` | Signed and notarized Reticle MLX menu-bar app |

## Usage

```bash
# Install a specific tool
brew install roboalchemist/tap/exa-cli

# Or tap first, then install without prefix
brew tap roboalchemist/tap
brew install perplexity-cli

# Native Reticle MLX menu-bar app
brew install --cask roboalchemist/tap/reticle-mlx
```

## Adding or Updating Formulas

```bash
# Compute sha256 for a tarball
curl -sL <url> | shasum -a 256

# Test a formula locally
brew install --build-from-source ./Formula/<name>.rb
brew test <name>
brew audit --strict ./Formula/<name>.rb
```
