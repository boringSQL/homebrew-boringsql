class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  version "0.13.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-apple-darwin.tar.xz"
      sha256 "80ba53ca192fc099e50a8fab9484de706b9050282514cf9dd278fcff42efc161"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3ed687d5f856f1a8192980fe80d3ac2e6db59bda3465f583fb4344e4257343a0"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f7cdb10c0d8966db1831f92d06e00ba56d6cca634d467a1d01897a19e06a71b2"
    end
  end

  def install
    bin.install "dryrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
