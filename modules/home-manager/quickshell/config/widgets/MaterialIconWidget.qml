import "../controls"
import "../singletons"

Label {
  required property int code

  font.family: Fonts.materialIcons.font.family
  font.weight: Fonts.materialIcons.font.weight
  font.styleName: Fonts.materialIcons.font.styleName

  text: String.fromCharCode(code)
}