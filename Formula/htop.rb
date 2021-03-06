class Htop < Formula
  desc "Improved top (interactive process viewer)"
  homepage "https://hisham.hm/htop/"
  url "https://hisham.hm/htop/releases/2.0.2/htop-2.0.2.tar.gz"
  sha256 "179be9dccb80cee0c5e1a1f58c8f72ce7b2328ede30fb71dcdf336539be2f487"

  bottle do
    sha256 "74bfbb9dd0ff5d1268274c83e67a2a3cef674a04914f30e6bffcf23e9008de73" => :high_sierra
    sha256 "555ff188b1990fb0a5b4634beef196ed1fb843336b99cac33d0291d592d93233" => :sierra
    sha256 "b13e6457905778a75d2627e1586e14ab20920001bed16b84c1fb64a258715741" => :el_capitan
    sha256 "f50fd11325a34da989c268f1e4bb998c4b8415079c23a95c267088e9576bef3e" => :yosemite
    sha256 "785c2806efe12a008c2fc958f567501e2931d2457261eed721ffae374f989498" => :mavericks
    sha256 "2c44e3de62f62e8b554ff1927a61c8a2cd46e5a8f9add6db98888f26668123b7" => :x86_64_linux # glibc 2.19
  end

  head do
    url "https://github.com/hishamhm/htop.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  if OS.mac?
    option "with-ncurses", "Build using homebrew ncurses (enables mouse scroll)"
    depends_on "ncurses" => :optional
  else
    depends_on "ncurses"
  end

  conflicts_with "htop-osx", :because => "both install an `htop` binary"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    htop requires root privileges to correctly display all running processes,
    so you will need to run `sudo htop`.
    You should be certain that you trust any software you grant root privileges.
    EOS
  end

  test do
    pipe_output("#{bin}/htop", "q", 0)
  end
end
