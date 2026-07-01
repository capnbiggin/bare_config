import Quickshell
import QtQuick
import QtQuick.Layouts

import "../components"
import "../config"

Variants {
  id: root
  model: Quickshell.screens

  PanelWindow {
    id: mainPanel
    required property var modelData
    screen: modelData
    anchors {
      top: true
      right: true
      left: true
    }
    margins {
      top: Sizes.s2
      left: Sizes.s4
      right: Sizes.s4
    }
    implicitHeight: Sizes.barHeight
    color: "transparent"

    Rectangle{
      anchors.fill: parent
      color: Colors.bg0
      radius: height / 2 //Sizes.rMd

      GridLayout {
        id: grid
        columns: 3
        rows: 1
        columnSpacing: 0
        anchors {
          fill: parent
          leftMargin: Sizes.s4
          rightMargin: Sizes.s4
        }

        Item {
          id: leftItem
          Layout.fillWidth: true
          Layout.fillHeight: true
          RowLayout {
            anchors.fill: parent
            Workspaces {}
          }
        }

        Item {
          id: centerItem
          Layout.fillWidth: true
          Layout.fillHeight: true
          RowLayout {
            anchors.fill: parent
            Clock {Layout.alignment:Qt.AlignHCenter}
          }
        }

        Item {
          id: rightItem
          Layout.fillWidth: true
          Layout.fillHeight: true
          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            spacing: Sizes.s4

            Network {}
            Audio {}
            Battery {}
          }
        }  
      }
    }
  }
}
