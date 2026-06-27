import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

import "../config"

RowLayout {
  id: root
  spacing: Sizes.s1

  property var battery: UPower.displayDevice
  property bool charging: battery.state ===UPowerDeviceState.Charging
  readonly property int level: Math.round(battery.percentage * 100)
  readonly property string icon: {
    if (charging) return String.fromCodePoint(0xF0084)
    if (level >= 100) return String.fromCodePoint(0xF0079)
    if (level < 10) return String.fromCodePoint(0x0083)
    return String.fromCodePoint(0xF007A + (Math.floor(level / 10) - 1))
  }

  Text {
    text: root.icon
    color: root.charging ? Colors.blue
                         : root.level <= 15 ? Colors.red
                         : root.level <= 30 ? Colors.yellow
                         : Colors.green
    font {
      family: Fonts.mono
      pixelSize: Fonts.fsBody
    }
  }
  Text {
    text: root.level + "%"
    color: Colors.fg
    font {
      family: Fonts.body
      pixelSize: Fonts.fsBody
    }
  }
}
