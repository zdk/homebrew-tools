class RmSafely < Formula
  desc "rm-safely - command that moves files to trash before deletion"
  homepage "https://github.com/zdk/rm-safely"
  url "https://github.com/zdk/rm-safely/archive/refs/tags/v1.8.1.tar.gz"
  version "1.8.1"
  sha256 "bc0c550f124ceb8d7f1b919c34f2c87ff6a63b511c753a9082fb6ea5111cd614"
  license "MIT"

  def install
    bin.install "rm-safely" => "rm-safely"

    (bin / "rm-safely-install").write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-safely" install "$@"
    EOS

    (bin / "rm-safely-uninstall").write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-safely" uninstall "$@"
    EOS

    chmod 0o755, bin / "rm-safely-install"
    chmod 0o755, bin / "rm-safely-uninstall"
  end

  def caveats
    <<~EOS
      After rm-safely is installed via brew.
      To use it, please run the following command:

      ➡️  rm-safely install

      Then reload your shell:

          source ~/.zshrc  # for zsh
          source ~/.bashrc # for bash
    EOS
  end

  test do
    system "#{bin}/rm-safely", "status"
  end
end
