class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringSQL/regresql"
  version "2.1.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-apple-darwin.tar.xz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-apple-darwin.tar.xz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    end
  end

  def install
    bin.install "regresql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/regresql --version")
  end
end
