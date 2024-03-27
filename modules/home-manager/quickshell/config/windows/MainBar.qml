import Quickshell
import Quickshell.Io
import QtQuick
import "../widgets"

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      height: 30

      ClockWidget {}
    }
  }
}
