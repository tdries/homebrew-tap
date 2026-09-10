# Homebrew formula for POPR. Lives in tdries/homebrew-tap as Formula/popr.rb;
# .github/workflows/release.yml rewrites url and sha256 on every tagged release.
class Popr < Formula
  desc "Clickable macOS notifications when a Claude Code session finishes or needs you"
  homepage "https://github.com/tdries/td-claude-plugin-popr"
  url "https://github.com/tdries/td-claude-plugin-popr/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "76dd2ffcfb288624c2ebc2a95b4b6befb464c877917b53569f2d8b2c3b37fbd5"
  license "MIT"

  depends_on :macos
  depends_on "jq"
  depends_on "terminal-notifier"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/popr"
  end

  def caveats
    <<~EOS
      Register the Claude Code hooks:
        popr install

      Then allow banners in System Settings > Notifications > terminal-notifier,
      and set the style to Persistent.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/popr version")
  end
end
