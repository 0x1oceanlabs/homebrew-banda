# Banda for macOS

[Banda](https://banda.so) on Apple silicon, through Homebrew.

```sh
brew install --cask 0x1oceanlabs/banda/banda-dev   # Banda Dev: every merge to main
brew install --cask 0x1oceanlabs/banda/banda       # Banda: each Stable release
```

Update with `brew upgrade --cask banda-dev` (or `banda`). Banda tells you when a new version is out.

The app is signed ad hoc, not notarized, until there is an Apple certificate. The cask removes its quarantine, so macOS opens it.

The casks are written by the release workflow of [0x1oceanlabs/banda](https://github.com/0x1oceanlabs/banda) (`scripts/cask.mjs`), so change them there.
