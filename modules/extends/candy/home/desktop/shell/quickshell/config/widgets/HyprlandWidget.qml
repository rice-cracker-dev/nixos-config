import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../components"
import "../services"

Card {
  RowLayout {
    anchors.centerIn: parent
    spacing: 5

    Repeater {
      model: [...Array(9)].map((_, index) => (index + 1))
      delegate: Button {
        required property int modelData

        Layout.alignment: Qt.AlignVCenter
        
        implicitWidth: 10
        implicitHeight: 10

        active: modelData == Hyprland.focusedMonitor?.activeWorkspace.id

        onClicked: Hyprland.dispatch(`workspace ${modelData}`)
      }
    }
  }
}
