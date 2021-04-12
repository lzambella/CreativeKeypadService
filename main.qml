import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Window {
    id: main
    minimumHeight: 768
    minimumWidth: 1024
    maximumHeight: 768
    maximumWidth: 1024
    width: 1024
    height: 768
    title: qsTr("Creative Keypad Config");
    objectName: "mainWindow"
    visible: true

    signal buttonClickedSignal(int id);

    KeypadConfig {
        id: keypadWindow
        property var selected: 0;
        // Temp holder for what to fill key text input with
        property var configKey: 'null'
        objectName: "keypadWindow"

        keyConfig.onStateChanged: {
            console.log("Textinput changed to", configKey);
            keyConfig.text = qsTr(configKey);
        }

        /**
          * Tedious code for every single button
          * I can't figure otu a way to do this elegantly
          */
        button11.onClicked: {
            this.state = "EditKey";
            selected = 23
            Backend.getConfig(23);
        }
        button10.onClicked: {
            this.state = "EditKey";
            selected = 22
            Backend.getConfig(22);
        }
        button9.onClicked: {
            this.state = "EditKey";
            selected = 21
            Backend.getConfig(21);
        }
        button8.onClicked: {
            this.state = "EditKey";
            selected = 20
            Backend.getConfig(20);
        }
        button7.onClicked: {
            this.state = "EditKey";
            selected = 19
            Backend.getConfig(19);
        }
        button6.onClicked: {
            this.state = "EditKey";
            selected = 18
            Backend.getConfig(18);
        }
        button5.onClicked: {
            this.state = "EditKey";
            selected = 17
            Backend.getConfig(17);
        }
        button4.onClicked: {
            this.state = "EditKey";
            selected = 16
            Backend.getConfig(16);
        }
        button3.onClicked: {
            this.state = "EditKey";
            selected = 15
            Backend.getConfig(15);
        }
        button2.onClicked: {
            this.state = "EditKey";
            selected = 14
            Backend.getConfig(14);
        }
        button1.onClicked: {
            this.state = "EditKey";
            selected = 13
            Backend.getConfig(13);
        }
        button.onClicked: {
            this.state = "EditKey";
            selected = 12
            Backend.getConfig(12);
        }

        encFRight.onClicked: {
            this.state = "EditKey";
            selected = 11;
            Backend.getConfig(11)
        }

        encFLeft.onClicked: {
            this.state = "EditKey";
            selected = 10;
            Backend.getConfig(10)
        }

        encERight.onClicked: {
            this.state = "EditKey";
            selected = 9;
            Backend.getConfig(9)
        }

        encELeft.onClicked: {
            this.state = "EditKey";
            selected = 8;
            Backend.getConfig(8)
        }

        encDRight.onClicked: {
            this.state = "EditKey";
            selected = 7;
            Backend.getConfig(7)
        }

        encDLeft.onClicked: {
            this.state = "EditKey";
            selected = 6;
            Backend.getConfig(6)
        }

        encCRight.onClicked: {
            this.state = "EditKey";
            selected = 5;
            Backend.getConfig(5)
        }

        encCLeft.onClicked: {
            this.state = "EditKey";
            selected = 4;
            Backend.getConfig(4)
        }

        encBRight.onClicked: {
            this.state = "EditKey";
            selected = 3;
            Backend.getConfig(3)
        }
        encBLeft.onClicked: {
            this.state = "EditKey";
            selected = 2;
            Backend.getConfig(2)
        }
        confirmButton.onClicked: {
            if (keyConfig.length == 0) {
                console.log("No input, ignoring");
            } else {
                Backend.writeConfig(selected, 0, keyConfig.text);
            }
            configKey = "";
        }

        function setConnectedText()  {
            connectStatus.text = "Keypad Status: Connected";
        }
        function setDisconnectedText() {
            connectStatus.text = "Keypad Status: Not Connected";
        }
        function setInputText(txt) {
            // megahack
            console.log("Setting textinput to ", txt);
            configKey = txt;
        }

    }

        Connections {
            target: keypadService
            /**
              * Change the connected message to true
              */
            onKeypadConnected: {
                keypadWindow.setConnectedText();
            }
        }
    Connections {
        target: backendService
        onSendConfiguration: {
            console.log("Received Kebind: ", keybind);
            keypadWindow.setInputText(qsTr(keybind));
        }
    }
}
