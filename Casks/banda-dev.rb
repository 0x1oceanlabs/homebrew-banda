# Written by the release workflow of 0x1oceanlabs/banda
# (scripts/cask.mjs): a change here is lost at the next release.
cask "banda-dev" do
  version "0.1.0-dev.139"
  sha256 "32db99a14c5592803563c62e234145a60572a1ec34a3954cd4d733c90f7c0677"

  url "https://github.com/0x1oceanlabs/banda/releases/download/v#{version}/banda-dev-#{version}-arm64.zip"
  name "Banda Dev"
  desc "Tiling workspace for working with Agents"
  homepage "https://banda.so"

  depends_on arch: :arm64

  app "Banda Dev.app"

  # Signed ad hoc, not notarized: without its quarantine Gatekeeper lets it open.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Banda Dev.app"]
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
