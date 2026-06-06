cask "tokenscope" do
  version "0.1.2"
  sha256 "a4bfaaa7ad15a8f68c4cb4631d726b5218c954dcf3796b5129b37e1b7b4046bf"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.2/Tokenscope_0.1.2_universal.dmg"
  name "Tokenscope"
  desc "macOS menu-bar dashboard for Claude CLI token usage"
  homepage "https://github.com/HduSy/tokenscope"

  depends_on macos: ">= :catalina"

  app "Tokenscope.app"

  # Unsigned/unnotarized build: strip the quarantine flag Homebrew
  # adds so the app opens without the "Apple cannot verify" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Tokenscope.app"],
                   sudo: false
  end
end
