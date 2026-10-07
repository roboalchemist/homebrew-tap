class Tagents < Formula
  desc "Manage a fleet of AI agent sessions running in tmux, locally and over SSH"
  homepage "https://github.com/roboalchemist/tagents"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.8/tagents_darwin_arm64.tar.gz"
      sha256 "0b3c24c4b97b60fd0eff946406ffb44dcfb4c5022f59707c855e4e0bbe71efed"
    else
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.8/tagents_darwin_amd64.tar.gz"
      sha256 "2fb11f55447c539fb722bfc4daf891c6fd828a9bae49e120b7ab116567cef848"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.8/tagents_linux_arm64.tar.gz"
      sha256 "48db218493e693b41c707deb38d100c24427c28921f161ddcd8bc0e42bfc1598"
    else
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.8/tagents_linux_amd64.tar.gz"
      sha256 "d1094d5af95eed2dc0cd44a95d533aa1d8207af26420238a639d0bc9552579f3"
    end
  end

  def install
    bin.install "tagents"
    generate_completions_from_executable(bin/"tagents", "completion")
  end

  test do
    assert_match "tagents version", shell_output("#{bin}/tagents --version")
  end
end
