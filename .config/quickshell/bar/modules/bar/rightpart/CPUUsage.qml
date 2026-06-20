import Quickshell
import QtQuick

import qs.config
import qs.services
import qs.components

Row {
  id: row

  Text {
    id: cpu

    height: parent.height
    color: Colors.colYellow
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontMd
      bold: true
    }

    text: " " + CPU.cpuUsage + "%" + " " + CPUTemp.cpuTemp
  }
}