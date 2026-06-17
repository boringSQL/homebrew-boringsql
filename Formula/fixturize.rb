class Fixturize < Formula
  desc "Extract referentially-intact subsets from PostgreSQL, anonymize PII, and seed environments"
  homepage "https://github.com/boringSQL/fixturize"
  url "https://github.com/boringSQL/fixturize/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "14e36e251aa9be5ac71c6706da82fa783ac0fe02355f4fd4cb2a802c26f1dfdb"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/fixturize/cmd.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fixturize --version")
  end
end
