pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root
  property int cpuUsage
  property var lastCpuIdle
  property var lastCpuTotal
  
  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]
    Component.onCompleted: running = true
    stdout: SplitParser {
      onRead: data => {
        if (!data) return;
        var p = data.trim().split(/\s+/);
        var idle = parseInt(p[4]) + parseInt(p[5]);
        var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0);
        if (lastCpuTotal > 0) {
            cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)));
        }
        lastCpuTotal = total;
        lastCpuIdle = idle;
      }
    }
  }

  Timer {
    interval: 2000        // Every 2 seconds
    running: true         // Start immediately
    repeat: true          // Keep going forever
    onTriggered: cpuProc.running = true
  }
}