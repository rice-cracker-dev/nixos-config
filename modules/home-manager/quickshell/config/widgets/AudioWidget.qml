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
      code: 0xe050
      color: `#${Colorscheme.base0D}`
    }

    Label {
      text: `${AudioService.volume}%`
    }
  }
}