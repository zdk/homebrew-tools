class RmSafely < Formula
  desc "Safe rm command that backs up files to trash before deletion"
  homepage "https://github.com/zdk/rm-safely"
  url "https://github.com/zdk/rm-safely/archive/refs/tags/v1.5.0.tar.gz"
  version "1.5.0"
  sha256 "e9199de1a7d1ba92c35d228cbde69ab53383e2b0e0cad0f4deedf59ac79e74a8"
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
