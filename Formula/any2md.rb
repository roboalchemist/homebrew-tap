class Any2md < Formula
  desc "Convert any media, document, or data format to markdown — local AI on Apple Silicon"
  homepage "https://github.com/roboalchemist/any2md"
  url "https://github.com/roboalchemist/any2md/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ee77e799aa0f7742a7c4a89fdd59282a96acfc297705f5a2c2cd4b40b2dcdaf7"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Install the package and core dependencies to libexec
    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "--no-deps",
           "typer>=0.9.0",
           "typing-extensions",
           "click",
           "rich",
           "shellingham",
           "markdown-it-py",
           "mdurl",
           "Pygments"

    # Install the package itself
    libexec.install Dir["src/any2md"]

    # Create wrapper script
    (bin/"any2md").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:#{libexec}:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m any2md.cli "$@"
    EOS
  end

  def caveats
    <<~EOS
      any2md base install handles zero-dep converters (csv, data, db, nb, eml, org, tex, man).

      For AI-powered converters, install optional deps into the Homebrew Python:

        # Audio/video transcription
        pip3.12 install "mlx-audio[stt]" yt-dlp

        # PDF extraction
        pip3.12 install pymupdf4llm

        # Image OCR (Qwen3.5 via mlx-vlm)
        pip3.12 install mlx-vlm

        # Web page conversion (ReaderLM-v2)
        pip3.12 install mlx-lm httpx

        # Office documents
        pip3.12 install markitdown

      Pre-download AI models:
        python3.12 -c "from any2md.cli import app" && any2md --help
    EOS
  end

  test do
    assert_match "any2md", shell_output("#{bin}/any2md --help 2>&1")
  end
end
