pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property string date 
  
  // Calendar
  Process {
    id: dateProc

    command: ["sh", "-c", "date +' %a, %d %b'"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.date = this.text
    }
    
  }  
  Timer {
    interval: 60000        // Every 60 seconds
    running: true         // Start immediately
    repeat: true          // Keep going forever
    onTriggered: dateProc.running = true
  }
}