class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringSQL/regresql"
  version "2.0.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-apple-darwin.tar.xz"
      sha256 "6fb958eb35592799f9e2f342a1e257de42f97f8bf3e45430ed6ac5bcd3ac81f1"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-apple-darwin.tar.xz"
      sha256 "bca5f9f317ac2a9412406e45a72690afb5d8cbd866d78c17513d777f3b040b86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a12b427da3b7b7ad984c5ee5c142c3b07cfa9f6d897eb612b6e1510dc434cad2"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f739540ec9b023edf83cc4a54632d137386456e16113e71699ff394b60bf294"
    end
  end

  def install
    bin.install "regresql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/regresql --version")
  end
end
