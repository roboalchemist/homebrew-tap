class DatadogCli < Formula
  desc "Read-only CLI for querying Datadog APIs"
  homepage "https://github.com/roboalchemist/datadog-cli"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.10/datadog-cli_0.1.10_darwin_amd64.tar.gz"
      sha256 "7321b68217f8c8680057642571178fd76384f322dca66522fdd6081dfbbb4ea9"
    end
    on_arm do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.10/datadog-cli_0.1.10_darwin_arm64.tar.gz"
      sha256 "596d9f4211856769a5ee24be3763fa1debb33fb203227dbd5b602dd9dfab4120"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.10/datadog-cli_0.1.10_linux_amd64.tar.gz"
      sha256 "62827f444c5b9765c840d5b5e0560723e07434a084e7fd8616ce8b33213e723d"
    end
    on_arm do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.10/datadog-cli_0.1.10_linux_arm64.tar.gz"
      sha256 "263938605d13bd9e5aa4c44a6c8a8eef2b6389ed182576ec1e7746f0ccb8bb33"
    end
  end

  def install
    bin.install "datadog-cli"
  end

  test do
    assert_match "datadog-cli version", shell_output("#{bin}/datadog-cli --version")
  end
end
