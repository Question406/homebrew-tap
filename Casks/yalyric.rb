cask "yalyric" do
  version "0.3.2"
  sha256 "5dca88386e1a1dec6292fdd0070241c4b28d9a74f0b211005446fa8a3a6cf75c"

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
