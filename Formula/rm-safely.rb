class RmSafely < Formula
  desc "rm-safely - command that moves files to trash before deletion"
  homepage "https://github.com/zdk/rm-safely"
  url "https://github.com/zdk/rm-safely/archive/refs/tags/v1.7.1.tar.gz"
  version "1.7.1"
  sha256 "966c9f5fbced79b86ca534a601043bf3834c5c2906dc1a7de7a68186abe21eca"
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
