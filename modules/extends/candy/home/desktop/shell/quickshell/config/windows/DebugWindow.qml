import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../services"
import "../components"

Scope {
  property string time;

  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData

      anchors {
        bottom: true
        left: true
      }

      color: "transparent"

      Frame {
        background: Rectangle {
          color: "red"
        }

        anchors.fill: parent

        ColumnLayout {
          Label { text: JSON.stringify(CavaService.barsData) }
        }
      }
    }
  }
}
