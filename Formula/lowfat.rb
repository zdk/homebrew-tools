class Lowfat < Formula
  desc "Low-fat command output for LLM environments"
  homepage "https://github.com/zdk/lowfat"
  url "https://github.com/zdk/lowfat/archive/refs/tags/v0.6.4.tar.gz"
  version "0.6.4"
  sha256 "d2991b929877f00b482bf5512237ccfa04f8f4e69a6dadce1b33339623fe7a0f"
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
