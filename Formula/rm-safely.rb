class RmSafely < Formula
  desc "rm-safely - command that moves files to trash before deletion"
  homepage "https://github.com/zdk/rm-safely"
  url "https://github.com/zdk/rm-safely/archive/refs/tags/v1.8.0.tar.gz"
  version "1.8.0"
  sha256 "cbcfcab83897724bef03cde273ef1689e15d8053debff948000ef76385a37ea4"
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
