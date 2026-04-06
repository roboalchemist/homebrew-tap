# typed: false
# frozen_string_literal: true

class InnertubeGo < Formula
  desc "Go client for YouTube's InnerTube API with authenticated cookie-based access"
  homepage "https://github.com/roboalchemist/innertube-go"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/roboalchemist/innertube-go/releases/download/v0.1.0/innertube_0.1.0_darwin_amd64.tar.gz"
      sha256 "f9c0b8a0d1ae53ae70535558c6dd71177ce480a6730cdd80553f23b4c5452b75"
    end
    if Hardware::CPU.arm?
      url "https://github.com/roboalchemist/innertube-go/releases/download/v0.1.0/innertube_0.1.0_darwin_arm64.tar.gz"
      sha256 "83f1883aa20d294718ab6c59cfae606347f5b14ec930e7419955550bdba68e8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/roboalchemist/innertube-go/releases/download/v0.1.0/innertube_0.1.0_linux_amd64.tar.gz"
      sha256 "7d757013765af3682975b2e249a0282d377e6dab5bd68d530965803ad48b4a01"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/roboalchemist/innertube-go/releases/download/v0.1.0/innertube_0.1.0_linux_arm64.tar.gz"
      sha256 "baab1e95d9b062fc8c68bab3694f8ab14e3898acc1734855aa4e6c6ea5a4c390"
    end
  end

  def install
    bin.install "innertube/innertube"
  end

  test do
    assert_match "InnerTube API", shell_output("#{bin}/innertube --help 2>&1")
  end
end
