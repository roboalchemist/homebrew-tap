cask "reticle-mlx" do
  version "0.8.1"
  sha256 "528a84d7d11ced030460f35f7f507329198e0fc40f31a31777bac5d0084d6334"

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
