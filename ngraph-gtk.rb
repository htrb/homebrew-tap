class NgraphGtk < Formula
  NGRAPH_VERSION = "6.09.06".freeze
  NGRAPH_REPOSITORY = "https://github.com/htrb/ngraph-gtk.git".freeze
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  url NGRAPH_REPOSITORY, tag: "v#{NGRAPH_VERSION}"
  license "GPL-2.0-or-later"
  head NGRAPH_REPOSITORY, branch: "master"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "gtk+3"
  depends_on "gtksourceview4"
  depends_on "readline"

  on_macos do
    depends_on "gtk-mac-integration"
  end

  def install
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
