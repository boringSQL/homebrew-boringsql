class Dryrun < Formula
  desc "PostgreSQL schema intelligence MCP server with offline linting, migration safety analysis, and query validation"
  homepage "https://github.com/boringSQL/dryrun"
  url "https://github.com/boringSQL/dryrun/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "b8c56a0c2066694775ba26acca9b26d0ef221bb7fe89ff666cbd3a4f93c956a9"
  license "BSD-2-Clause"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/dry_run_cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dryrun --version")
  end
end
