cask "reticle-mlx" do
  version "0.12.1"
  sha256 "2c810abbe86ac514eec0c342ee7a2fc89a7bda434a1dc024d7f29416038e3724"

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
