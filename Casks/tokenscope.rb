cask "tokenscope" do
  version "0.1.15"
  sha256 "fb21f25737348483204927320622d198b472084f5f4280620f0625448f0cce34"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.15/Tokenscope_0.1.15_universal.dmg"
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
