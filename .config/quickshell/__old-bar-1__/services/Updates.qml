pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property int updates
  
  Process {
    id: updateProc

    command: ["sh", "-c", "yay -Qu | wc -l"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.updates = this.text
    }
  }
  Timer {
    interval: 60000        // Every 60 seconds
    running: true      // Start immediately
    repeat: true          // Keep going forever
    onTriggered: updateProc.running = true
  }
}
