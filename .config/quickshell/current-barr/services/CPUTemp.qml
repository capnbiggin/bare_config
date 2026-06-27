pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string cpuTemp
  
  // CPU Temp
  Process {
    id: cpuTempProc

    command: ["sh", "-c", "~/.config/quickshell/current-barr/scripts/cpuTemp.sh"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.cpuTemp = this.text
    }
    
  }
  Timer {
    interval: 2000        // Every 2 seconds
    running: true         // Start immediately
    repeat: true          // Keep going forever
    onTriggered: cpuTempProc.running = true
  }
}