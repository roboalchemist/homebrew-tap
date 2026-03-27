class DatadogCli < Formula
  desc "Read-only CLI for querying Datadog APIs"
  homepage "https://github.com/roboalchemist/datadog-cli"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.8/datadog-cli_0.1.8_darwin_amd64.tar.gz"
      sha256 "0bdc326b57161f35f54312f8ad2b7c40990c7f32a435b75784670794e93734fc"
    end
    on_arm do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.8/datadog-cli_0.1.8_darwin_arm64.tar.gz"
      sha256 "c9dbfb4ada00bbe83234bd19f4728c71c8e81e269a3317696dceeb18030708b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.8/datadog-cli_0.1.8_linux_amd64.tar.gz"
      sha256 "5ab23b1357db4bbb0c00510fe93b4ccfe0c975da9846c0b7bc4c9824bc82a353"
    end
    on_arm do
      url "https://github.com/roboalchemist/datadog-cli/releases/download/v0.1.8/datadog-cli_0.1.8_linux_arm64.tar.gz"
      sha256 "2bdc914b2dd48acbfcfc07d58cef0fd01a5480747efdc5d744d4afd2b5488b2e"
    end
  end

  def install
    bin.install "datadog-cli"
  end

  test do
    assert_match "datadog-cli version", shell_output("#{bin}/datadog-cli --version")
  end
end
