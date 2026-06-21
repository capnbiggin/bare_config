pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string time 
  
  // Calendar
  Process {
    id: timeProc

    command: ["sh", "-c", "date +'%l:%M%P'"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.time = this.text
    }
    
  }  
  Timer {
    interval: 2000        // Every 2 seconds
    running: true         // Start immediately
    repeat: true          // Keep going forever
    onTriggered: timeProc.running = true
  }
}