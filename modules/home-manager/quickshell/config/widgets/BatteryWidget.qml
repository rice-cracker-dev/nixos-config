import QtQuick
import QtQuick.Layouts
import "../controls"
import "../singletons"
import "../singletons/services"

CardWidget {
  RowLayout {
    anchors.fill: parent
    spacing: 8

    MaterialIconWidget {
      code: 0xe1a4
      color: `#${Colorscheme.base0E}`
    }

    Label {
      text: `${BatteryService.battery}%`
    }
  }
}