pragma Singleton

import QtQuick
import Quickshell

Singleton {
  property FontLoader materialIcons: FontLoader {
    source: "../assets/fonts/MaterialIcon.ttf"
  }
}
