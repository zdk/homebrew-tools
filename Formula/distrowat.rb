class Distrowat < Formula
  desc "Command-line tool to fetch OS distribution information"
  homepage "https://github.com/zdk/distrowat"
  url "https://raw.githubusercontent.com/zdk/distrowat/refs/heads/main/distrowat"
  version "0.9.0"
  sha256 "b273584c80e7437472d226660997b6739e866bf2f240318b581f6064cd396e2b"
  license "MIT"

  def install
    bin.install "distrowat"
  end

  def caveats
    <<~EOS
      distrowat - Display OS distribution information

      Usage examples:
        distrowat all           Show all system information in a nice box
        distrowat name          Show distribution name only
        distrowat version       Show version only
        distrowat codename      Show codename only
        distrowat --json all    Output in JSON format
        distrowat --plain all   Output in plain text format

      The tool works on Linux, macOS, and other Unix-like systems.
    EOS
  end

  test do
    system "#{bin}/distrowat", "--version"
    system "#{bin}/distrowat", "name"
  end
end
