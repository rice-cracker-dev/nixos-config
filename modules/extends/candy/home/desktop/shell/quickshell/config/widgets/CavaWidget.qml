import QtQuick
import QtQuick.Layouts
import "../components"
import "../services"

GridLayout {
  property real barsMaxHeight: 32
  property string barsColor: `#40${ThemeService.base05}`
  property real barsSpacing: 8

  id: gridLayout

  anchors.fill: parent

  columns: CavaService.barsNumber
  columnSpacing: barsSpacing
  rows: 1

  Repeater {
    model: CavaService.barsData

    Rectangle {
      required property int index
      required property string modelData

      Layout.fillWidth: true
      Layout.column: index
      Layout.alignment: Qt.AlignBottom

      color: barsColor

      implicitHeight: barsMaxHeight * modelData
    }
  }
}
