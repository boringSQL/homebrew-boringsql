class Fixturize < Formula
  desc "Extract referentially-intact subsets from PostgreSQL, anonymize PII, and seed environments"
  homepage "https://github.com/boringSQL/fixturize"
  url "https://github.com/boringSQL/fixturize/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "53490d01df5a04abd2d9ce90f919bb5bba6ee8f3931148a1a4a4792dbdb2b50c"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/fixturize/cmd.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fixturize --version")
  end
end
