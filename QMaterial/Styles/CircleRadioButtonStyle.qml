import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

RadioButtonStyle {
   spacing: 24

   label: Label {
      text: control.text
      fontStyle: FontStyles.subheading
   }

   indicator: Icon {
      implicitWidth: 24
      implicitHeight: 24

      name: "radio_button_unchecked"
      color: Theme.secondaryText

      Icon {
         opacity: control.checked
         Behavior on opacity { NumberAnimation { duration: 100 } }

         name: "radio_button_checked"
         color: Theme.primaryColor
      }
   }
}
