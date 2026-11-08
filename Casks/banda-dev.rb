# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.408"
  sha256 "cc7e2664b1cb59c2da86cb0001d8ec8d44ed11b5c1ddf4614568611f6a6fb124"

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
