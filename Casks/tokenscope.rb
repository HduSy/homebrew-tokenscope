cask "tokenscope" do
  version "1.0.6"
  sha256 "f2323f9d85f31385b47f3402bff5a9306407a233c578d606fc42b72d399c0cd6"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.6/Tokenscope_1.0.6_universal.dmg"
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
