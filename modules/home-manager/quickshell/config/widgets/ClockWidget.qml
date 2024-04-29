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
      code: 0xe8b5
      color: `#${Colorscheme.base0E}`
    }
    
    Label {
      text: DateService.date.toLocaleTimeString(Qt.locale(), "hh:mm:ss")
    }
  }
}
