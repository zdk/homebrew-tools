class Lowfat < Formula
  desc "Low-fat command output for LLM environments"
  homepage "https://github.com/zdk/lowfat"
  url "https://github.com/zdk/lowfat/archive/refs/tags/v0.4.3.tar.gz"
  version "0.4.3"
  sha256 "abdcb3e40d3710cc4c56397d4e7f8aa415fd8a018934540aff6e5d8ed583ad8e"
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
