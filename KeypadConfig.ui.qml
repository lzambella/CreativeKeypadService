import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Rectangle {
    id: rectangle
    width: 1024
    height: 768
    visible: true
    property alias rectangle1: rectangle1
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

    property var selected: 0
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
            x: 546
            y: 403
            width: 200
            height: 200
            visible: false
            color: "#ffffff"

            TextEdit {
                id: keyConfig
                x: 546
                y: 403
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
        height: 606
        source: "CreativeKeypadAssembly2.png"
        fillMode: Image.PreserveAspectFit

        KeyButton {
            id: button
            x: 138
            y: 81
            width: 512
            height: 512
            opacity: 1
            scale: 0.14
            clip: false
            Connections {
                target: button.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 12
                    Backend.getConfig(12)
                }
            }
        }

        KeyButton {
            id: button1
            x: 217
            y: 81
            width: 512
            height: 512
            opacity: 1
            scale: 0.14
            Connections {
                target: button1.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    Backend.getConfig(13)
                    selected = 13
                    console.log("Pressed button 13")
                }
            }
        }

        KeyButton {
            id: button2
            x: 292
            y: 81
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button2.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 14
                    Backend.getConfig(14)
                }
            }
        }

        KeyButton {
            id: button3
            x: 370
            y: 81
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button3.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 15
                    Backend.getConfig(15)
                }
            }
        }

        KeyButton {
            id: button4
            x: 139
            y: 156
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button4.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 16
                    Backend.getConfig(16)
                }
            }
        }

        KeyButton {
            id: button5
            x: 217
            y: 156
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button5.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 17
                    Backend.getConfig(17)
                }
            }
        }

        KeyButton {
            id: button6
            x: 292
            y: 156
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button6.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 18
                    Backend.getConfig(18)
                }
            }
        }

        KeyButton {
            id: button7
            x: 370
            y: 156
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button7.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 19
                    Backend.getConfig(19)
                }
            }
        }

        KeyButton {
            id: button8
            x: 138
            y: 232
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button8.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 20
                    Backend.getConfig(20)
                }
            }
        }

        KeyButton {
            id: button9
            x: 217
            y: 232
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button9.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 21
                    Backend.getConfig(21)
                }
            }
        }

        KeyButton {
            id: button10
            x: 292
            y: 232
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button10.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 22
                    Backend.getConfig(22)
                }
            }
        }

        KeyButton {
            id: button11
            x: 370
            y: 232
            width: 512
            height: 512
            scale: 0.14
            Connections {
                target: button11.buttonMouseArea
                onClicked: {
                    rectangle.state = "EditKey"
                    selected = 23
                    Backend.getConfig(23)
                }
            }
        }

        EncoderButtonCCW {
            id: encALeft
            x: 170
            y: 52
            width: 67
            height: 89
            opacity: 1
            Connections {
                target: encALeft.encMouseArea
                onClicked: {
                    console.log("Button pressed")
                    Backend.getConfig(0)
                    selected = 0
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encARight
            x: 249
            y: 52
            width: 67
            height: 89
            Connections {
                target: encARight.encMouseArea
                onClicked: {
                    Backend.getConfig(1)
                    selected = 1
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCCW {
            id: encBLeft
            x: 170
            y: 245
            width: 67
            height: 93
            Connections {
                target: encBLeft.encMouseArea
                onClicked: {
                    Backend.getConfig(2)
                    selected = 2
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encBRight
            x: 249
            y: 245
            width: 67
            height: 93
            Connections {
                target: encBRight.encMouseArea
                onClicked: {
                    Backend.getConfig(3)
                    selected = 3
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCCW {
            id: encCLeft
            x: 170
            y: 449
            width: 67
            height: 88
            Connections {
                target: encCLeft.encMouseArea
                onClicked: {
                    Backend.getConfig(4)
                    selected = 4
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encCRight
            x: 249
            y: 449
            width: 67
            height: 88
            Connections {
                target: encCRight.encMouseArea
                onClicked: {
                    Backend.getConfig(5)
                    selected = 5
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCCW {
            id: encDLeft
            x: 703
            y: 52
            width: 67
            height: 89
            Connections {
                target: encDLeft.encMouseArea
                onClicked: {
                    Backend.getConfig(6)
                    selected = 6
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encDRight
            x: 781
            y: 52
            width: 67
            height: 89
            Connections {
                target: encDRight.encMouseArea
                onClicked: {
                    Backend.getConfig(7)
                    selected = 7
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCCW {
            id: encELeft
            x: 703
            y: 245
            width: 67
            height: 93
            Connections {
                target: encELeft.encMouseArea
                onClicked: {
                    Backend.getConfig(8)
                    selected = 8
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encERight
            x: 781
            y: 245
            width: 67
            height: 93
            Connections {
                target: encERight.encMouseArea
                onClicked: {
                    Backend.getConfig(9)
                    selected = 9
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCCW {
            id: encFLeft
            x: 703
            y: 449
            width: 67
            height: 88
            Connections {
                target: encFLeft.encMouseArea
                onClicked: {
                    Backend.getConfig(10)
                    selected = 10
                    rectangle.state = "EditKey"
                }
            }
        }

        EncoderButtonCW {
            id: encFRight
            x: 781
            y: 449
            width: 67
            height: 88
            Connections {
                target: encFRight.encMouseArea
                onClicked: {
                    Backend.getConfig(11)
                    selected = 11
                    rectangle.state = "EditKey"
                }
            }
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
                x: 168
                y: 262
                visible: true
                text: qsTr("CTRL")
                font.bold: true
                font.family: "Pragati Narrow"
                checked: false
                font.pointSize: 35
            }

            PropertyChanges {
                target: altCheckBox
                x: 456
                y: 262
                visible: true
                text: qsTr("ALT")
                font.bold: true
                font.family: "Pragati Narrow"
                font.pointSize: 35
            }

            PropertyChanges {
                target: shiftCheckBox
                x: 709
                y: 262
                visible: true
                text: qsTr("SHIFT")
                font.bold: true
                font.family: "Pragati Narrow"
                font.pointSize: 35
            }

            PropertyChanges {
                target: text1
                x: 436
                y: 146
                width: 152
                height: 86
                visible: true
                text: qsTr("Edit Key")
                font.pixelSize: 54
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.family: "Pragati Narrow"
                font.underline: true
                minimumPixelSize: 40
            }

            PropertyChanges {
                target: text2
                x: 308
                y: 405
                width: 178
                height: 59
                visible: true
                text: qsTr("Button")
                font.pixelSize: 50
                font.bold: true
                font.family: "Pragati Narrow"
            }

            PropertyChanges {
                target: configKeyDialog
                x: 0
                y: 0
                width: 1024
                height: 768
                color: "#949ca3"
            }

            PropertyChanges {
                target: confirmButton
                x: 168
                y: 593
                width: 253
                height: 93
                visible: true
                text: qsTr("Confirm")
                font.bold: true
                font.family: "Pragati Narrow"
                font.pointSize: 40
            }

            PropertyChanges {
                target: keyConfig
                x: 0
                y: 0
                width: 243
                height: 59
                visible: true
                text: ""
                font.letterSpacing: 0.4
                font.pixelSize: 50
                selectByKeyboard: false
                focus: true
                selectByMouse: true
                persistentSelection: false
                activeFocusOnPress: true
                font.capitalization: Font.AllLowercase
                overwriteMode: false
                cursorVisible: false
                mouseSelectionMode: TextInput.SelectWords
                renderType: Text.NativeRendering
            }

            PropertyChanges {
                target: rectangle1
                x: 492
                y: 405
                width: 243
                height: 59
                visible: true
                border.color: "#000000"
            }

            PropertyChanges {
                target: connectStatus
                x: 30
                y: 40
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 42
            }

            PropertyChanges {
                target: cancelButton
                x: 606
                y: 593
                width: 253
                height: 93
                visible: true
                text: qsTr("Cancel")
                font.bold: true
                font.family: "Pragati Narrow"
                font.pointSize: 40
            }

            PropertyChanges {
                target: rectangle
                color: "#1e1e1e"
            }
        }
    ]
    Label {
        id: connectStatus
        x: 30
        y: 40
        text: qsTr("Connection Status: Not Connected")
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Pragati Narrow"
        font.pointSize: 42
    }

    Connections {
        target: backendService
        onSendConfiguration: {
            console.log("Received Kebind: ", keybind)
            keypadWindow.setInputText(qsTr(keybind))
        }
    }

    Connections {
        target: confirmButton
        onClicked: {
            if (keyConfig.length == 0) {
                console.log("No input, ignoring")
            } else {
                Backend.writeConfig(selected, 0, keyConfig.text)
            }
            configKey = ""
        }
    }
}
