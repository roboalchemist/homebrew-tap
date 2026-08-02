class Council < Formula
  desc "Query multiple AI CLI coding assistants in parallel and compare responses"
  homepage "https://github.com/roboalchemist/council"
  url "https://github.com/roboalchemist/council.git", tag: "v0.2.14", using: :git
  version "0.2.14"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.mkpath
    system "cp", "-R", *Dir.glob("{*,.*}").reject { |f| %w[. .. .git __pycache__].include?(f) }, libexec

    system Formula["python@3.12"].opt_bin/"pip3.12", "install",
           "--target=#{libexec}/vendor",
           "click>=8.0"

    (bin/"council").write <<~EOS
      #!/bin/bash
      export PYTHONPATH="#{libexec}/vendor:#{libexec}:$PYTHONPATH"
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/council.py" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Council queries multiple AI CLI tools in parallel:
        claude, gemini (3 Pro), codex, kimicode (K3), cursor-agent

      Usage:
        council "Review this code"              # Default: read-only mode
        council --yolo "Fix all bugs"           # Unrestricted mode
        council --locked "Explain this"         # No shell access
        council --use-cursor "Compare options"  # Use cursor-agent backend
        council doctor                          # Check tool health
    EOS
  end

  test do
    assert_match "COUNCIL", shell_output("#{bin}/council --help 2>&1")
  end
end
