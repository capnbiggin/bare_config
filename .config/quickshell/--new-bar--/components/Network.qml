import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

import "../config"

RowLayout {
  id: root
  spacing: Sizes.s1

  property var wifiDevice: Networking.devices.values.find(d=> d.type === DeviceType.Wifi)
  property var active: wifiDevice ? wifiDevice.networks.values.find(n => n.connected) : null
  property bool enabled: Networking.wifiEnabled
  readonly property real signal: active ? active.signalStrength : 0 
  readonly property string icon: {
    if (!Networking.wifiEnabled) return String.fromCodePoint(0xF05AA)
    if (!active) return String.fromCodePoint(0xF092D)

    let tier = signal >= 0.75 ? 4
             : signal >= 0.50 ? 3
             : signal >= 0.25 ? 2
             : 1
    return String.fromCodePoint(0xF091F + (tier -1) * 3)
  }
  Text {
    text: root.icon
    color: Networking.wifiEnabled ? Colors.purple : Colors.grey1
    font {
      family: Fonts.mono
      pixelSize: Fonts.fsBody
    }
  }
  Text {
    text: {
      if (!Networking.wifiEnabled) return "off"
      if (!root.active) return "Disconnected" 
      return root.active.name
    }
    color: Colors.fg
    font {
      family: Fonts.body
      pixelSize: Fonts.fsBody
    }
  }
}