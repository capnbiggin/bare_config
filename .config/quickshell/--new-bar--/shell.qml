// ─── Root Shell ───────────────────────

import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.config

import "modules"

ShellRoot {
    id: shellRoot
    // ─── Bar ───────────────────────
    Bar {}

    NotificationCenter {}
}