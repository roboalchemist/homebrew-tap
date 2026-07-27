class ReticleMlx < Formula
  desc "Install and operate local MLX code-completion models for Reticle"
  homepage "https://github.com/roboalchemist/reticle-mlx"
  url "https://github.com/roboalchemist/reticle-mlx/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "402244cd4958db316204fc728e9dfeab8b4d1bef74a2c5fd8b8d5bfc77c44072"
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
