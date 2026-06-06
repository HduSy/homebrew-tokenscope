cask "tokenscope" do
  version "0.1.4"
  sha256 "df1aee488e9358b429ba6ac1ace8b18cacc892a325f915ff1da64dae50cefe35"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.4/Tokenscope_0.1.4_universal.dmg"
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
