pragma Singleton

import QtQuick
import Quickshell

QtObject {
  id: root

  readonly property string body:      "JetBrainsMono Nerd Font Propo"
  
  readonly property int fontSize:       14

  // ─── Font Size ────────────
  readonly property int fsBody:       root.fontSize
  readonly property int fsCaption:    Math.round(root.fontSize * 0.78)
  readonly property int fsLabel:      Math.round(root.fontSize * 0.9)
  readonly property int fsHeader:     Math.round(root.fontSize * 1.2)
  readonly property int fsTitle:      Math.round(root.fontSize * 1.35)
  readonly property int fsDisplay:    Math.round(root.fontSize * 2.4)

  // ─── Font Weight ────────────
  readonly property int wReg:           400
  readonly property int wMd:            500
  readonly property int wSemiBold:      600
  readonly property int wBold:          700
  readonly property int wExtraBold:     800
}
