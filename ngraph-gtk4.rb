class NgraphGtk4 < Formula
  NGRAPH_VERSION = "6.09.07".freeze
  NGRAPH_REPOSITORY = "https://github.com/htrb/ngraph-gtk.git".freeze
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  url NGRAPH_REPOSITORY, tag: "v#{NGRAPH_VERSION}"
  license "GPL-2.0-or-later"
  head NGRAPH_REPOSITORY, branch: "gtk4"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "gtk4"
  depends_on "gtksourceview5"
  depends_on "readline"
  conflicts_with "ngraph-gtk", because: "ngraph-gtk ships a same command"

  def install
    ENV["PKG_CONFIG_PATH"] += ":#{ENV["HOMEBREW_PREFIX"]}/lib/pkgconfig"
    system "autoreconf", "-if"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    Dir.chdir("po") do
      system "make", "ja.gmo"
    end
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end