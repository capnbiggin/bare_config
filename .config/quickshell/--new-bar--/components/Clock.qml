import Quickshell
import QtQuick

import "../config"


Text {
  id:root

  property bool date

  text: {
    if (date) {
      Qt.formatDateTime(clockProc.date, 'ddd, MMM d')
    }else {
    Qt.formatDateTime(clockProc.date, 'h:mm ap')
    }
  }
  color: Colors.fg
  font {
    family: Fonts.body
    pixelSize: Fonts.fsHeader
    weight: Fonts.wSemiBold
  }
  SystemClock {
    id: clockProc
    precision: SystemClock.Minutes
  }
  MouseArea {
    anchors.fill: parent
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onPressed: mouse => {
      if (mouse.button == Qt.LeftButton) {
        if (!date) {
          root.date = true
        }else if (date) {
          root.date = false
        }
      }
    }
  }
}
