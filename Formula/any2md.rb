class Any2md < Formula
  desc "Convert any media, document, or data format to markdown — local AI on Apple Silicon"
  homepage "https://github.com/roboalchemist/any2md"
  url "https://github.com/roboalchemist/any2md/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "baafd3a3fd8fc39c755036119fcefb9efda791b0cc527d4bbba3555b5afee5af"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    uv = Formula["uv"].opt_bin/"uv"

    # Install typer and all transitive deps to libexec/vendor
    system uv, "pip", "install",
           "--python=#{python}",
           "--target=#{libexec}/vendor",
           "typer>=0.9.0",
           "typing-extensions"

    # Install the package itself
    libexec.install Dir["src/any2md"]

    # Create wrapper script
    (bin/"any2md").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:#{libexec}:$PYTHONPATH"
      exec "#{python}" -m any2md.cli "$@"
    EOS
  end

  def caveats
    <<~EOS
      any2md base install handles zero-dep converters (csv, data, db, nb, eml, org, tex, man).

      For AI-powered converters, install optional deps:

        # Audio/video transcription
        uv pip install "mlx-audio[stt]" yt-dlp

        # PDF extraction
        uv pip install pymupdf4llm

        # Image OCR (Qwen3.5 via mlx-vlm)
        uv pip install mlx-vlm

        # Web page conversion (ReaderLM-v2)
        uv pip install mlx-lm httpx

        # Office documents
        uv pip install markitdown

      Pre-download AI models:
        any2md --help
    EOS
  end

  test do
    assert_match "any2md", shell_output("#{bin}/any2md --help 2>&1")
  end
end
