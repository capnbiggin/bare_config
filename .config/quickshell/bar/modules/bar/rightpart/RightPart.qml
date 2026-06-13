import Quickshell
import Quickshell.Io
import QtQuick

import qs.config

Row {
  anchors {
    right: parent.right
    rightMargin: 10
    verticalCenter: parent.verticalCenter
  }
  spacing: 8

  // Updates
  Process {
    id: updateProc
    command: ["sh", "-c", "yay -Qu | wc -l"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return;
        updates = data.trim();
      }
    }
    Component.onCompleted: running = true
  }
  Text {
    text: " " + root.updates
    color: Colors.colRed
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }
    Timer {
      interval: 60000        // Every 2 seconds
      running: true         // Start immediately
      repeat: true          // Keep going forever
      onTriggered: updateProc.running = true
    }
  }

  // Divider
  Rectangle {
    width: 1
    height: 16
    color: Colors.colMuted
  }

  // CPU
  Process {
    id: cpuProc
    command: ["sh", "-c", "head -1 /proc/stat"]
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
      Component.onCompleted: running = true
  }
  Text {
    text: " " + root.cpuUsage + "%"
    color: Colors.colYellow
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }
    Timer {
      interval: 2000        // Every 2 seconds
      running: true         // Start immediately
      repeat: true          // Keep going forever
      onTriggered: cpuProc.running = true
    }
  }

  // Divider
  Rectangle {
    width: 1
    height: 16
    color: Colors.colMuted
  }

  // Memory
  Process {
    id: memProc
    command: ["sh", "-c", "free | grep Mem"]
    stdout: SplitParser {
      onRead: data => {
        if (!data) return;
        var parts = data.trim().split(/\s+/);
        var total = parseInt(parts[1]) || 1;
        var used = parseInt(parts[2]) || 0;
        memUsage = Math.round(100 * used / total);
      }
    }
    Component.onCompleted: running = true
  }
  Text {
    text: " " + root.memUsage + "%"
    color: Colors.colCyan
    font {
      family: Fonts.fontFamily
      pixelSize: Fonts.fontSize
      bold: true
    }
    Timer {
      interval: 2000        // Every 2 seconds
      running: true         // Start immediately
      repeat: true          // Keep going forever
      onTriggered: memProc.running = true
    }
  }

  // Divider
  Rectangle {
    width: 1
    height: 16
    color: Colors.colMuted
  }

  // Calendar
  // Date {}
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
