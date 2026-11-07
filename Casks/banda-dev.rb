# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.365"
  sha256 "ce61dce1dbab2b51455656bb762fdd85fc7144b434ea926209ca85a4d82a8088"

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
