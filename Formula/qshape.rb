class Qshape < Formula
  desc "AST-level canonicalization and fingerprinting of PostgreSQL queries"
  homepage "https://github.com/boringsql/qshape"
  version "0.1.0"
  license "BSD-2-Clause"

  on_macos do
    on_arm do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_darwin_arm64.tar.gz"
      sha256 "83752e4b2777262bc452b9095e1f262ef870d59818fd1589d8882dab1c693539"
    end
    on_intel do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_darwin_amd64.tar.gz"
      sha256 "c004e089018539327e9e9314a935f1abf959e5872b42708cb063f424fc376dd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_linux_arm64.tar.gz"
      sha256 "9ece2e94e589aadc47787925403340a64cd06113f3ca345df9a361f9f7d0a1be"
    end
    on_intel do
      url "https://github.com/boringSQL/qshape/releases/download/v#{version}/qshape_#{version}_linux_amd64.tar.gz"
      sha256 "02c77914258a1f8dd434062f228664034d301c3146c8e85176e3576e8c081b9b"
    end
  end

  def install
    bin.install "qshape"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qshape version")
  end
end
