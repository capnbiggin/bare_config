pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string getVolume
  
  // Volume
  Process {
    id: volProc

    command: ["sh", "-c", "~/.config/quickshell/scripts/getVolume.sh"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.getVolume = this.text
    }
    
  }
  Timer {
    interval: 1000        // Every 1 seconds
    running: true      // Start immediately
    repeat: true          // Keep going forever
    onTriggered: volProc.running = true
  }
}