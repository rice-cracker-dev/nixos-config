import QtQuick
import QtQuick.Controls.Basic
import "../singletons"

Frame {
  background: Rectangle {
    id: "backgroundRect"
    
    color: "#40000000"
    border.color: `#40${Colorscheme.base05}`

    radius: 8
  }

  padding: 8
}