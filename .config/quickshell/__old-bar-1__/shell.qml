import QtQuick
import Quickshell

import "modules/bar"
import "modules/notification"

ShellRoot {
    id: shellRoot
    // ─── Bar ───────────────────────────────────────────────
    Bar {}

    // ─── Notification center ───────────────────────────────
    NotificationCenter {}
}