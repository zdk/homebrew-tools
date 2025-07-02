class RmSafely < Formula
  desc 'Safe rm command that backs up files to trash before deletion'
  homepage 'https://github.com/zdk/rm-safely'
  url 'https://github.com/zdk/rm-safely/archive/refs/heads/main.tar.gz'
  version '1.1.1'
  sha256 '57bef7e3ff0c9c070b5556ede15f000a6d33a982786726fb2f8d33b73b2cc157'
  license 'MIT'

  def install
    bin.install 'rm-safely.sh' => 'rm-safely'

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
      After rm-safely is installed via brew.
      To use it, please run the following command:

      ➡️  rm-safely install

      Then reload your shell:

          source ~/.zshrc  # for zsh
          source ~/.bashrc # for bash
    EOS
  end

  test do
    system "#{bin}/rm-safely", 'status'
  end
end
