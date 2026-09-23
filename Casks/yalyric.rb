cask "yalyric" do
  version "0.4.0"
  sha256 "924091ab8dfcaef417dc1a87378463b12c42b9c89a6d4bf608a7f336ebee62e9"

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
