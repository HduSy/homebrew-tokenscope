cask "tokenscope" do
  version "1.0.3"
  sha256 "341f5a3b1862111358bf6058ebbf4af72930849a6b06a4197cca1637d434f182"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.3/Tokenscope_1.0.3_universal.dmg"
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
