/**
  * Luke Zambella 2021
  * Custom QML component for a key button
  * Desgined to show what the key has been configured for
  * and what modifiers the key has been set to
  */
import QtQuick 2.0
import QtQuick.Controls 2.5

Item {
    id: keyButton
    property alias buttonMouseArea: buttonMouseArea
    property alias configuredName: configuredName
    property alias ctrlMod: ctrlMod
    property alias altMod: altMod
    property alias shiftMod: shiftMod
    width: 512
    height: 512
    /**
      * User viewable image
      */
    Image {
        id: pushButton
        x: 0
        y: 0
        height: 512
        width: 512
        source: "Assets/ButtonUnselect.png"
    }
    /**
      * Mouse area for interactivity
      */
    MouseArea {
        anchors.fill: pushButton
        id: buttonMouseArea
        hoverEnabled: true
        Connections {
            target: buttonMouseArea
            onEntered: {
                pushButton.source = "Assets/ButtonSelect.png"
            }
            onExited: {
                pushButton.source = "Assets/ButtonUnselect.png"
            }
        }

    }
    /**
      * Text that the button is configured to
      */
    Text {
        id: configuredName
        color: "#ffffff"
        text: qsTr("0")
        anchors.left: pushButton.right
        anchors.right: pushButton.left
        anchors.top: pushButton.bottom
        anchors.bottom: pushButton.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.topMargin: -512
        anchors.bottomMargin: -512
        anchors.rightMargin: -512
        anchors.leftMargin: -512
        font.pointSize: 300
        font.family: "Pragati Narrow"
    }

    /**
      * Displayed texts if any or all of the mods are configured
      */
    Text {
        id: shiftMod
        visible: false
        y: 44
        width: 155
        height: 64
        color: "#ffffff"
        text: qsTr("SHIFT")
        anchors.left: pushButton.right
        anchors.bottom: pushButton.top
        anchors.bottomMargin: -108
        anchors.leftMargin: -176
        font.family: "Pragati Narrow"
        font.pointSize: 40
        minimumPixelSize: 15
    }
    Text {
        id: ctrlMod
        visible: false
        x: 180
        y: -6
        color: "#ffffff"
        text: qsTr("CTRL")
        anchors.right: pushButton.left
        anchors.bottom: pushButton.top
        anchors.bottomMargin: -108
        anchors.rightMargin: -170
        minimumPixelSize: 15
        font.family: "Pragati Narrow"
        font.pointSize: 40
    }
    Text {
        id: altMod
        visible: false
        y: -6
        height: 64
        color: "#ffffff"
        text: qsTr("ALT")
        anchors.left: pushButton.right
        anchors.right: pushButton.left
        anchors.bottom: pushButton.top
        horizontalAlignment: Text.AlignHCenter
        anchors.bottomMargin: -108
        anchors.rightMargin: -317
        anchors.leftMargin: -317
        minimumPixelSize: 15
        font.pointSize: 40
        font.family: "Pragati Narrow"
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
