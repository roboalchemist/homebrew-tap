class LinearCli < Formula
  desc "Comprehensive command-line interface for Linear's API"
  homepage "https://github.com/roboalchemist/linear-cli"
  url "https://github.com/roboalchemist/linear-cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "41e47d3770531345f7e10c76f372d15f4c927cf018e720586f9e9f105941ad99"
  license "MIT"
  head "https://github.com/roboalchemist/linear-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/roboalchemist/linear-cli/cmd.version=#{version}")
  end

  test do
    assert_match "linear-cli version #{version}", shell_output("#{bin}/linear-cli --version")
    assert_match "A comprehensive CLI tool for Linear", shell_output("#{bin}/linear-cli --help")
  end
end
