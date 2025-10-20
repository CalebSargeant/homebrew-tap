# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class ExampleTool < Formula
  desc "Example CLI tool - replace with your tool's description"
  homepage "https://github.com/CalebSargeant/example-tool"
  url "https://github.com/CalebSargeant/example-tool/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # Optional: specify dependencies
  # depends_on "python@3.11" => :build
  # depends_on "node@18"

  def install
    # For compiled languages (Go, Rust, C++):
    # system "make", "install", "PREFIX=#{prefix}"
    
    # For scripting languages:
    # bin.install "example-tool"
    
    # Example for a simple script installation:
    bin.install "bin/example-tool" if File.exist?("bin/example-tool")
    
    # Install man pages if they exist
    # man1.install "man/example-tool.1" if File.exist?("man/example-tool.1")
  end

  test do
    # Test installation
    system "#{bin}/example-tool", "--version"
  end
end
