pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  // FileView {
  //     path: `${Quickshell.env("HOME")}/.config/quickshell/colors.json`
  //     watchChanges: true
  //     onFileChanged: reload()

      // JsonAdapter {
  QtObject {
    id: pal
    property string background:     "#1e1e2e"
    property string foreground:     "#cdd6f4"
    property string cursor:         "#f5e0dc"
    property string color0:         "#bac2de"
    property string color1:         "#f38ba8"
    property string color2:         "#a6e3a1"
    property string color3:         "#f9e2af"
    property string color4:         "#89b4fa"
    property string color5:         "#f5c2e7"
    property string color6:         "#94e2d5"
    property string color7:         "#a6adc8"
    property string color8:         "#585b70"
    property string color9:         "#ff6048"
    property string color10:        "#7ad9a8"
    property string color11:        "#f5cd5b"
    property string color12:        "#5fc8d4"
    property string color13:        "#e89aa8"
    property string color14:        "#3dd1b0"
    property string color15:        "#bac2de"
    property string color16:        "#fab387"
    property string color17:        "#f5e0dc"
  }
  // }

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
  readonly property color bg1:      "#11111b"
  readonly property color bg2:      "#181825"
  readonly property color bg3:      "#313244"
  readonly property color bg4:      "#45475a"
  
  readonly property color bgBlack:  "#000000"

  // ─── Foreground ───────────────────────
  readonly property color fg:       pal.foreground
  readonly property color fgMuted:  alpha(fg, 0.60)
  readonly property color accent:   pal.color12

  // ─── Colors ───────────────────────────
  readonly property color red:      pal.color1
  readonly property color green:    pal.color2
  readonly property color orange:   pal.color3
  readonly property color yellow:   pal.color3
  readonly property color blue:     pal.color4
  readonly property color purple:   pal.color5
  readonly property color teal:     pal.color6

  // ─── Greys ───────────────────────────
  readonly property color grey0:    pal.color8
  readonly property color grey1:    pal.color0
  readonly property color grey2:    pal.color7
}
