cask "stax" do
  version "2.4.1"
  sha256 "d610626188cd0e1138ce7964274f58ab43c039b986ae00fe89b512aaf8531476"

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
