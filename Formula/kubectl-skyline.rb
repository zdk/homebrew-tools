class KubectlSkyline < Formula
  desc "Explore a Kubernetes cluster as an interactive 3D city"
  homepage "https://github.com/zdk/kubectl-skyline"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zdk/kubectl-skyline/releases/download/v0.1.4/kubectl-skyline_darwin_arm64.tar.gz"
      sha256 "45cc0dd10287d6cdaf08e7808381f5db77b81b5c4db0672d71f9af0c2125b313"
    end
    on_intel do
      url "https://github.com/zdk/kubectl-skyline/releases/download/v0.1.4/kubectl-skyline_darwin_amd64.tar.gz"
      sha256 "114f20504c3d90b06e1250f1703698330b6b1971883bde91583465e21e5c0b71"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zdk/kubectl-skyline/releases/download/v0.1.4/kubectl-skyline_linux_arm64.tar.gz"
      sha256 "7189e0eb0cc301009bc0cb6a3a17450ae70b406ab1fc04f3ab4817341dd92f12"
    end
    on_intel do
      url "https://github.com/zdk/kubectl-skyline/releases/download/v0.1.4/kubectl-skyline_linux_amd64.tar.gz"
      sha256 "280071e1a79f0727ff45f28b7b697fa9f9c03d6c5e16ca378146709212e7be19"
    end
  end

  def install
    bin.install "kubectl-skyline"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl-skyline --version")
  end
end
