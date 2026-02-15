# typed: false
# frozen_string_literal: true

class ExaCli < Formula
  desc "CLI for the Exa AI search API"
  homepage "https://github.com/roboalchemist/exa-cli"
  version "0.1.0"

  on_macos do
    on_intel do
      url "https://github.com/roboalchemist/exa-cli/releases/download/v0.1.0/exa-cli_0.1.0_darwin_amd64.tar.gz"
      sha256 "bdf84a28a601e874c3d8c4c5ef26fd63e24be4a04afef8a8f05d358f4bfedeab"
    end
    on_arm do
      url "https://github.com/roboalchemist/exa-cli/releases/download/v0.1.0/exa-cli_0.1.0_darwin_arm64.tar.gz"
      sha256 "af926e45ec078d8d699865ed5b9afd9b75507aae0c844c5988c59e9e203c5b55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/roboalchemist/exa-cli/releases/download/v0.1.0/exa-cli_0.1.0_linux_amd64.tar.gz"
      sha256 "e7012144bd18a110dc19703f12a89ca88ffbcca1c7418eddb8265fa0e41585a2"
    end
    on_arm do
      url "https://github.com/roboalchemist/exa-cli/releases/download/v0.1.0/exa-cli_0.1.0_linux_arm64.tar.gz"
      sha256 "9dc18c3a7f0a2243d98c60ec896f4404eacf74582b3cb91a56ee31067c392f66"
    end
  end

  def install
    bin.install "exa"
  end

  test do
    assert_match "exa version", shell_output("#{bin}/exa --version")
  end
end
