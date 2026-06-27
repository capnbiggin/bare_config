import Quickshell
import Quickshell.Io
import QtQuick

import qs.config
import qs.services
import qs.components

Item {
  anchors {
    fill: parent
    topMargin: Sizes.spacingSm
  }
  // anchors.fill: parent
  // anchors.margins: 5

  Rectangle {
    color: Colors.colBg
    height: parent.height

    width: clock.implicitWidth
    anchors.horizontalCenter: parent.horizontalCenter

    Clock {
      id: clock
      anchors.fill: parent
    }
  }
}
