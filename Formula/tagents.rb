class Tagents < Formula
  desc "Manage a fleet of AI agent sessions running in tmux, locally and over SSH"
  homepage "https://github.com/roboalchemist/tagents"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.9/tagents_darwin_arm64.tar.gz"
      sha256 "ac6daa1aecc79d57ed05f0d4f47411d81afbb815aae94aebaf78955630ad3254"
    else
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.9/tagents_darwin_amd64.tar.gz"
      sha256 "567922bdc1fe8d546d3d42f437c5045b85ff1cb6979c4da36e801fcd0b6a2565"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.9/tagents_linux_arm64.tar.gz"
      sha256 "c8d0d5e75b686fb8abb6fd8bec14f9d3ac5d1cc44bc5950f02fd792be2fa0799"
    else
      url "https://github.com/roboalchemist/tagents/releases/download/v0.1.9/tagents_linux_amd64.tar.gz"
      sha256 "1527d3ca6fdebc8059e2225f6237cbd3dfebd0b300f5e3f7663d64e748de52ec"
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
