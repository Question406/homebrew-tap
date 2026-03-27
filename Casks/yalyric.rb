cask "yalyric" do
  version "0.2.1"
  sha256 "4291e4f78e8da61a5f9da1398bbdba35886067634643f98d138ccd97e54d8f42"

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
