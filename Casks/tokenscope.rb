cask "tokenscope" do
  version "0.1.3"
  sha256 "5dc3a2638f5e4873ae3e5988df13a426fb927d1d89976a5a402aeaf4ced08928"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.3/Tokenscope_0.1.3_universal.dmg"
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
