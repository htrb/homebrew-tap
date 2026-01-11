class NgraphGtk < Formula
  NGRAPH_VERSION = "6.09.11".freeze
  NGRAPH_REPOSITORY = "https://github.com/htrb/ngraph-gtk.git".freeze
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  url NGRAPH_REPOSITORY, tag: "v#{NGRAPH_VERSION}"
  license "GPL-2.0-or-later"
  head NGRAPH_REPOSITORY, branch: "master"
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build

  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "readline"

  on_macos do
    depends_on "make" => :build
  end

  def install
    ENV["PKG_CONFIG_PATH"] += ":#{ENV["HOMEBREW_PREFIX"]}/lib/pkgconfig"
    system "autoreconf", "-if"
    system "./configure", *std_configure_args, "--disable-silent-rules", "--enable-nls"
    system "gmake"
    Dir.chdir("po") do
      system "gmake", "ja.gmo"
    end
    system "gmake", "install"
  end

  test do
    system "gmake", "check"
  end
end
