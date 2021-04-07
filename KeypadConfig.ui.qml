import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    width: 1024
    height: 768
    visible: true
    property alias keyConfig: keyConfig
    property alias text1: text1
    property alias connectStatus: connectStatus
    property alias button11: button11
    property alias button10: button10
    property alias button9: button9
    property alias button8: button8
    property alias button7: button7
    property alias button6: button6
    property alias button5: button5
    property alias button4: button4
    property alias button3: button3
    property alias button2: button2
    property alias button1: button1
    property alias button: button
    property alias ctrlCheckBox: ctrlCheckBox
    property alias altCheckBox: altCheckBox
    property alias shiftCheckBox: shiftCheckBox
    property alias confirmButton: confirmButton
    property alias configKeyDialog: configKeyDialog
    property alias encFRight: encFRight
    property alias encFLeft: encFLeft
    property alias encERight: encERight
    property alias encELeft: encELeft
    property alias encDRight: encDRight
    property alias encDLeft: encDLeft
    property alias encCRight: encCRight
    property alias encCLeft: encCLeft
    property alias encBRight: encBRight
    property alias encBLeft: encBLeft
    property alias encARight: encARight
    property alias encALeft: encALeft

    Rectangle {
        id: configKeyDialog
        objectName: "configDialog"
        x: 0
        y: 0
        width: 1024
        height: 768
        visible: true
        color: "#949ca3"

        CheckBox {
            id: ctrlCheckBox
            objectName: "ctrlCheckbox"
            x: 71
            y: -285
            visible: false
            text: qsTr("Check Box")
        }

        CheckBox {
            id: altCheckBox
            x: 288
            y: -285
            visible: false
            text: qsTr("Check Box")
        }

        CheckBox {
            id: shiftCheckBox
            x: 489
            y: -285
            visible: false
            text: qsTr("Check Box")
        }

        Text {
            id: text1
            x: 249
            y: -375
            visible: false
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 76
            y: -170
            visible: false
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Button {
            id: confirmButton
            x: 398
            y: 590
            visible: false
            text: qsTr("Button")

            Connections {
                target: confirmButton
                onClicked: rectangle.state = "base state"
            }
        }

        Rectangle {
            id: rectangle1
            x: 479
            y: 354
            width: 200
            height: 200
            visible: false
            color: "#ffffff"
        }

        TextEdit {
            id: keyConfig
            x: 391
            y: 506
            width: 80
            height: 20
            visible: false
            text: qsTr("Text Edit")
            font.pixelSize: 12

            Connections {
                target: keyConfig
                onClicked: keyConfig.cursorVisible = "true"
            }
        }

        Button {
            id: cancelButton
            x: 391
            y: 580
            visible: false
            text: qsTr("Button")
            Connections {
                target: cancelButton
                onClicked: rectangle.state = "base state"
            }
        }
    }

    Image {
        id: keypadBase
        x: 0
        y: 147
        width: 1024
        height: 605
        source: "CreativeKeypadAssembly2.png"
        fillMode: Image.PreserveAspectFit

        Button {
            id: button
            x: 363
            y: 307
            width: 62
            height: 59
            opacity: 1
            text: qsTr("1")
            display: AbstractButton.TextBesideIcon
            clip: false
            font.pointSize: 30
        }

        Button {
            id: button1
            x: 442
            y: 307
            width: 62
            height: 59
            text: qsTr("2")
            font.pointSize: 30
        }

        Button {
            id: button2
            x: 517
            y: 307
            width: 62
            height: 59
            text: qsTr("3")
            font.pointSize: 30
        }

        Button {
            id: button3
            x: 594
            y: 307
            width: 62
            height: 59
            text: qsTr("4")
            font.pointSize: 30
        }

        Button {
            id: button4
            x: 363
            y: 382
            width: 62
            height: 59
            text: qsTr("5")
            font.pointSize: 30
        }

        Button {
            id: button5
            x: 442
            y: 382
            width: 62
            height: 59
            text: qsTr("6")
            font.pointSize: 30
        }

        Button {
            id: button6
            x: 517
            y: 382
            width: 62
            height: 59
            text: qsTr("7")
            font.pointSize: 30
        }

        Button {
            id: button7
            x: 594
            y: 382
            width: 62
            height: 59
            text: qsTr("8")
            font.pointSize: 30
        }

        Button {
            id: button8
            x: 363
            y: 458
            width: 62
            height: 59
            text: qsTr("9")
            font.pointSize: 30
        }

        Button {
            id: button9
            x: 442
            y: 458
            width: 62
            height: 59
            text: qsTr("10")
            font.pointSize: 30
        }

        Button {
            id: button10
            x: 517
            y: 458
            width: 62
            height: 59
            text: qsTr("11")
            font.pointSize: 30
        }

        Button {
            id: button11
            x: 594
            y: 458
            width: 62
            height: 59
            text: qsTr("12")
            font.pointSize: 30
        }

        Button {
            id: encALeft
            x: 175
            y: 80
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encARight
            x: 243
            y: 80
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }

        Button {
            id: encBLeft
            x: 175
            y: 273
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encBRight
            x: 243
            y: 273
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }

        Button {
            id: encCLeft
            x: 175
            y: 478
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encCRight
            x: 243
            y: 478
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }

        Button {
            id: encDLeft
            x: 711
            y: 80
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encDRight
            x: 779
            y: 80
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }

        Button {
            id: encELeft
            x: 711
            y: 273
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encERight
            x: 779
            y: 273
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }

        Button {
            id: encFLeft
            x: 711
            y: 478
            width: 62
            height: 59
            text: qsTr("<")
            font.pointSize: 30
        }

        Button {
            id: encFRight
            x: 779
            y: 478
            width: 62
            height: 59
            text: qsTr(">")
            font.pointSize: 30
        }
    }

    states: [
        State {
            name: "EditKey"

            PropertyChanges {
                target: keypadBase
                x: 0
                y: 148
                visible: false
            }

            PropertyChanges {
                target: ctrlCheckBox
                x: 233
                y: 237
                visible: true
                text: qsTr("CTRL")
                checked: false
                font.pointSize: 35
            }

            PropertyChanges {
                target: altCheckBox
                x: 450
                y: 237
                visible: true
                text: qsTr("ALT")
                font.pointSize: 35
            }

            PropertyChanges {
                target: shiftCheckBox
                x: 651
                y: 237
                visible: true
                text: qsTr("SHIFT")
                font.pointSize: 35
            }

            PropertyChanges {
                target: text1
                x: 411
                y: 147
                visible: true
                text: qsTr("Edit Key")
                font.pixelSize: 51
                horizontalAlignment: Text.AlignHCenter
                font.underline: true
                minimumPixelSize: 40
            }

            PropertyChanges {
                target: text2
                x: 238
                y: 352
                visible: true
                text: qsTr("Keystroke:")
                font.pixelSize: 50
            }

            PropertyChanges {
                target: configKeyDialog
                x: 0
                y: 0
                width: 1024
                height: 768
            }

            PropertyChanges {
                target: confirmButton
                x: 238
                y: 590
                visible: true
                text: qsTr("Confirm")
                font.pointSize: 50
            }

            PropertyChanges {
                target: keyConfig
                x: 477
                y: 354
                width: 243
                height: 58
                visible: true
                text: ""
                font.pixelSize: 50
                selectByKeyboard: false
                focus: true
                selectByMouse: true
                persistentSelection: false
                activeFocusOnPress: true
                font.capitalization: Font.AllLowercase
                overwriteMode: false
                cursorVisible: false
                mouseSelectionMode: TextInput.SelectCharacters
                renderType: Text.NativeRendering
            }

            PropertyChanges {
                target: rectangle1
                x: 477
                y: 354
                width: 243
                height: 59
                visible: true
            }

            PropertyChanges {
                target: connectStatus
                horizontalAlignment: Text.AlignHCenter
            }

            PropertyChanges {
                target: cancelButton
                x: 572
                y: 590
                width: 254
                height: 93
                visible: true
                text: qsTr("Cancel")
                font.pointSize: 50
            }
        }
    ]
    Label {
        id: connectStatus
        x: 88
        y: 45
        text: qsTr("Connection Status: Not Connected")
        horizontalAlignment: Text.AlignHCenter
        font.family: "Tahoma"
        font.pointSize: 42
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:12}
}
##^##*/

