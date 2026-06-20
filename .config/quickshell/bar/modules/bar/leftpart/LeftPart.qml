import Quickshell
import QtQuick
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.config

Row {
  anchors {
    left: parent.left
    leftMargin: Sizes.spacingLg
    verticalCenter: parent.verticalCenter
  }
  spacing: Sizes.spacingMd - 2

  // Workspaces
  Repeater {
    anchors.horizontalCenter: parent.horizontalCenter
    model: 9

    Text {
      property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
      property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
      text: index + 1
      color: isActive ? Colors.colCyan : (ws ? Colors.colBlue : Colors.colMuted)
      font {
        family: Fonts.fontFamily
        pixelSize: Fonts.fontMd
        bold: true
      }
    
      MouseArea {
        anchors.fill: parent
        onPressed: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${index + 1} })`)
      }
    }
  }
}
