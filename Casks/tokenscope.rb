cask "tokenscope" do
  version "0.1.5"
  sha256 "4e862a3a2b08664352ff80e29762e723a66fd04dce0d209bfecc157605d3f0ff"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.5/Tokenscope_0.1.5_universal.dmg"
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
