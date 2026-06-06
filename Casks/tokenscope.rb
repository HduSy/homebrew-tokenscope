cask "tokenscope" do
  version "0.1.7"
  sha256 "98a8374ec53eedc4836dda3ede4c0d8ff42caaa7bf61dff57fa2fea91808b7a4"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.7/Tokenscope_0.1.7_universal.dmg"
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
