class Transcribe < Formula
  desc "Video/audio transcription with auto-watch, OpenAI summarization, and Slack notifications"
  homepage "https://github.com/calebsargeant/transcribe"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.5/transcribe-macos-arm64"
      sha256 "e3e3fec49393501bed6fcf81f9e4e7645588fbccda9dcce9857cd6cba21df9fa"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.5/transcribe-macos-x86_64"
      sha256 "577d63db219cb1dd1f909d47b86e124bad1c5baee2d6d5d9300fb6508025bbad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.5/transcribe-linux-arm64"
      sha256 "178199b7e6e9e769b59faefc139c31b7bc474ae828ffb021f9ccfb40f93ebb62"
    else
      url "https://github.com/calebsargeant/transcribe/releases/download/v1.0.5/transcribe-linux-x86_64"
      sha256 "7362ce3b7838e0b0a38145a0fce7a41b4b37a2db7251518093ab1c15d8b94184"
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
