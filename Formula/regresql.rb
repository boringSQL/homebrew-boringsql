class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringsql/regresql"
  url "https://github.com/boringSQL/regresql/archive/refs/tags/v0.2.0-beta1.tar.gz"
  sha256 "1b03956a60c00b5efb8155462a2e65e7930f4e6bf69d188f5b8321c95efb36c3"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/regresql/cmd.version=#{version}")
  end

  test do
    assert_match "regresql version", shell_output("#{bin}/regresql --version")
  end
end
