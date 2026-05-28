class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  version "0.8.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-apple-darwin.tar.xz"
      sha256 "498266df27d30170fc9de7cdf76546d1a3a8d5a2d1d8a127c6709ce33484013e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "aed41ab34683d6964be245f71b07e772cbba78d11fbbc6b09f224d6aeb564d38"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a6897b6b2b55233cf806f5449e5d236316cc95b146e71c51cf0defcde387574a"
    end
  end

  def install
    bin.install "dryrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
