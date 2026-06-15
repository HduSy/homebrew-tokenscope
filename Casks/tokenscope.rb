cask "tokenscope" do
  version "0.1.17"
  sha256 "e9401772a0287ede76065eb2d5cc71b6769b5b37fc376ac99fab20c8927b1edc"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.17/Tokenscope_0.1.17_universal.dmg"
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
