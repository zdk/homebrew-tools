class RmSafely < Formula
  desc 'Safe rm command that backs up files to trash before deletion'
  homepage 'https://github.com/zdk/rm-safely'
  url 'https://github.com/zdk/rm-safely/archive/refs/heads/main.tar.gz'
  version '1.0.7'
  sha256 '5f901c58c06532711215fadd69738312833aa3c04ea9fef20d92511c8ea287b5'
  license 'MIT'

  def install
    bin.install 'rm-safely.sh' => 'rm-safely'

    # Create a wrapper script for easier integration
    (bin / 'rm-safely-install').write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-safely" install "$@"
    EOS

    (bin / 'rm-safely-uninstall').write <<~EOS
      #!/bin/bash
      exec "#{bin}/rm-safely" uninstall "$@"
    EOS

    chmod 0o755, bin / 'rm-safely-install'
    chmod 0o755, bin / 'rm-safely-uninstall'
  end

  def caveats
    <<~EOS
      Files deleted with 'rm' will be moved to ~/.local/share/Trash

      Useful commands:
        rm --list-trash      # Show trash contents
        rm --show-trash-path # Show trash directory path
        rm --empty-trash     # Clear trash directory
        rm --rm file.txt     # Permanently delete (bypass trash)
        rm --help            # Show all options

    EOS
  end

  test do
    system "#{bin}/rm-safely", 'status'
  end
end
