import Quickshell
import Quickshell.Io
import QtQuick

import qs.config
import qs.services
import qs.components

Row {
  anchors {
    right: parent.right
    rightMargin: Sizes.spacingLg
    verticalCenter: parent.verticalCenter
  }
  spacing: Sizes.spacingSm

  Text {
    text: "1"
    color: "transparent"
  }
  
  //--- Updates ---------------------
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: pacUpdates.implicitWidth

    PacUpdates {
      id: pacUpdates
      anchors.fill: parent
    }
  }

  Divider {color: Colors.colMuted}

  //--- CPU ---------------------------
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: cpu.implicitWidth

    CPUUsage {
      id: cpu
      anchors.fill: parent
    }
  }

  Divider {color: Colors.colMuted}

  //--- Memory ------------------------
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: mem.implicitWidth

    MemUsage {
      id: mem
      anchors.fill: parent
    }
  }

  Divider {color: Colors.colMuted}

  //--- Volume ------------------------
  Rectangle {
    color: Colors.colBg
    height: parent.height
    width: vol.implicitWidth

    Volume {
      id: vol
      anchors.fill: parent
    }
  }

  Divider {color: Colors.colMuted}

  //--- Network -------------------------
  Rectangle {
    color: Colors.colBg
    height: parent.height

    width: network.implicitWidth

    Network {
      id: network
      anchors.fill: parent
    }
  }
}