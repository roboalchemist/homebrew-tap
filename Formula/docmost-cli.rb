class DocmostCli < Formula
  desc "CLI tool for interacting with the Docmost wiki API"
  homepage "https://github.com/roboalchemist/docmost-cli"
  url "https://github.com/roboalchemist/docmost-cli/archive/refs/heads/main.tar.gz"
  version "0.2.0"
  sha256 "79b19fe6dffbd07b44378eee27dec457d16b3274f66ca94f28314a3cdc02a627"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Install to libexec
    libexec.install Dir["*"]

    # Install Python dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "click>=8.1.0", "httpx>=0.27.0", "rich>=13.0.0", "pyyaml>=6.0.0"

    # Create wrapper script
    (bin/"docmost").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/src:#{libexec}/vendor:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m docmost.cli "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use docmost, authenticate with your Docmost instance:
        docmost login --url https://your-docmost-instance.com

      Or set environment variables:
        export DOCMOST_URL="https://your-docmost-instance.com/api"
        export DOCMOST_TOKEN="your-token"

      New in v0.2.0:
        - Working content support via 'docmost pages import' command
        - Enhanced 'docmost pages create --content' now works
        - Enhanced 'docmost pages update --content' now works
    EOS
  end

  test do
    assert_match "docmost", shell_output("#{bin}/docmost --help 2>&1")
  end
end
