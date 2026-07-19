cask "tokenscope" do
  version "1.0.5"
  sha256 "007886932d955af76258c0a2b50dd5f04354d57d8f2ec4dd1abf32e80fcd94b5"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.5/Tokenscope_1.0.5_universal.dmg"
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
