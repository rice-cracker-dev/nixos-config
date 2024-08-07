import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import "../services"
import "../scripts/utils.mjs" as Utils

Frame {
  property string backgroundColor: Utils.opacityHexHT("ffffff", 0.1)
  property string borderColor: "#000000"
  property int borderWidth: 0
  property int borderRadius: 4

  background: Rectangle {
    id: "backgroundRect"
    color: backgroundColor
    radius: borderRadius

    border {
      color: borderColor
      width: borderWidth
    }
  }

  padding: 4
  leftPadding: 8
  rightPadding: 8
}
