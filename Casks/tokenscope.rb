cask "tokenscope" do
  version "0.1.13"
  sha256 "f6908e573886e16fb9abfca0b2e278a17d06a77dd21d493fbfab086a834447e6"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.13/Tokenscope_0.1.13_universal.dmg"
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
