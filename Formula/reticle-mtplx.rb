class ReticleMtplx < Formula
  desc "Install and operate a local MTPLX autocomplete service for Reticle"
  homepage "https://github.com/roboalchemist/reticle"
  url "https://github.com/roboalchemist/reticle/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ac67cfa49c864ea25b6dbd43add4e7b6a9b65a6b3374fa0a89910d37e6ff51c0"
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
