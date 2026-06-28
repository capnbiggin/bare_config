import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import qs.config

RowLayout {
  spacing: Sizes.s1

  Repeater {
    model: 10

    Rectangle {
      id: wsButton
      required property int index
      property var ws: Hyprland.workspaces.values.find(
        w => w.id === index + 1
      )
      property bool isActive: Hyprland.focusedWorkspace?.id === (
        index + 1
      )
      implicitWidth: label.implicitWidth + Sizes.s2
      implicitHeight: 22
      radius: Sizes.rXs
      color: isActive ? Colors.bg4
                      : (
                        ws ? Colors.bg2 
                           : "transparent")

      Behavior on color {
        ColorAnimation { duration: 150 }
      }

      Text {
        id: label
        anchors.centerIn: parent
        text: {
          if ((wsButton.index + 1) == 10) return "0"
          return wsButton.index + 1
        }
        color: wsButton.isActive ? Colors.accent
                                 : (
                                   ws ? Colors.fg 
                                      : Colors.fgMuted
                                   )
        font {
          family: Fonts.body
          pixelSize: Fonts.fsBody
          weight: Fonts.wBold
        }
      }
      
      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onPressed: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${index + 1} })`)
      }
    }
  }
}
