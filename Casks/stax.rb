cask "stax" do
  version "2.4.2"
  sha256 "6eda931a994155c7422bacc550b40bd0cd3307e82528e132b150e51cc221cbd0"

  url "https://github.com/elloloop/stax/releases/download/v#{version}/Stax-v#{version}-universal.dmg"
  name "Stax"
  desc "Local-first GitHub Actions runner with stacked-diff CLI and menu bar app"
  homepage "https://elloloop.github.io/stax/"

  depends_on formula: "node"

  app "Stax.app"
  binary "#{appdir}/Stax.app/Contents/Resources/resources/bin/stax"

  zap trash: [
    "~/Library/Application Support/Stax",
    "~/Library/Caches/com.stax.desktop",
    "~/Library/Preferences/com.stax.desktop.plist",
    "~/Library/LaunchAgents/com.stax.desktop.plist",
    "~/Library/Saved Application State/com.stax.desktop.savedState",
  ]

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Stax.app"]
  end

end
