cask "tokenscope" do
  version "0.1.11"
  sha256 "a8842348f93c0b400440865413fdd83fc37e967e3fc1498964ee6512853e70fe"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.11/Tokenscope_0.1.11_universal.dmg"
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
