cask "yalyric" do
  version "0.3.0"
  sha256 "36ed15571b0cd6cdab3c27cc4cbb3a55b38dda0542a12bef101b3eb397c342ff"

  url "https://github.com/Question406/yalyric/releases/download/v#{version}/yalyric-v#{version}-macos.zip"
  name "yalyric"
  desc "Yet Another Lyric sync for Spotify and Apple Music on macOS"
  homepage "https://github.com/Question406/yalyric"

  depends_on macos: ">= :ventura"

  app "yalyric.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/yalyric.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.yalyric.app.plist",
    "~/Library/Caches/yalyric",
    "~/Library/Logs/yalyric.log",
    "~/.config/yalyric",
  ]
end
