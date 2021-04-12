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
}
