cask "tokenscope" do
  version "0.1.9"
  sha256 "951989e433d9a80341d534ec7e748ef49f19bc95ad8eda6bd65b8094869522a7"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.9/Tokenscope_0.1.9_universal.dmg"
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
