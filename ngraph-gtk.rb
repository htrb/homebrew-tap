class NgraphGtk < Formula
  desc "Create scientific 2-dimensional plots"
  homepage "https://github.com/htrb/ngraph-gtk"
  url "https://github.com/htrb/ngraph-gtk.git"
  version "HEAD"
#  sha256 "1b3f5579ee01a86bb775e651a5b39b54f7ffba7ed7fb4899dc6c77c47b6514ee"
  license "GPL-2.0-or-later"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "libtool"
  depends_on "adwaita-icon-theme"
  depends_on "gsl"
  depends_on "gtk+3"
  depends_on "gtk-mac-integration"
  depends_on "gtksourceview4"
  depends_on "librsvg"
  depends_on "readline"

  def install
    system "autoreconf", "-i"
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make"
    system "(cd po; make ja.gmo)"
    system "make", "install"
    bin.install "SECURITY.md"
  end

  test do
    system "make", "check"
  end
end
