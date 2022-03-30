class NgraphGtk < Formula
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  url "https://github.com/htrb/ngraph-gtk.git"
  version "HEAD"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "gtk+3"
  depends_on "gtk-mac-integration"
  depends_on "gtksourceview4"
  depends_on "librsvg"
  depends_on "readline"

  def install
    system "autoreconf", "-i"
    system "./configure", *std_configure_args, "--libexecdir=#{prefix}/lib/ngraph-gtk", "--disable-silent-rules"
    system "make"
    system "(cd po; make ja.gmo)"
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
