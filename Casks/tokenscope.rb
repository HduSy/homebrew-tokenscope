cask "tokenscope" do
  version "0.1.8"
  sha256 "43192d654ead3e7c297b0c94e11bba30a65ba9418c2c45ac9a7d29db868a2980"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.8/Tokenscope_0.1.8_universal.dmg"
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
