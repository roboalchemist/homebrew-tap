class TavilyCli < Formula
  desc "Command-line interface for the Tavily AI search API"
  homepage "https://github.com/roboalchemist/tavily-cli"
  url "https://github.com/roboalchemist/tavily-cli/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  sha256 "e690741aba1bbd8d5530d001ec7293e51dcd24000e14be7a99f15076a1317026"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Copy the script to libexec
    libexec.install "tavily_cli.py"

    # Install Python dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "tavily-python",
           "click"

    # Create wrapper script
    (bin/"tavily").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/tavily_cli.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use tavily-cli, set your API key:
        export TAVILY_API_KEY="tvly-YOUR_API_KEY"

      Get your free API key at: https://app.tavily.com
    EOS
  end

  test do
    assert_match "Tavily CLI", shell_output("#{bin}/tavily --help 2>&1")
  end
end
