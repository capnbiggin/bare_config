import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config
import qs.services
import qs.components

Row {
  id: row

  Text {
    id: network

    height: parent.height
    color: Colors.colGreen
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontMd
      bold: true
    }

    text: Wifi.wifiName
  }
}