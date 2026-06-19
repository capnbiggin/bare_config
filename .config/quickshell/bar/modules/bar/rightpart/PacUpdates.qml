import Quickshell
import QtQuick

import qs.config
import qs.services
import qs.components

Row {
  id: row

  Text {
    id: pacUpdates

    height: parent.height
    color: Colors.colRed
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }

    text: " " + Updates.updates
  }
}