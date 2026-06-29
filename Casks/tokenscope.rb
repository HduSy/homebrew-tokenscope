cask "tokenscope" do
  version "1.0.1"
  sha256 "2b85c1236773e66508d589fac9d0bd21513b5a49cf3739f67d817ec6d92b1695"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.1/Tokenscope_1.0.1_universal.dmg"
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
