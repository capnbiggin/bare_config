import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
  id: root
  
  // Theme
  property color colBg: "#1a1b26"
  property color colFg: "#a9b1d6"
  property color colMuted: "#444b6a"
  property color colCyan: "#0db9d7"
  property color colBlue: "#7aa2f7"
  property color colYellow: "#e0af68"
  property string fontFamily: "JetBrainsMono Nerd Font"
  property int fontSize: 14

  // System Data
  property int cpuUsage: 0
  property int memUsage: 0
  property int lastCpuIdle: 0
  property var lastCpuTotal: 0

  // Modules
  anchors {
    top: true
    left: true
    right: true
  } 
  implicitHeight: 30
  color: root.colBg

  Text {
    id: clock
    anchors.centerIn: parent
    color: root.colBlue
    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")

    Timer {
      interval: 1000
      running: true
      repeat: true
      onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
  }
}
