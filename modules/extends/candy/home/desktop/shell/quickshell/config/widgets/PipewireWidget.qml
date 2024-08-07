import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import "../components"

Card {
  visible: Pipewire.defaultAudioSink != null

  RowLayout {
    anchors.fill: parent

    Loader {
      active: Pipewire.defaultAudioSink != null

      sourceComponent: Label {
        text: `${JSON.stringify(Pipewire.defaultAudioSink.audio)}`
      }
    }
  }
}
