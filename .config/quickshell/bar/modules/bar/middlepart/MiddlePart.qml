import Quickshell
import Quickshell.Io
import QtQuick

import qs.config

Rectangle {
  anchors.fill: parent
  color: Colors.colBg

  Text {
    id: clock
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    color: Colors.colBlue
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }
    text: Qt.formatDateTime(new Date(), "hh:mm")
    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: clock.text = Qt.formatDateTime(new Date(), "hh:mm")
    }
  }
}
