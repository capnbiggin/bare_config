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

    PanelWindow {
        id: mainWindow
        required property var modelData
        screen: modelData

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Sizes.barHeight

        Rectangle {
            anchors.fill: parent
            color: Colors.colBg

            GridLayout {
                id: grid
                anchors.fill: parent
                columns: 3
                rows: 1
                columnSpacing: Sizes.spacingNone

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
