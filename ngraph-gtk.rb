class NgraphGtk < Formula
  NGRAPH_VERSION = "6.09.10".freeze
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

  depends_on "gsl"
  depends_on "gtk4"
  depends_on "adwaita-icon-theme"
  depends_on "gtksourceview5"
  depends_on "readline"

  make_command = "make"
  on_macos do
    depends_on "make" => :build
    make_command = "gmake"
  end

  def install
    ENV["PKG_CONFIG_PATH"] += ":#{ENV["HOMEBREW_PREFIX"]}/lib/pkgconfig"
    system "autoreconf", "-if"
    system "./configure", *std_configure_args, "--disable-silent-rules", "--enable-nls"
    system make_command
    Dir.chdir("po") do
      system make_command, "ja.gmo"
    end
    system make_command, "install"
  end

  test do
    system make_command, "check"
  end
end
