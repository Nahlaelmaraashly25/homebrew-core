class Meson < Formula
  desc "Fast and user friendly build system"
  homepage "http://mesonbuild.com/"
  url "https://github.com/mesonbuild/meson/releases/download/0.42.1/meson-0.42.1.tar.gz"
  sha256 "30bdded6fefc48211d30818d96dd34aae56ee86ce9710476f501bd7695469c4b"
  head "https://github.com/mesonbuild/meson.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "45706120d5d6311af8238ba9d5f4217ab25d7a84c030296e1086b9a7e3f7446f" => :high_sierra
    sha256 "69d6d77375b83618148a0c1e556a21b4b3b3f23ef474eb010c9992b6ab27c2a4" => :sierra
    sha256 "69d6d77375b83618148a0c1e556a21b4b3b3f23ef474eb010c9992b6ab27c2a4" => :el_capitan
    sha256 "7acf732fcbded421bb5bac5672e2531d61ee13f5a594a8dfe808e28354cf3fa4" => :x86_64_linux
  end

  depends_on :python3
  depends_on "ninja"

  def install
    version = Language::Python.major_minor_version("python3")
    ENV["PYTHONPATH"] = lib/"python#{version}/site-packages"

    system "python3", *Language::Python.setup_install_args(prefix)

    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    (testpath/"helloworld.c").write <<-EOS.undent
      main() {
        puts("hi");
        return 0;
      }
    EOS
    (testpath/"meson.build").write <<-EOS.undent
      project('hello', 'c')
      executable('hello', 'helloworld.c')
    EOS

    mkdir testpath/"build" do
      system "#{bin}/meson", ".."
      assert_predicate testpath/"build/build.ninja", :exist?
    end
  end
end
