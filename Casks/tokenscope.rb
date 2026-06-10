cask "tokenscope" do
  version "0.1.10"
  sha256 "ed8fe5e1ca90138b3638a42740f2cf9ffbb19a59e2904eb8ff909336a2bf01b0"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.10/Tokenscope_0.1.10_universal.dmg"
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
