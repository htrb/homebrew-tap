cask "ngraph-gtk-launcher" do
  version "1.0.0"
  sha256 "346ade8fba9e64e8edcf3d78f856a90e0d8a85b11d3a6b3adb96819dae9125cc"

  url "https://github.com/htrb/ngraph-gtk-launcher/releases/download/v#{version}/ngraph-gtk.dmg"
  name "Ngraph-GTK Launcher"
  desc "Launcher App for ngraph-gtk installed with homebrew."
  homepage "https://github.com/htrb/ngraph-gtk-launcher"

  depends_on macos: ">= :sierra"

  pkg "ngraph-gtk"

  # No zap stanza required
end
