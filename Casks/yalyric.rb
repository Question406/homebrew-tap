cask "yalyric" do
  version "0.4.1"
  sha256 "330f3fea3841df02594a6e0422464c0f4c4b0235f14930632be34b7be62e1a11"

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
