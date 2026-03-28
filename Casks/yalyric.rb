cask "yalyric" do
  version "0.2.3"
  sha256 "660f55ce2378d6110294a1900653acd30e7de89dc622db4a68fe58e95fbe604d"

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
