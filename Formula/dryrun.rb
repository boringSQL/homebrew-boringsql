class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  version "0.16.6"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-apple-darwin.tar.xz"
      sha256 "320d4d1ca6bc0cf8afaaea5c244bbe17993946090fe443d11c1ee09a7002db85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "bc9470480490fdaf784fc55ddc32fa3618d45c6d4f052b5c358e3134334acb13"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cd901078c804b8fd2cafb2366dfa13ae0373892c1a5189c24fff4970562c9009"
    end
  end

  def install
    bin.install "dryrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
