
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widgets"
import "../components"

Scope {
  property string time;

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      WlrLayershell.layer: WlrLayer.Background
      WlrLayershell.namespace: "qs-cava"

      anchors {
        bottom: true
        left: true
        right: true
      }

      exclusionMode: ExclusionMode.Ignore

      color: "transparent"

      height: 256

      CavaWidget { barsMaxHeight: parent.height }
    }
  }
}
