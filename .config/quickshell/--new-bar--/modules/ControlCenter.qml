import Quickshell
import QtQuick

import "../config"

PanelWindow {
  id:controlCenter
  anchors {
    top: true
  }
  implicitWidth: 200
  implicitHeight: 200
  margins.top: 40
  color: "transparent"

  exclusionMode: ExclusionMode.Ignore

  visible: false

  Rectangle {
    anchors.fill: parent
    bottomLeftRadius: Sizes.rXl
    bottomRightRadius: Sizes.rXl
    color: Colors.bg0
  }
}