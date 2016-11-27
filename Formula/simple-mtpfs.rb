class SimpleMtpfs < Formula
  desc "Simple MTP fuse filesystem driver"
  homepage "https://github.com/phatina/simple-mtpfs"
  url "https://github.com/phatina/simple-mtpfs/archive/simple-mtpfs-0.2.1.tar.gz"
  sha256 "e880a4971887dd27eaec7337f3f1f683e67e66f5c08ed6ef469797bdf5e5087a"

  depends_on "pkg-config" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on :osxfuse
  depends_on "libmtp"

  needs :cxx11

  def install
    ENV.cxx11

    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}", "CPPFLAGS=-I/usr/local/include/osxfuse",
    "LDFLAGS=-L/usr/local/include/osxfuse"
    system "make"
    system "make", "install"
  end

  test do
    system bin/"simple-mtpfs", "-h"
  end
end
