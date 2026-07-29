cask "reticle-mlx" do
  version "0.12.0"
  sha256 "9046de6be7f15b4dbe2e315b4eef180f954d585a20a0cfb0fa0a68a46babc475"

  url "https://github.com/roboalchemist/reticle-mlx/releases/download/v#{version}/Reticle-MLX-#{version}.dmg"
  name "Reticle MLX"
  desc "Menu-bar manager for local MLX code-completion models"
  homepage "https://github.com/roboalchemist/reticle-mlx"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Reticle MLX.app"
  command_wrapper "reticle-mlx",
                  content: <<~SH
                    #!/bin/sh
                    exec /bin/sh '#{appdir}/Reticle MLX.app/Contents/Resources/reticle-mlx' "$@"
                  SH
  command_wrapper "reticle-mtplx",
                  content: <<~SH
                    #!/bin/sh
                    exec /bin/sh '#{appdir}/Reticle MLX.app/Contents/Resources/reticle-mtplx' "$@"
                  SH

  zap trash: [
    "~/Library/Preferences/io.github.roboalchemist.reticle-mlx.plist",
    "~/Library/Saved Application State/io.github.roboalchemist.reticle-mlx.savedState",
  ]
end
