class Stax < Formula
  desc "Local-first GitHub Actions runner and stacked-diff CLI"
  homepage "https://elloloop.github.io/stax/"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-darwin-arm64"
      sha256 "d2d90bd8bcaef3a141ee0460f718f7fd0a4b6515f943c9e8689ae0235bbb0c65"
    end
    on_intel do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-darwin-amd64"
      sha256 "381a5a052d024ee0c47f378d583e2ee7c25cb948d23a558793b6a28ad8d36c33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-linux-arm64"
      sha256 "970c1c2d0923e447c73b6c725cfba320f3ce5474dbeff8f086ce8a257a104c2d"
    end
    on_intel do
      url "https://github.com/elloloop/stax/releases/download/v#{version}/stax-linux-amd64"
      sha256 "661b4737b5a79286c43f727802107b97daf441aa8ed7196e43f47c8262ee48ea"
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
