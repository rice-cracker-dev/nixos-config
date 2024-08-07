import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import "../components"
import "../services"

Button {
  id: root
  property int borderRadius: 4
  property bool active: false
  property string activeColor: ThemeService.base0D

  state: "default"

  background: Rectangle {
    id: rect
    radius: borderRadius

    MouseArea {
      id: mouseArea
      anchors.fill: parent
      hoverEnabled: true

      onEntered: () => (root.state = "hover")
      onExited: () => (root.state = "default")
    }
  }

  states: [
    State {
      name: "default"
      PropertyChanges { target: rect; color: `#${active ? activeColor : ThemeService.base03}` }
    },
    State {
      name: "hover"
      PropertyChanges { target: rect; color: `#${active ? activeColor : ThemeService.base04}` }
    }
  ]

  transitions: Transition {
    ColorAnimation { duration: 100 }
  }
}

