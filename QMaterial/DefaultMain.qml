import QtQuick 2.0
import QtQuick.Controls 1.4
import "."
import "Styles"

Page {
   id: view

   actionBar {
      width: parent.width
      height: 56

      title: "Material demo"

      actions: [
         Action {
            text: "Backup"
            iconName: "backup"
         },
         Action {
            text: "Settings"
            iconName: "settings"
         },
         Action {
            text: "Tags"
            iconName: "local_offer"
         },
         Action {
            text: "About"
            iconName: "info_outline"
            onTriggered: console.debug(text)
         },
         Action {
            text: "Close"
            iconName: "info_outline"
            onTriggered: close()
         }
      ]
   }

   content: Item {

      Dialog {
         id: dialog

         width: 290

         style: AlertDialogStyle {
            control: dialog
         }

         title: "Dialog"
         description: "This is a sample dialog message."

         positive: Action {
            text: "Yes"
            onTriggered: console.debug(text)
         }
         negative: Action {
            text: "No"
            onTriggered: console.debug(text)
         }
      }

      Column {
         anchors.fill: parent
         anchors.topMargin: 56
         spacing: 25

         Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "push page"

            style: RaisedButtonStyle {

            }

            onClicked: app.pushPage(Qt.resolvedUrl("qrc:/QMaterial/TempRandomCards.qml"))
         }

         Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "pop page"

            style: FlatButtonStyle {

            }

            onClicked: dialog.state === "hidden" ? dialog.show() : dialog.hide()
         }
      }
   }
}

