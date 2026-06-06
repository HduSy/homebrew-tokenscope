cask "tokenscope" do
  version "0.1.6"
  sha256 "96b895f6fd5246c86fc93ff749644b054c5b30ac0108c8924c756e89bb4c019e"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.6/Tokenscope_0.1.6_universal.dmg"
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
