import Quickshell
import QtQuick

import qs.config
import qs.services
import qs.components

Row {
  id: row

  // anchors {
  //   topMargin: 5
  // }

  Text {
    id: clock

    height: parent.height
    color: Colors.colBlue
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }

    text: Time.time
  }
}