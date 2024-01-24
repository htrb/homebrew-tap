cask "ngraph-gtk-launcher" do
  version "1.0.0"
  sha256 "7c20cc2560d0f698fd42e340747c0efc409bd7e55076c293e3d93cb212199fa5"

  url "https://github.com/htrb/ngraph-gtk-launcher/releases/download/v#{version}/ngraph-gtk.dmg"
  name "Ngraph-GTK Launcher"
  desc "Launcher App for ngraph-gtk installed with homebrew."
  homepage "https://github.com/htrb/ngraph-gtk-launcher"

  app "ngraph-gtk.app"

  postflight do
    `xattr -cr #{appdir}/ngraph-gtk.app`
  end

  # No zap stanza required
end
