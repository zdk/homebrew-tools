class Lowfat < Formula
  desc "Low-fat command output for LLM environments"
  homepage "https://github.com/zdk/lowfat"
  url "https://github.com/zdk/lowfat/archive/refs/tags/v0.6.2.tar.gz"
  version "0.6.2"
  sha256 "f5f4ea314cd3d8464169fe1e8a7f7b2cd77cd0630be75d3f4a041b2b441ef36a"
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/lowfat"), "--bin", "lowfat"
  end

  def caveats
    <<~EOS
      Add to your shell profile (~/.zshrc or ~/.bashrc):

        eval "$(lowfat shell-init zsh)"
    EOS
  end

  test do
    assert_match "lowfat", shell_output("\#{bin}/lowfat --version")
  end
end
