import QtQuick
import "../services"

RoundButton {
  radius: 8

  implicitHeight: 28
  implicitWidth: 28

  background: Rectangle {
    color: `#${ThemeService.accent}`
    radius: parent.radius
  }

  Label { text: 'TestAHADHASIODH' }
}
