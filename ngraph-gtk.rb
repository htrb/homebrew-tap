class NgraphGtk < Formula
  NGRAPH_VERSION = '6.09.05'
  NGRAPH_REPOSITORY = 'https://github.com/htrb/ngraph-gtk'
  desc "Create scientific 2-dimensional plots"
  homepage NGRAPH_REPOSITORY
  url "#{NGRAPH_REPOSITORY}.git", tag: "v#{NGRAPH_VERSION}"
  head "#{NGRAPH_REPOSITORY}.git", branch: 'master'
  version NGRAPH_VERSION
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
    system "./configure", *std_configure_args, "--libexecdir=#{prefix}/lib", "--disable-silent-rules"
    system "make"
    Dir.chdir('po') do
      system 'make', 'ja.gmo'
    end
    system "make", "install"
  end

  test do
    system "make", "check"
  end
end
