pragma Singleton

import Quickshell
import QtQuick

QtObject {
  id: root

  //--- Bar -------------------------------
  readonly property int barHeight: 30


  //--- Spacing
  readonly property int spacingNone: 0
  readonly property int spacingXs: 2
  readonly property int spacingSm: 5
  readonly property int spacingMd: 10
  readonly property int spacingLg: 15
}