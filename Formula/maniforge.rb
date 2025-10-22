class Maniforge < Formula
  desc "Terraform-like tool for managing Kubernetes applications"
  homepage "https://github.com/calebsargeant/maniforge"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-macos-arm64"
      sha256 "82a2fdd09a6813951afea743ba29253bf4212a22131aab09cfca7e8387082c27" # Will be calculated from release binary
    else
      url "https://github.com/calebsargeant/maniforge/releases/download/v1.1.1/maniforge-macos-x86_64"
      sha256 "af2696c2d4dc13de62afa08d0766851f7ebef243470f901c46e9e61e4c8eea65" # Will be calculated from release binary
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
