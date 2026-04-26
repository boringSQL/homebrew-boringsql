class Qshape < Formula
  desc "AST-level canonicalization and fingerprinting of PostgreSQL queries, with pg_stat_statements capture."
  homepage "https://github.com/boringsql/qshape"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/boringsql/qshape/releases/download/v0.2.0/qshape-aarch64-apple-darwin.tar.xz"
      sha256 "44a3cf3d7aba33bdc79187b94fec7f3aca93720140dee34f46070fcdf97590fc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/boringsql/qshape/releases/download/v0.2.0/qshape-x86_64-apple-darwin.tar.xz"
      sha256 "4edc9e64ba55ecbfc3c0aac46377c5d063ab24c9e561bc1c6ac263f130234a20"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/boringsql/qshape/releases/download/v0.2.0/qshape-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c3cf1b22ab6f7038454a65751c45aa6109c864345a14df544ce6a07f31dabdcf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/boringsql/qshape/releases/download/v0.2.0/qshape-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e88981ce7fa9d01065cb65a17e9926250b50a43bc7a9c62982d8500f13f2da2f"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "qshape" if OS.mac? && Hardware::CPU.arm?
    bin.install "qshape" if OS.mac? && Hardware::CPU.intel?
    bin.install "qshape" if OS.linux? && Hardware::CPU.arm?
    bin.install "qshape" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
