class ContainerNetpath < Formula
  desc "Show apple/container network paths"
  homepage "https://github.com/zdk/container-netpath"
  url "https://github.com/zdk/container-netpath/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "2862f58cb9d81f7f546ed70ab93631beb0bdad84256b8303dd1db4d1462f1cf8"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    (libexec/"netpath/bin").install ".build/release/netpath"
    (libexec/"netpath").install "config.toml"
    bin.install_symlink libexec/"netpath/bin/netpath"
  end

  def caveats
    <<~EOS
      Enable the apple/container plugin (asks for sudo if needed):
        netpath enable
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/netpath --help")
  end
end
