class Maniforge < Formula
  desc "Terraform-like tool for managing Kubernetes applications"
  homepage "https://github.com/calebsargeant/maniforge"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.2.0/maniforge-macos-arm64"
      # SHA256 calculated from release binary
      sha256 "17afa1a8b6a5b0fe784dd3c1c56b3e45d64d16150de339808693615cfc778713"
    else
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.2.0/maniforge-macos-x86_64"
      # SHA256 calculated from release binary
      sha256 "00129b95cb775318cad7260c3a38b785a4d3ec1431dc95fe41146ccf7dbfcf76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-linux-arm64"
      # SHA256 calculated from release binary
      sha256 "2d8d3bc31ce7c2460dadfcb711ff7f3ff0352809b36a72131f9b1fa5ea610270"
    else
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-linux-x86_64"
      # SHA256 calculated from release binary
      sha256 "646e71503e3cd4feb68474abb96972278dc6f6e30724b3270b457b2289d3a727"
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
