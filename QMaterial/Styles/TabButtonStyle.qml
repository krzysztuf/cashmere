import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyleBase {
   id: root

   property color fontColor: light ? "white" : color.regular[5]

   label: Label {
      fontStyle: FontStyles.button

      verticalAlignment: Text.AlignVCenter
      horizontalAlignment: Text.AlignHCenter

      color: control.enabled ? fontColor : Qt.rgba(0, 0, 0, 0.26)

      text: control.text

      onPaintedWidthChanged: root.textPaintedWidth = paintedWidth
   }

   background: Item {
      id: background

      implicitWidth: root.textPaintedWidth + root.horizontalMargins < 88 ? 88 : root.textPaintedWidth + root.horizontalMargins
      implicitHeight: 48

      Item {
          anchors.fill: parent
          clip: true

          Ripple {
              id: ripple
              anchors.centerIn: parent
              color: light ? Qt.rgba(1, 1, 1, 0.16) : Qt.rgba(0, 0, 0, 0.16)
          }

          Connections {
             target: control
             onClicked: ripple.start()
          }
      }

      states: [
         State {
            name: "normal"
            when: control.enabled
            PropertyChanges {

            }
         },
         State {
            name: "disabled"
            when: !control.enabled
            PropertyChanges {

            }
         }
      ]
   }
}
