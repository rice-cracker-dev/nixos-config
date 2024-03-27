import QtQuick
import "../singletons/services"

Item {
  width: childrenRect.width
  height: childrenRect.height

  Text {
    text: DateService.date.toLocaleTimeString(Qt.locale(), 'HH:mm:ss')
  }
}
