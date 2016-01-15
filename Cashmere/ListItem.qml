import QtQuick 2.5
import QtQuick.Controls 1.4

Rectangle {
   id: root

   state: "normal"
   clip: true

   property Button   control
   property color    supportingColor: "#999"

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   Behavior on color { ColorAnimation { duration: 100 } }

   Ripple {
      id: ripple

      color: alphaOf(supportingColor, 0.2)
      anchors.centerIn: parent

      Connections {
         target: root.control
         onClicked: ripple.start()
      }
   }

   states: [
      State {
         name: ""
         PropertyChanges {
            target: root
            color: Qt.rgba(0, 0, 0, 0)
         }
      },
      State {
         name: "normal"
         when: !control.hovered && !control.pressed && enabled
         PropertyChanges {
            target: root
            color: Qt.rgba(0, 0, 0, 0)
         }
      },
      State {
         name: "hover"
         when: control.hovered && !control.pressed && enabled
         PropertyChanges {
            target: root
            color: alphaOf(supportingColor, 0.2)
         }
      },
      State {
         name: "pressed"
         when: control.pressed && enabled
         PropertyChanges {
            target: root
            color: alphaOf(supportingColor, 0.4)
         }
      }
   ]
}