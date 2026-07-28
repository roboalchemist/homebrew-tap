class ReticleMtplx < Formula
  desc "Install and operate a local MTPLX autocomplete service for Reticle"
  homepage "https://github.com/roboalchemist/reticle-mlx"
  url "https://github.com/roboalchemist/reticle-mlx/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "c997c12438f421a970c009f5f8c2f1809cc5f3223afff9ff2f437738bd453433"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "scripts/mtplx-service" => "reticle-mtplx"
  end

  def caveats
    <<~EOS
      Install the official MTPLX runtime, verified 9B model, and user service:

        reticle-mtplx install

      Then monitor it with:

        reticle-mtplx status
        reticle-mtplx doctor
        reticle-mtplx monitor
    EOS
  end

  test do
    output = shell_output("#{bin}/reticle-mtplx --help")
    assert_match "Usage: reticle-mtplx COMMAND", output
    assert_match "MTPLX_CONTEXT_WINDOW", output
    assert_match "MTPLX_SKIP_FIM_WARMUP", output
  end
end
