class Fixturize < Formula
  desc "Extract referentially-intact subsets from PostgreSQL, anonymize PII, and seed environments"
  homepage "https://github.com/boringSQL/fixturize"
  url "https://github.com/boringSQL/fixturize/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "665762c03d12a9289e35c057667711ca49eb1ac92458ea0364eed41d7f118307"
  license "BSD-2-Clause"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/boringsql/fixturize/cmd.version=#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fixturize --version")
  end
end
