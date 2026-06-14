cask "tokenscope" do
  version "0.1.14"
  sha256 "c0826d2f5e5cc296f745dbfbb1464f916e223f49c730159f8a12e8fd96ab8577"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.14/Tokenscope_0.1.14_universal.dmg"
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
