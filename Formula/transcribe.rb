class Transcribe < Formula
  desc "Video/audio transcription with auto-watch, OpenAI summarization, and Slack notifications"
  homepage "https://github.com/calebsargeant/transcribe"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.7/transcribe-macos-arm64"
      sha256 "8616d303460199aad5ad0c13d5143255336071ae89371c33aaf7129e01e70e3e"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.7/transcribe-macos-x86_64"
      sha256 "96e28532731957072a27d8faa9b4a3329b9ce5521a0476d7810a3d97102da7e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.7/transcribe-linux-arm64"
      sha256 "05aa0d82eee776e4eaf0a8cd5d78637519bc2636c53ac464d9a2656e1094a84b"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.7/transcribe-linux-x86_64"
      sha256 "ffbbb2c17db2a80d06b5e55a1efff149dd00cc84c37bf12fbd4844362598ec35"
    end
  end

  depends_on "whisper-cpp"
  depends_on "ffmpeg"

  def install
    bin.install Dir["transcribe-*"].first => "transcribe"
  end

  def caveats
    <<~EOS
      To configure transcribe with your OpenAI API key and Slack webhook:
        transcribe config

      To setup automatic transcription of videos in ~/Movies:
        transcribe setup-daemon
        launchctl load ~/Library/LaunchAgents/com.calebsargeant.transcribe.plist

      Configuration file is located at:
        ~/.transcribe/config.yaml
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/transcribe --help")
  end
end
