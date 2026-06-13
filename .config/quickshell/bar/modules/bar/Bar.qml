import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "middlepart"
import "leftpart"
import "rightpart"

import qs.config

Variants {
  id: root
  model: Quickshell.screens

  property int updates: 0
  property int memUsage: 0
  property int cpuUsage: 0
  property var lastCpuIdle: 0
  property var lastCpuTotal: 0
  property var calendarText: ""
  
  PanelWindow {
    id: mainWindow
    required property var modelData

    anchors {
      top: true
      left: true
      right: true
    }

    implicitHeight: 30

    Rectangle {
      anchors.fill: parent
      color: Colors.colBg

      GridLayout {
        id: grid
        anchors.fill: parent
        columns: 3
        rows: 1
        columnSpacing: 0

        Item {
          id: leftItem
          Layout.fillWidth: true
          Layout.fillHeight: true

          LeftPart {}
        }

        Item {
          id: centerItem
          Layout.fillWidth: true
          Layout.fillHeight: true

          MiddlePart {}
        }

        Item {
          id: rightItem
          Layout.fillWidth: true
          Layout.fillHeight: true

          RightPart {}
        }
      }
    }
  }
}
