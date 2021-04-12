/**
  * Custom QT Button with style
  * Button with CW arrow
  *
  * Use `encMouseArea` mouseArea signals for all interactivity
  */
import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    property alias encMouseArea: encMouseArea
    Button {
        id: encButton;
        anchors.fill: parent
        background: Image {
            id: encButtonImage
            source: "Assets/ArrowCWUnselect.png"
        }
    }
    MouseArea {
        id: encMouseArea
        anchors.fill: parent
        hoverEnabled: true
        Connections {
            /**
            * Mouse hover event
            */
            onEntered: {
                encButtonImage.source = "Assets/ArrowCWSelect.png"
            }
            /**
            * Mouse no longer hovering over
            */
            onExited: {
                encButtonImage.source = "Assets/ArrowCWUnselect.png"
            }
        }

    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}
}
##^##*/
