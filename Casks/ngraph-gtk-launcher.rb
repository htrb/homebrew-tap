cask "ngraph-gtk-launcher" do
  version "1.0.0"
  sha256 "00c001ec000c57f5e1d1899338cff26f3163779378f64cca2366802e3df0e5ab"

  url "https://github.com/htrb/ngraph-gtk-launcher/releases/download/v#{version}/ngraph-gtk.dmg"
  name "Ngraph-GTK Launcher"
  desc "Launcher App for ngraph-gtk installed with homebrew."
  homepage "https://github.com/htrb/ngraph-gtk-launcher"

  app "ngraph-gtk.app"
  depends_on formula: "ngraph-gtk"

  postflight do
    `xattr -cr #{appdir}/ngraph-gtk.app`
  end

  # No zap stanza required
end
