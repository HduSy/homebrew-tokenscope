cask "tokenscope" do
  version "0.1.18"
  sha256 "59d0c2ad4061e5370539c811a5f59c7cb4ae5027d7afaf534461e63243b77961"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.18/Tokenscope_0.1.18_universal.dmg"
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
