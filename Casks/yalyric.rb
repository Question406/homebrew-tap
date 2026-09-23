cask "yalyric" do
  version "0.3.3"
  sha256 "dcbf00a56181179e3096321afb23e05df0c5c4fc3797705747db78fbf89461b8"

  url "https://github.com/Question406/yalyric/releases/download/v#{version}/yalyric-v#{version}-macos.zip"
  name "yalyric"
  desc "Yet Another Lyric sync for Spotify and Apple Music on macOS"
  homepage "https://github.com/Question406/yalyric"

  depends_on macos: :ventura

  app "yalyric.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/yalyric.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.yalyric.app.plist",
    "~/Library/Caches/yalyric",
    "~/Library/Logs/yalyric.log",
    "~/.config/yalyric",
  ]
end
