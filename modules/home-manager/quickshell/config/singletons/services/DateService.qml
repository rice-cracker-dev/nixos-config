pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  property date date: new Date()
  property int hours: 0
  property int minutes: 0
  property int seconds: 0

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      date = new Date()
      hours = date.getHours()
      minutes = date.getMinutes()
      seconds = date.getSeconds()
    }
  }
}
