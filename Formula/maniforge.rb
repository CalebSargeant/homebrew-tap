class Maniforge < Formula
  desc "Terraform-like tool for managing Kubernetes applications"
  homepage "https://github.com/calebsargeant/maniforge"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.2.0/maniforge-macos-arm64"
      sha256 "17afa1a8b6a5b0fe784dd3c1c56b3e45d64d16150de339808693615cfc778713" # Will be calculated from release binary
    else
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.2.0/maniforge-macos-x86_64"
      sha256 "00129b95cb775318cad7260c3a38b785a4d3ec1431dc95fe41146ccf7dbfcf76" # Will be calculated from release binary
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-linux-arm64"
      sha256 "" # Will be calculated from release binary
    else
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-linux-x86_64"
      sha256 "" # Will be calculated from release binary
    end
  end

  def install
    # The downloaded file is already the executable
    bin.install Dir["maniforge-*"].first => "maniforge"
  end

  test do
    system "#{bin}/maniforge", "--help"
  end
end
