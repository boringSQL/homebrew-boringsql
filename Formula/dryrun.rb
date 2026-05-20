class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  version "0.7.1"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-apple-darwin.tar.xz"
      sha256 "4039d335a22311cc52ca1557bd1a5c8c1965a895739e6c7ecb6a1a3c5f0f08eb"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-apple-darwin.tar.xz"
      sha256 "4ab1d0b216dcb04b0dd0817f33e1f5c5da9042d2272969e34e3552ffbb4c5364"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ee9715b2d7fe6c648dc9e9031a343bd582a556025f2dedb58efbfd20a5b87a5e"
    end
    on_intel do
      url "https://github.com/boringSQL/dryrun/releases/download/v#{version}/dry_run_cli-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e9517ad1957686c4b5ba63ca4858a27220f27bdeccd700a1f0a8eca58494dcec"
    end
  end

  def install
    bin.install "dryrun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
