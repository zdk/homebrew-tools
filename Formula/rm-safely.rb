class RmSafely < Formula
  desc "Safe rm command that backs up files to trash before deletion"
  homepage "https://github.com/zdk/rm-safely"
  url "https://github.com/zdk/rm-safely/archive/refs/heads/main.tar.gz"
  version "1.0.1"
  sha256 "3a3dac0ee0ac09fb4730b49aa0eb610036de9f96ccb4c5f364862dc627ecf406"
  license "MIT"

  def install
    bin.install "rm-safely.sh" => "rm-safely"

    # Create a wrapper script for easier integration
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
      To install the rm hook:
        rm-safely-install

      To uninstall the rm hook:
        rm-safely-uninstall

      The hook will intercept 'rm' commands and backup files to /tmp/.rm-trash
      before deletion. Use 'rm --rm' to bypass the safety and delete directly.

      Additional commands:
        rm --list-trash    Show trash contents
        rm --empty-trash   Empty the trash directory
        rm --help          Show help information
    EOS
  end

  test do
    system "#{bin}/rm-safely", "status"
  end
end
