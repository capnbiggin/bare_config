import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config
import qs.services
import qs.components

Row {
  id: row

  Text {
    id: vol

    height: parent.height
    color: Colors.colBlue
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontMd
      bold: true
    }

    text: GetVolume.getVolume
  }
}
