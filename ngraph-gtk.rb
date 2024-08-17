class NgraphGtk < Formula
  option "with-gtk4", "Use GTK4 instead of GTK3."

  NGRAPH_VERSION = "6.09.09".freeze
  NGRAPH_REPOSITORY = "https://github.com/htrb/ngraph-gtk.git".freeze
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  if build.with? "gtk4"
    head NGRAPH_REPOSITORY, branch: "gtk4"
    depends_on "gtk4"
    depends_on "gtksourceview5"
  else
    url NGRAPH_REPOSITORY, tag: "v#{NGRAPH_VERSION}"
    license "GPL-2.0-or-later"
    head NGRAPH_REPOSITORY, branch: "master"
    depends_on "gtk+3"
    depends_on "gtksourceview4"
    on_macos do
      depends_on "gtk-mac-integration"
    end
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "readline"

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
