class Fixturize < Formula
  desc "Extract referentially-intact subsets from PostgreSQL, anonymize PII, and seed environments"
  homepage "https://github.com/boringSQL/fixturize"
  url "https://github.com/boringSQL/fixturize/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "2e2d8b2f964bf34c9e73d9388ef2bd610d06877dc1265a695953abb1b7e06134"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/fixturize/cmd.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fixturize --version")
  end
end
