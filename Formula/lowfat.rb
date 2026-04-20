class Lowfat < Formula
  desc "Low-fat command output for LLM environments"
  homepage "https://github.com/zdk/lowfat"
  url "https://github.com/zdk/lowfat/archive/refs/tags/v0.3.4.tar.gz"
  version "0.3.4"
  sha256 "53d87a246d60d70cc1932a8825a9e132cda0c7dac0ea8ac29cb8ee3c672b76a5"
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
