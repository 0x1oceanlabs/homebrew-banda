# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.240"
  sha256 "0a7af762f5f6cae873b929678552cf97d67c8e4fc8f17643afe03af01ef0107f"

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

  zap trash: [
    "~/Library/Application Support/banda-dev",
    "~/Library/Application Support/Banda Dev",
    "~/Library/Caches/so.banda.dev",
    "~/Library/Caches/so.banda.dev.ShipIt",
    "~/Library/Preferences/so.banda.dev.plist",
    "~/Library/Saved Application State/so.banda.dev.savedState",
  ]
end
