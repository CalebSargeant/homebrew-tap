class Transcribe < Formula
  desc "Video/audio transcription with auto-watch, OpenAI summarization, and Slack notifications"
  homepage "https://github.com/calebsargeant/transcribe"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.6/transcribe-macos-arm64"
      sha256 "e3bf8eab20ea0db4a319b5fcc2c0e69dc994dccfaf921b9ee542d91f7b9d3737"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.6/transcribe-macos-x86_64"
      sha256 "8f5bc1d65e2ef915be679ee1e4fc7a0cb4b0a44d2bad2c354708f5add370671c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.6/transcribe-linux-arm64"
      sha256 "9af07f2b0030c7a3d9f80dbabc8a35fe04524a8a6176781c51157a65567a9642"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.6/transcribe-linux-x86_64"
      sha256 "f18310e7d9133df49139d26ea7199045181ededb2ffd1b593ecffd712e7be2d5"
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
