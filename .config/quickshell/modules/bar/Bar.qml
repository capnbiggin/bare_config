import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Wayland
import Quickshell.Hyprland

import qs.config
import "widgets"

Variants {
  id: root
  model: Quickshell.screens

  // System data
  property int updates: 0
  property int memUsage: 0
  property int cpuUsage: 0
  property var lastCpuIdle: 0
  property var lastCpuTotal: 0

  PanelWindow {
    id: mainPanel
    required property var modelData
    screen: modelData

    anchors {
    top: true
    right: true
    left: true
    }

    implicitHeight: 30
    color: Colors.colBg

    RowLayout {
      anchors {
        fill: parent
        leftMargin: 10
        rightMargin: 10
        topMargin: 8
        bottomMargin: 8
      }
      spacing: 8

      // Workspaces
      Repeater {
        model: 9
        Text {
          property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
          property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
          text: index + 1
          color: isActive ? Colors.colCyan : (ws ? Colors.colBlue : Colors.colMuted)
          font {
            family: Fonts.fontFamily
            pixelSize: Fonts.fontSize
            bold: true
          }
          MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + (index + 1))
          }
        }
      }

      // Space Between workspaces and components
      Item {
        Layout.fillWidth: true
        Layout.fillHeight: true
        // Clock
        Text {
          id: clock
          anchors.horizontalCenter: parent.horizontalCenter
          color: Colors.colBlue
          font {
            family: Fonts.fontFamily
            pixelSize: Fonts.fontSize
            bold: true
          }
          text: Qt.formatDateTime(new Date(), "HH:mm")
          Timer {
            interval: 10000
            running: true
            repeat: true
            onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
          }
        }
      }

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

      // Clock
      Text {
        id: clock2
        color: Colors.colBlue
        font {
          family: Fonts.fontFamily
          pixelSize: Fonts.fontSize
          bold: true
        }
        text: " " + Qt.formatDateTime(new Date(), "ddd, MMM dd")
        Timer {
          interval: 1000
          running: true
          repeat: true
          onTriggered: clock2.text = " " + Qt.formatDateTime(new Date(), "ddd, MMM dd")
        }
      }
    }
  }
}
