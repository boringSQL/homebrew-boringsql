class Qshape < Formula
  desc "AST-level canonicalization and fingerprinting of PostgreSQL queries"
  homepage "https://github.com/boringsql/qshape"
  version "0.1.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "qshape"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qshape version")
  end
end
