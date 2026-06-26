pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  FileView {
      path: `${Quickshell.env("HOME")}/.config/quickshell/colors.json`
      watchChanges: true
      onFileChanged: reload()

      JsonAdapter {
        id: pal
        property string background:     "#040e0d"
        property string foreground:     "#f5e2c5"
        property string cursor:         "#f5e2c5"
        property string color0:         "#040e0d"
        property string color1:         "#ff6048"
        property string color2:         "#7ad9a8"
        property string color3:         "#f5cd5b"
        property string color4:         "#5fc8d4"
        property string color5:         "#e89aa8"
        property string color6:         "#3dd1b0"
        property string color7:         "#c4b09a"
        property string color8:         "#3a1a35"
        property string color9:         "#ff6048"
        property string color10:        "#7ad9a8"
        property string color11:        "#f5cd5b"
        property string color12:        "#5fc8d4"
        property string color13:        "#e89aa8"
        property string color14:        "#3dd1b0"
        property string color15:        "#f5e2c5"
      }
  }

  // color helpers
  // Blend two colors (t=0 → a, t=1 → b). We derive the surface shades from the
  // palette this way so they adapt to any scheme, curated or dynamic.
  function mix(a, b, t) {
      return Qt.rgba(a.r * (1 - t) + b.r * t, a.g * (1 - t) + b.g * t, a.b * (1 - t) + b.b * t, 1);
  }
  // Same color at a given alpha (ink/glass derived from fg, so it adapts to light themes).
  function alpha(c, a) { return Qt.rgba(c.r, c.g, c.b, a); }
  // Perceived luminance 0..1, used to pick readable ink on the accent.
  function lum(c) { return 0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b; }

  // ─── Background ───────────────────────
  readonly property color bg0:      pal.background
  readonly property color bg1:      "#0a1816"
  readonly property color bg2:      "#0f211f"
  readonly property color bg3:      "#152a26"
  readonly property color bg4:      "#1d3631"
  
  readonly property color bgBlack: "#000000"

  // ─── Foreground ───────────────────────
  readonly property color fg:       pal.foreground
  readonly property color fgMuted:  alpha(fg, 0.60)
  readonly property color accent:   pal.color6

  // ─── Colors ───────────────────────────
  readonly property color red:      pal.color1
  readonly property color green:    pal.color2
  readonly property color orange:   pal.color3
  readonly property color yellow:   pal.color3
  readonly property color blue:     pal.color4
  readonly property color purple:   pal.color5
  readonly property color aqua:     pal.color6

  // ─── Greys ───────────────────────────
  readonly property color grey0:    pal.color8
  readonly property color grey1:    "#5a4d3e"
  readonly property color grey2:    pal.color7
}
