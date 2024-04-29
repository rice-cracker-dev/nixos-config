import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
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

      margins {
        left: 8
        right: 8
        top: 8
      }

      color: "transparent"

      height: 36

      RowLayout {
        anchors.fill: parent
        
        Item { Layout.fillWidth: true } // acts as a spacer
        BatteryWidget { Layout.fillHeight: true }
        AudioWidget { Layout.fillHeight: true }
        ClockWidget { Layout.fillHeight: true }
      }
    }
  }
}
