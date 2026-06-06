cask "tokenscope" do
  version "0.1.1"
  sha256 "4ec2fdc0e6d08b020fbe14bef11bf6e5cccd97bf21af5abc4edbcce6a92e83a3"

  url "https://github.com/HduSy/tokenscope/releases/download/v0.1.1/Tokenscope_0.1.1_universal.dmg"
  name "Tokenscope"
  desc "macOS menu-bar dashboard for Claude CLI token usage"
  homepage "https://github.com/HduSy/tokenscope"

  depends_on macos: ">= :catalina"

  app "Tokenscope.app"
end
