import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import ".."

ButtonStyle {
   id: root

   function alphaOf(color, alpha) {
      return Qt.rgba(color.r, color.g, color.b, alpha)
   }

   property Color color: Theme.primaryPalette
   property int   colorIndex: 5
   property bool  light: false
   property int   textPaintedWidth

   property color supportingColor: "#999999"

   onColorIndexChanged: {
      if (colorIndex > 7) {
         colorIndex = 7
      }
      else if (colorIndex < 0) {
         colorIndex = 0
      }
   }
}

