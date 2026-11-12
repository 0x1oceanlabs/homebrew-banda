# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.674"
  sha256 "1d3e11c418ee05d3152fb8bf76f19e5ad023d31ea67b920a92afebab09f2d3fd"

  url "https://github.com/0x1oceanlabs/banda/releases/download/v#{version}/banda-dev-#{version}-arm64.zip"
  name "Banda Dev"
  desc "Tiling workspace for working with Agents"
  homepage "https://banda.so"

  depends_on arch: :arm64

  app "banda-dev.app", target: "Banda Dev.app"

  # Signed ad hoc, not notarized: without its quarantine Gatekeeper lets it
  # open. Homebrew's own steps, as its Ruby postflight is deprecated.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Banda Dev.app"]
  end

  # The engine's launchd job (ADR 0086, decision 1): only zap takes it
  # away, so an upgrade, whose uninstall runs, leaves the engine and its
  # Agents running (decision 6).
  zap launchctl: "so.banda.dev.engine",
      trash:     [
        "~/Library/LaunchAgents/so.banda.dev.engine.plist",
        "~/Library/Application Support/banda-dev",
        "~/Library/Application Support/Banda Dev",
        "~/Library/Caches/so.banda.dev",
        "~/Library/Caches/so.banda.dev.ShipIt",
        "~/Library/Preferences/so.banda.dev.plist",
        "~/Library/Saved Application State/so.banda.dev.savedState",
      ]
end
