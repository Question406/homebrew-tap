cask "yalyric" do
  version "0.2.5"
  sha256 "a466e394dfb290f4cdf7e8bc86ed2de999400507cea26746e7e309f835a64b46"

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
