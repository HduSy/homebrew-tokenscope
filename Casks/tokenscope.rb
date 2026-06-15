cask "tokenscope" do
  version "0.1.16"
  sha256 "c5b6cb7f43a100d0118b5cce65df3e8b97d0dfe7837b264ed29576a3b758100e"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.16/Tokenscope_0.1.16_universal.dmg"
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
