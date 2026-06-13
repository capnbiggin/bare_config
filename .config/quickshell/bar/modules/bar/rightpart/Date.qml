import Quickshell
import QtQuick

import qs.config

Row {
  anchors.fill: parent
  
  // Calendar
  Process {
    id: calProc
    command: ["sh", "-c", "date +'%a, %d %b'"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return;
        calendarText = data.trim();
      }
    }
    Component.onCompleted: running = true
  }
  Text {
    text: calendarText
    color: Colors.colBlue
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }
    Timer {
      interval: 2000        // Every 2 seconds
      running: true         // Start immediately
      repeat: true          // Keep going forever
      onTriggered: calProc.running = true
    }
  }
}