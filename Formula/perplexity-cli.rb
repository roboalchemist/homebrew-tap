class PerplexityCli < Formula
  desc "Command-line client for the Perplexity AI API"
  homepage "https://github.com/roboalchemist/perplexity-cli"
  url "https://github.com/roboalchemist/perplexity-cli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "ad42cdf6185e3ff0de9f7b38896a31e184da1426cb19e4359329098ba4738c3a"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Extract staging directory (set by Homebrew's bottle DSL)
    staging = Dir.pwd

    # Remove Homebrew-contaminated .git so get_version() falls back to default
    rm_rf ".git"

    # Copy the script to libexec
    libexec.install "perplexity.py"

    # Install Python dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "requests"

    # Create wrapper script
    (bin/"perplexity").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/perplexity.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use perplexity-cli, set your API key:
        export PERPLEXITY_API_KEY="your-api-key"

      Get your API key from: https://www.perplexity.ai/settings/api
    EOS
  end

  test do
    assert_match "usage:", shell_output("#{bin}/perplexity --help 2>&1")
  end
end
