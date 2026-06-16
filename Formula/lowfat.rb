class Lowfat < Formula
  desc "Low-fat command output for LLM environments"
  homepage "https://github.com/zdk/lowfat"
  url "https://github.com/zdk/lowfat/archive/refs/tags/v0.7.2.tar.gz"
  version "0.7.2"
  sha256 "a800c76cef2ef727abfa9bd89fad6fc68347b583a589cc753d52169de5a3c36f"
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
