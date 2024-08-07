import QtQuick
import "../services"

Label {
  required property int code

  font.family: FontService.materialIcons.font.family
  font.styleName: FontService.materialIcons.font.styleName
  font.variableAxes: { "FILL": 1 }

  renderType: Text.NativeRendering

  text: String.fromCharCode(code)
}
