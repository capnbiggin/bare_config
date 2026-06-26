pragma Singleton

import Quickshell
import QtQuick

QtObject {
  id: root

  // ─── Bar ───────────────────────
  readonly property int barHeight:      32


  // ─── Spacing ───────────────────────
  readonly property int s0:             2
  readonly property int s1:             4
  readonly property int s2:             8
  readonly property int s3:             12
  readonly property int s4:             16
  readonly property int s5:             24
  readonly property int s6:             32

  // ─── Spacing ───────────────────────
  readonly property int rXs:             6
  readonly property int rSm:             10
  readonly property int rMd:             14
  readonly property int rLg:             18
  readonly property int rXl:             24

  // ─── Notification ───────────────────────
  readonly property int notifiWidth:    380
}
