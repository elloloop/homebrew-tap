class Stax < Formula
  desc "Local-first GitHub Actions runner and stacked-diff CLI"
  homepage "https://elloloop.github.io/stax/"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-darwin-arm64"
      sha256 "19dcde184b07ccde6e46ac0efadea2ac6b0412dbf0224f61c34dbacdbf335fc9"
    end
    on_intel do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-darwin-amd64"
      sha256 "93dbe28ffabda8590721f627a3ab19d1d2ab87c8815365fb11e1edaf73532cda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-linux-arm64"
      sha256 "622bdb3001785c27476896d2dbbf145851ccc345129f2dee92fadcbe6e5ba111"
    end
    on_intel do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-linux-amd64"
      sha256 "9f0cfbdfd918363ade0b29b2e3c3d2a1667793b30f9b14f5326413f26ee07e7d"
    end
  end

  def install
    binary = Dir["stax-*"].first
    odie "no stax-* binary in download" unless binary
    bin.install binary => "stax"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stax --version")
  end
end
