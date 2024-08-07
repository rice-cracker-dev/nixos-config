import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../widgets"
import "../services"
import "../scripts/utils.mjs" as Utils

Scope {
  property string time;

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      WlrLayershell.namespace: "qs-blur-mainbar"

      anchors {
        top: true
        left: true
        right: true
      }

      height: 32

      color: "transparent"

      Frame {
        anchors.fill: parent
        padding: 4
        
        background: Rectangle {
          color: `#${Utils.opacityHex("000000", 0)}`
        }

        RowLayout {
          anchors.fill: parent;

          spacing: 4

          HyprlandWidget { Layout.fillHeight: true }
          Item { Layout.fillWidth: true }
          //PipewireWidget { Layout.fillHeight: true }
          TimeWidget { Layout.fillHeight: true }
        }
      }
    }
  }
}
