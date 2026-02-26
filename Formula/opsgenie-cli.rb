class OpsgenieCli < Formula
  desc "CLI for the OpsGenie REST API v2"
  homepage "https://github.com/roboalchemist/opsgenie-cli"
  url "https://github.com/roboalchemist/opsgenie-cli.git", tag: "v0.2.0", using: :git
  version "0.2.0"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match "opsgenie-cli", shell_output("#{bin}/opsgenie-cli --version")
  end
end
