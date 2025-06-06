class RmHook < Formula
  desc "Safe rm command that backs up files to trash before deletion"
  homepage "https://github.com/zdk/rm-hook"
  url "https://github.com/zdk/rm-hook/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  sha256 "5659068d2f7fd82a7239300badede4e305050e380bad8bdbd30a1558df10ed15"
  license "MIT"

  def install
    bin.install "rm-hook.sh" => "rm-hook"

    # Create a wrapper script for easier integration
    (bin / "rm-hook-install").write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-hook" install "$@"
    EOS

    (bin / "rm-hook-uninstall").write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-hook" uninstall "$@"
    EOS

    chmod 0o755, bin / "rm-hook-install"
    chmod 0o755, bin / "rm-hook-uninstall"
  end

  def caveats
    <<~EOS
      To install the rm hook:
        rm-hook-install

      To uninstall the rm hook:
        rm-hook-uninstall

      The hook will intercept 'rm' commands and backup files to /tmp/.rm-trash
      before deletion. Use 'rm --rm' to bypass the safety and delete directly.

      Additional commands:
        rm --list-trash    Show trash contents
        rm --empty-trash   Empty the trash directory
        rm --help          Show help information
    EOS
  end

  test do
    system "#{bin}/rm-hook", "status"
  end
end
