import QtQuick
import QtQuick.Layouts
import "../components"
import "../services"
import "../scripts/utils.mjs" as Utils

Card {
  RowLayout {
    anchors.centerIn: parent

    spacing: 8

    Icon {
      Layout.alignment: Qt.AlignVCenter

      code: 0xe8b5
      color: `#${ThemeService.base0A}`
    }

    Label {
      Layout.alignment: Qt.AlignVCenter
      
      text: DateService.date.toLocaleTimeString(Qt.locale(), "hh:mm:ss")
      color: `#${ThemeService.base05}`
    }
  }
}
