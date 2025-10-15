class Distrowat < Formula
  desc "Command-line tool to fetch OS distribution information"
  homepage "https://github.com/zdk/distrowat"
  url "https://raw.githubusercontent.com/zdk/distrowat/refs/tags/v0.9.1/distrowat"
  version "0.9.1"
  sha256 "d73d17a4edb5fb46546288cc291b276f291ebbda9012a6f2be7555dbc3151708"
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
