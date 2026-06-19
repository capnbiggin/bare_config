import Quickshell
import Quickshell.Io
import QtQuick

import qs.config
import qs.services
import qs.components

Row {
  anchors {
    right: parent.right
    rightMargin: 10
    verticalCenter: parent.verticalCenter
  }
  spacing: 5
  
  // Updates
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: pacUpdates.implicitWidth

    PacUpdates {
      id: pacUpdates
      anchors.fill: parent
    }
  }

  Devider {color: Colors.colMuted}

  // CPU
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: cpu.implicitWidth

    CPUUsage {
      id: cpu
      anchors.fill: parent
    }
  }

  Devider {color: Colors.colMuted}

  // Memory
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: mem.implicitWidth

    MemUsage {
      id: mem
      anchors.fill: parent
    }
  }

  Devider {color: Colors.colMuted}

  // Network
  Rectangle {
    color: Colors.colBg
    height: parent.height

    width: network.implicitWidth

    Network {
      id: network
      anchors.fill: parent
    }
  }

  // Process {
  //   id: memProc
  //   command: ["sh", "-c", "free | grep Mem"]
  //   stdout: SplitParser {
  //     onRead: data => {
  //       if (!data) return;
  //       var parts = data.trim().split(/\s+/);
  //       var total = parseInt(parts[1]) || 1;
  //       var used = parseInt(parts[2]) || 0;
  //       memUsage = Math.round(100 * used / total);
  //     }
  //   }
  //   Component.onCompleted: running = true
  // }
  Text {
    text: "1"
  }

  // Devider {color: Colors.colMuted}  

  // // Calendar
  // Process {
  //   id: calProc
  //   command: ["sh", "-c", "date +' %a, %d %b'"]
  //   stdout: SplitParser {
  //     onRead: data => {
  //       if (!data) return;
  //       calendarText = data.trim();
  //     }
  //   }
  //   Component.onCompleted: running = true
  // }
  // Text {
  //   text: calendarText
  //   color: Colors.colBlue
  //   font {
  //     family: Fonts.fontFamily
  //     pixelSize: Fonts.fontSize
  //     bold: true
  //   }
  //   Timer {
  //     interval: 60000        // Every 60 seconds
  //     running: true         // Start immediately
  //     repeat: true          // Keep going forever
  //     onTriggered: calProc.running = true
  //   }
  // }

  // Devider {color: Colors.colMuted}


}