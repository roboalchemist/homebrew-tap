class DesearchCli < Formula
  desc "CLI for Desearch AI - contextual AI search across web, HN, Reddit, Wikipedia, YouTube, Twitter, arXiv"
  homepage "https://github.com/roboalchemist/desearch-cli"
  url "https://github.com/roboalchemist/desearch-cli.git", tag: "v0.1.8", using: :git
  version "0.1.8"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/roboalchemist/desearch-cli/cmd.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "-o", bin/"desearch"
  end

  test do
    assert_match "desearch", shell_output("#{bin}/desearch --help 2>&1")
    assert_match version.to_s, shell_output("#{bin}/desearch version 2>&1")
  end
end
