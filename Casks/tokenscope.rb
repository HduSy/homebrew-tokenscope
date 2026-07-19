cask "tokenscope" do
  version "1.0.5"
  sha256 "d40fa3acc80314228e1153904c6c7aa82d8ba89b5881b4c70726099b1633c5a8"

  url "https://github.com/HduSy/tokenscope/releases/download/v1.0.5/Tokenscope_1.0.5_universal.dmg"
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
