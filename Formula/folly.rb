class Folly < Formula
  desc "Collection of reusable C++ library artifacts developed at Facebook"
  homepage "https://github.com/facebook/folly"
  url "https://github.com/facebook/folly/archive/v2017.10.02.00.tar.gz"
  sha256 "26785125f8368d455f1457c86708dfef923cd43e6dc44aee88f3f9510cae8bbe"
  head "https://github.com/facebook/folly.git"

  bottle do
    cellar :any
    sha256 "977b8ff0a9a20ab651dcfdf6290b8c06a773c78b7f870bab9b7b00eaa8d42c92" => :high_sierra
    sha256 "d8ed88022adf7c14e92cca6e136be94872991812df667f89ba8ecfb2b8c1b05b" => :sierra
    sha256 "74eb77532a8d744a05d00e5defd81bf81094325637d7e603549124ab48308cc0" => :el_capitan
    sha256 "4cba861e2334607284681174894bfa6593b0cddd54f57e57a3ec8e2c4129bc16" => :x86_64_linux
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "double-conversion"
  depends_on "glog"
  depends_on "gflags"
  depends_on "boost"
  depends_on "libevent"
  depends_on "xz"
  depends_on "snappy"
  depends_on "lz4"
  depends_on "openssl"

  # https://github.com/facebook/folly/issues/451
  depends_on :macos => :el_capitan unless OS.mac?

  needs :cxx11

  # Known issue upstream. They're working on it:
  # https://github.com/facebook/folly/pull/445
  fails_with :gcc => "6"

  def install
    # Reduce memory usage below 4 GB for Circle CI.
    ENV["MAKEFLAGS"] = "-j8" if ENV["CIRCLECI"]

    ENV.cxx11

    cd "folly" do
      system "autoreconf", "-fvi"
      system "./configure", "--prefix=#{prefix}", "--disable-silent-rules",
                            "--disable-dependency-tracking",
                            "--with-boost-libdir=#{Formula["boost"].opt_lib}"
      system "make"
      system "make", "install"
    end
  end

  test do
    (testpath/"test.cc").write <<-EOS.undent
      #include <folly/FBVector.h>
      int main() {
        folly::fbvector<int> numbers({0, 1, 2, 3});
        numbers.reserve(10);
        for (int i = 4; i < 10; i++) {
          numbers.push_back(i * 2);
        }
        assert(numbers[6] == 12);
        return 0;
      }
    EOS
    system ENV.cxx, "-std=c++11", "test.cc", "-I#{include}", "-L#{lib}",
                    "-lfolly", "-o", "test"
    system "./test"
  end
end
