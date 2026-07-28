cask "reticle-mlx" do
  version "0.9.0"
  sha256 "cd7543e247e0aedb864f5d1f43a38cc0aa16fa75596eb4c021007c6a8b0eadcf"

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
