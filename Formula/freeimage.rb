class FreeimageHttpDownloadStrategy < CurlDownloadStrategy
  def stage
    # need to convert newlines or patch chokes
    unzip = OS.mac? ? "/usr/bin/unzip" : "unzip"
    quiet_safe_system unzip, { :quiet_flag => "-qq" }, "-aa", cached_location
    chdir
  end
end

class Freeimage < Formula
  desc "Library for FreeImage, a dependency-free graphics library"
  homepage "https://sourceforge.net/projects/freeimage"
  url "https://downloads.sourceforge.net/project/freeimage/Source%20Distribution/3.17.0/FreeImage3170.zip",
    :using => FreeimageHttpDownloadStrategy
  version "3.17.0"
  sha256 "fbfc65e39b3d4e2cb108c4ffa8c41fd02c07d4d436c594fff8dab1a6d5297f89"
  revision 1

  bottle do
    cellar :any
    sha256 "a98fcfcbb82364d411ec11861f0523ea4e7dfd789d7e80fe1e1bdcb337ef3006" => :high_sierra
    sha256 "c3489ce29935ad196057e6ff95485dfc4442e7e26c4031523623e28bb587fad3" => :sierra
    sha256 "910ae7448a650a9415ad61e86635daed39177537f891a16bd036f444c96bdbfb" => :el_capitan
    sha256 "aec3219d5a015a5df4fbc81da4d74ac3c2a6f2d528bfbca770c217775f065e19" => :yosemite
    sha256 "2de1e4492ad7b690d2f4a6b51b536e79491b8a521466439634dc8ed5567e7b52" => :x86_64_linux # glibc 2.19
  end

  depends_on "unzip" => :build unless OS.mac?

  patch do
    if OS.mac?
      url "https://raw.githubusercontent.com/Homebrew/formula-patches/4dcf528/freeimage/3.17.0.patch"
      sha256 "8ef390fece4d2166d58e739df76b5e7996c879efbff777a8a94bcd1dd9a313e2"
    else
      url "https://gist.githubusercontent.com/davydden/5a4f348108d3c9110299/raw/3396840ff71c639d848ce552de9124462777ab97/freeimage.patch"
      sha256 "537a4045d31a3ce1c3bab2736d17b979543758cf2081e97fff4d72786f1830dc"
    end
  end

  # fix GCC 5.0 compile.
  patch do
    url "https://raw.githubusercontent.com/Homebrew/formula-patches/f2b4fb19/freeimage/gcc5.diff"
    sha256 "da0e052e2519b61b57fe9f371b517114f8be81dd2d3dd1721b8fb630dc67edff"
  end

  def install
    system "make", "-f", "Makefile.gnu"
    system "make", "-f", "Makefile.gnu", "install", "PREFIX=#{prefix}"
    system "make", "-f", "Makefile.fip"
    system "make", "-f", "Makefile.fip", "install", "PREFIX=#{prefix}"
  end

  test do
    (testpath/"test.c").write <<-EOS.undent
      #include <FreeImage.h>
      int main() {
         FreeImage_Initialise(0);
         FreeImage_DeInitialise();
         exit(0);
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}", "-L#{lib}", "-lfreeimage", "-o", "test"
    system "./test"
  end
end
