// components/PulseGlow.qml — Animated pulsing glow ring
//
// Tries to use the custom GLSL shader (assets/shaders/pulseglow.frag,
// compiled to pulseglow.frag.qsb via `qsb`). If the compiled shader is
// not present — e.g. qsb wasn't run, or shadertools isn't installed —
// falls back to the static glow from GlowRect.qml. Either way, widgets
// using PulseGlow never crash or render nothing.
//
// Usage:
//   PulseGlow {
//       anchors.fill: someToggle
//       active:      someToggle.active
//       glowColor:   Colors.colAccent
//   }
//
// Compile the custom shader (optional, gives the animated ring effect):
//   qsb --glsl "100 es,120,150" -o assets/shaders/pulseglow.frag.qsb \
//       assets/shaders/pulseglow.frag

import QtQuick
import Quickshell.Io
import "."

Item {
    id: root

    property color glowColor: "#8aadf4"
    property bool  active:    false
    property real  intensity: 0.6
    property real  pulseSpeed: 0.6   // pulses per second

    readonly property url shaderUrl:
        Qt.resolvedUrl("../assets/shaders/pulseglow.frag.qsb")

    readonly property bool _shaderAvailable: shaderProbe.loaded

    // ─── Probe for the compiled shader once ────────────────────
    // FileView handles local file existence checks natively —
    // no XMLHttpRequest involved, so no QML_XHR_ALLOW_FILE_READ warning.
    FileView {
        id: shaderProbe
        path: root.shaderUrl
        printErrors: false   // missing shader is an expected, handled case
    }

    // ─── Animated shader path ──────────────────────────────────
    Loader {
        anchors.fill: parent
        active: root._shaderAvailable && root.active
        sourceComponent: ShaderEffect {
            property real time: 0
            property real intensity:  root.intensity
            property real pulseSpeed: root.pulseSpeed
            property color glowColor: root.glowColor
            fragmentShader: root.shaderUrl

            NumberAnimation on time {
                from: 0; to: 1000
                duration: 1000000
                loops: Animation.Infinite
                running: root.active
            }
        }
    }

    // ─── Static fallback (no animation, but always works) ──────
    GlowRect {
        anchors.fill: parent
        visible:   !root._shaderAvailable
        active:    root.active
        glowColor: root.glowColor
        intensity: root.intensity
    }
}