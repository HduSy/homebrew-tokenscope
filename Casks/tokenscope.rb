cask "tokenscope" do
  version "1.0.4"
  sha256 "c38ab19e67898d35f69b4ba6400f99d7a78e850eb416c0584573714b13f7c4ca"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.4/Tokenscope_1.0.4_universal.dmg"
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
