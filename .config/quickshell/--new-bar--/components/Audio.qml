import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "../config"

RowLayout {
  id: root
  spacing: Sizes.s1

  property var sink: Pipewire.defaultAudioSink
  readonly property bool ready: sink && sink.ready
  readonly property bool muted: ready && sink.audio.muted
  readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0
  readonly property string icon: {
    if (!ready) return String.fromCodePoint(0xF0581)
    if (muted) return String.fromCodePoint(0xF075F)
    if (vol === 0) return String.fromCodePoint(0xF0581)
    if (vol < 34) return String.fromCodePoint(0xF057F)
    if (vol < 76) return String.fromCodePoint(0xF0580)
    return String.fromCodePoint(0xF057E)
  }
  Text {
    text: root.icon
    color: Colors.yellow
    font {
      family: Fonts.mono
      pixelSize: Fonts.fsBody
    }
  }
  Text {
    text: {
      if (!root.ready) return "-"
      if (root.muted) return "Muted"
      return root.vol + "%"
    }
    color: Colors.fg
    font {
      family: Fonts.body
      pixelSize: Fonts.fsBody
    }
  }

  MouseArea {
    id: volMouseArea
    Layout.fillWidth: true
    Layout.fillHeight: true
    acceptedButtons: Qt.NoButton
    onWheel: wheel => {
      if (wheel.angleDelta.y > 0) {
        volIncProc.running = true
      }else if (wheel.angleDelta.y < 0) {
        volDecProc.running = true
      }
    }
  }
  
  PwObjectTracker {
    objects: [root.sink]
  }

  // Volume level increase
  Process {
      id: volIncProc
      command: ["wpctl", "set-volume", "-l", "1", "@DEFAULT_AUDIO_SINK@", "2%+"]
  }

  // Volume level decrease
  Process {
      id: volDecProc
      command: ["wpctl", "set-volume", "-l", "1", "@DEFAULT_AUDIO_SINK@", "2%-"]
  }
}