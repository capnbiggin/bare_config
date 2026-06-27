import Quickshell
import QtQuick

import qs.config


Text {
  text: Qt.formatDateTime(clock.date, 'h:mm ap')
  color: Colors.fg

  font {
    family: Fonts.body
    pixelSize: Fonts.fsHeader
    weight: Fonts.wBold
  }
  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}

