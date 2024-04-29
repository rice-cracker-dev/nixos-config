pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  property bool initialized: battery != -1
  property int battery: -1

  Timer {
    interval: 10000
    running: true
    repeat: true
    onTriggered: () => (batProc.running = true)
  }

  Process {
    id: batProc
    running: true
    command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
    stdout: SplitParser { splitMarker: ""; onRead: (bat) => (battery = Number(bat)) }
  }
}
