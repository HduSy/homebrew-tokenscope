cask "tokenscope" do
  version "0.1.12"
  sha256 "84e8506994ededbcd2a4ec775218ed37605a5f31f282bd455b778120eae258f6"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.12/Tokenscope_0.1.12_universal.dmg"
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
