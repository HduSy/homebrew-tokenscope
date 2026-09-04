cask "tokenscope" do
  version "1.0.5"
  sha256 "43d5c314f267278faa25983a7756e32ac6e838988a1ea7db3952e9ba5bd153b5"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.5/Tokenscope_1.0.5_universal.dmg"
  name "Tokenscope"
  desc "macOS menu-bar dashboard for Claude CLI token usage"
  homepage "https://github.com/HduSy/tokenscope"

  depends_on macos: :catalina

  app "Tokenscope.app"

  # Unsigned/unnotarized build: strip the quarantine flag Homebrew
  # adds so the app opens without the "Apple cannot verify" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Tokenscope.app"],
                   sudo: false
  end
end
