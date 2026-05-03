cask "stax" do
  version "2.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/elloloop/stax/releases/download/v#{version}/Stax-v#{version}-universal.dmg"
  name "Stax"
  desc "Local-first GitHub Actions runner with stacked-diff CLI and menu bar app"
  homepage "https://elloloop.github.io/stax/"

  depends_on formula: "node"

  app "Stax.app"
  binary "#{appdir}/Stax.app/Contents/Resources/bin/stax"

  zap trash: [
    "~/Library/Application Support/Stax",
    "~/Library/Caches/com.stax.desktop",
    "~/Library/Preferences/com.stax.desktop.plist",
    "~/Library/LaunchAgents/com.stax.desktop.plist",
    "~/Library/Saved Application State/com.stax.desktop.savedState",
  ]
end
