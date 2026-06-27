pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property int memUsage
  

  // Memory
  Process {
    id: memProc
    command: ["sh", "-c", "free | grep Mem"]
    Component.onCompleted: running = true
    stdout: SplitParser {
      onRead: data => {
        if (!data) return;
        var parts = data.trim().split(/\s+/);
        var total = parseInt(parts[1]) || 1;
        var used = parseInt(parts[2]) || 0;
        memUsage = Math.round(100 * used / total);
      }
    }
  }
  
  Timer {
    interval: 2000        // Every 2 seconds
    running: true         // Start immediately
    repeat: true          // Keep going forever
    onTriggered: memProc.running = true
  }
}