class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  version "0.9.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-apple-darwin.tar.xz"
      sha256 "5b24af53904bea3da75bbc092f461ede977deb3b6f99e00c4c2df480570d5737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d87db819b62e33b118d6798e7152cda1dd3cde86df33d7e364fb921ee2cc705a"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f680a5121e230ec6806154b87b4a203515f4c048c577778bd13e608affc3302b"
    end
  end

  def install
    bin.install "dryrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
