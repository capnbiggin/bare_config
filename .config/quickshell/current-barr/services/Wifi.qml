pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string wifiName
  
  // Wifi
  Process {
    id: wifiProc

    command: ["sh", "-c", "~/.config/quickshell/current-barr/scripts/wifi.sh"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.wifiName = this.text
    }
    
  }
  Timer {
    interval: 10000        // Every 10 seconds
    running: true      // Start immediately
    repeat: true          // Keep going forever
    onTriggered: wifiProc.running = true
  }
}
