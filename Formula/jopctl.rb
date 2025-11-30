class Jopctl < Formula
  desc "CLI for the Joplin Data API with full CRUDL support"
  homepage "https://github.com/roboalchemist/jopctl"
  url "https://github.com/roboalchemist/jopctl/archive/refs/heads/main.tar.gz"
  version "0.2.0"
  sha256 "e95a4df5b4e7e7a354be52f9b12c49091f6765cd21eb5e784254cc19d1a854e6"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Copy the script to libexec
    libexec.install "jopctl.py"

    # Install Python dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "requests", "pyyaml", "click"

    # Create wrapper script
    (bin/"jopctl").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/jopctl.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To use jopctl, configure your Joplin API credentials:
        export JOPLIN_API_PORT=41184
        export JOPLIN_API_TOKEN="your-token"

      Get your token from: Joplin > Tools > Options > Web Clipper
    EOS
  end

  test do
    assert_match "CLI for the Joplin Data API", shell_output("#{bin}/jopctl --help 2>&1")
  end
end
