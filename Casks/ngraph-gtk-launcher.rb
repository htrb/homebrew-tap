cask "ngraph-gtk-launcher" do
  version "1.0.0"
  sha256 "c21ef066bf2a53e6a482828e00e9ca0ed8c576c20e9920bf82263d82da4a8c3d"

  url "https://github.com/htrb/ngraph-gtk-launcher/archive/refs/tags/v#{version}.zip"
  name "Ngraph-GTK Launcher"
  desc "Launcher App for ngraph-gtk installed with homebrew."
  homepage "https://github.com/htrb/ngraph-gtk-launcher"

  livecheck do
    url "https://github.com/htrb/ngraph-gtk-launcher/releases/tag/v#{version}"
    strategy :page_match do |page|
      match = page.match(/v(\d).(\d+).(\d+)\.zip/i)
      next if match.blank?

      "#{match[1]}.#{match[2]}.#{match[3]}"
    end
  end

  depends_on macos: ">= :sierra"

  pkg "Ngraph-Gtk Launcher"

  # No zap stanza required
end
