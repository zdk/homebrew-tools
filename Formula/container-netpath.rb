class ContainerNetpath < Formula
  desc "Show apple/container network paths"
  homepage "https://github.com/zdk/container-netpath"
  url "https://github.com/zdk/container-netpath/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f1eb3f079fa18ff8c7cd8cefd0ed9272e1989e2b2427940e29c4601de073ce98"
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
      Register the plugin with apple/container:

        container from Apple's .pkg:
          sudo mkdir -p /usr/local/libexec/container-plugins
          sudo ln -sfn #{opt_libexec}/netpath /usr/local/libexec/container-plugins/netpath

        container from Homebrew:
          mkdir -p #{HOMEBREW_PREFIX}/libexec/container-plugins
          ln -sfn #{opt_libexec}/netpath #{HOMEBREW_PREFIX}/libexec/container-plugins/netpath

      Then run: container netpath
    EOS
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/netpath --help")
  end
end
