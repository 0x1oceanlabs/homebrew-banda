# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.483"
  sha256 "07dd67fac14d40ec4f86ede30de790d6025f7fff45b371ea052918f75948da0e"

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
