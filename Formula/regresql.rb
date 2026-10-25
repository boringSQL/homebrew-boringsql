class Regresql < Formula
  desc "Regression testing framework for SQL queries targeting PostgreSQL databases"
  homepage "https://github.com/boringSQL/regresql"
  version "2.1.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-apple-darwin.tar.xz"
      sha256 "9f58f1aa1f803b6e5dd1e0e0a2ce2613af45686639b65b78894ddc8d894ffd20"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-apple-darwin.tar.xz"
      sha256 "1a96e463d68d4027f3237644ee3cb1dd082dc0a2c86794d393031c38b0479582"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c2d79a423cf4677404c75ed868e20476e65946f19a10e40730548e8350174ba1"
    end
    on_intel do
      url "https://github.com/boringSQL/regresql/releases/download/v#{version}/regresql-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b38c2f11083cddc63410f66ebac3fd7ef72c6b06372680ceee87bb2e00720163"
    end
  end

  def install
    bin.install "regresql"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/regresql --version")
  end
end
