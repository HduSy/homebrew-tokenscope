cask "tokenscope" do
  version "1.0.2"
  sha256 "4d0b64fd9875e800a02442282656f0218319ffea54f261ec9c7105e5f49ec510"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.2/Tokenscope_1.0.2_universal.dmg"
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
