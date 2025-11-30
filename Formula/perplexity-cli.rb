class PerplexityCli < Formula
  desc "Command-line client for the Perplexity AI API"
  homepage "https://github.com/roboalchemist/perplexity-cli"
  url "https://github.com/roboalchemist/perplexity-cli/archive/refs/heads/main.tar.gz"
  version "1.0.0"
  sha256 "8aca8d2e8fc05749c0c2422670e361b39d6a708456bce799721d2b8df26a1da5"
  license "MIT"

  depends_on "python@3.12"

  def install
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
