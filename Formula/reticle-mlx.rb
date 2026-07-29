class ReticleMlx < Formula
  desc "Install and operate local MLX code-completion models for Reticle"
  homepage "https://github.com/roboalchemist/reticle-mlx"
  url "https://github.com/roboalchemist/reticle-mlx/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "a8bfa1fbf38543e6916a8bae161298d802bfd2fac0ca09e141f28afc6e66b70f"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "scripts/reticle-mlx"
  end

  def caveats
    <<~EOS
      Install the tested MLX runtime, selected completion model, and user service:

        reticle-mlx install

      Seed-Coder 8B is the default quality preset. Configure another model with
      RETICLE_MLX_MODEL and its matching RETICLE_MLX_FIM_FORMAT.

      Monitor the service with:

        reticle-mlx status
        reticle-mlx doctor
        reticle-mlx monitor
    EOS
  end

  test do
    output = shell_output("#{bin}/reticle-mlx --help")
    assert_match "Usage: reticle-mlx COMMAND", output
    assert_match "RETICLE_MLX_MODEL", output
    assert_match "RETICLE_MLX_FIM_FORMAT", output
    assert_match "RETICLE_MLX_PROMPT_CACHE_SIZE", output
  end
end
