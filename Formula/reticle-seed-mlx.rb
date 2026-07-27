class ReticleSeedMlx < Formula
  desc "Install and operate a local Seed-Coder MLX autocomplete service for Reticle"
  homepage "https://github.com/roboalchemist/reticle"
  url "https://github.com/roboalchemist/reticle/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a4397fd7868ec4939ca6ba30605c5e542d47e3eb694e8a44b6a3f11826f09df6"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "python@3.12"

  def install
    bin.install "scripts/seed-mlx-service" => "reticle-seed-mlx"
  end

  def caveats
    <<~EOS
      Install the tested MLX runtime, optimized Seed-Coder model, and user service:

        reticle-seed-mlx install

      Then monitor it with:

        reticle-seed-mlx status
        reticle-seed-mlx doctor
        reticle-seed-mlx monitor
    EOS
  end

  test do
    output = shell_output("#{bin}/reticle-seed-mlx --help")
    assert_match "Usage: reticle-seed-mlx COMMAND", output
    assert_match "RETICLE_SEED_PROMPT_CACHE_SIZE", output
    assert_match "RETICLE_SEED_MLX_VERSION", output
    assert_match "RETICLE_SEED_SKIP_FIM_WARMUP", output
  end
end
