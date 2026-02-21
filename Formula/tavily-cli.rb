class TavilyCli < Formula
  desc "Command-line interface for the Tavily AI search API"
  homepage "https://github.com/roboalchemist/tavily-cli"
  url "https://github.com/roboalchemist/tavily-cli/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "815adcabcdf6f8ad6b045bac6922ecf62bbd6caa99929e2d514c2d35356dec16"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Copy the script to libexec
    libexec.install "tavily_cli.py"

    # Install Python dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "tavily-python",
           "click",
           "requests"

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
