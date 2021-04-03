import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Window {
    id: main
    minimumHeight: 768
    minimumWidth: 1024
    width: 1024
    height: 768
    title: qsTr("Creative Keypad Config");
    objectName: "mainWindow"
    visible: true

    signal buttonClickedSignal(int id);
    KeypadConfig {
        property var selected: 0;
        objectName: "keypadWindow"
        button11.onClicked: {
            selected = 23
            Backend.getConfig(23);
        }
        button10.onClicked: {
            selected = 22
            Backend.getConfig(22);
        }
        button9.onClicked: {
            selected = 21
            Backend.getConfig(21);
        }
        button8.onClicked: {
            selected = 20
            Backend.getConfig(20);
        }
        button7.onClicked: {
            selected = 19
            Backend.getConfig(19);
        }
        button6.onClicked: {
            selected = 18
            Backend.getConfig(18);
        }
        button5.onClicked: {
            selected = 17
            Backend.getConfig(17);
        }
        button4.onClicked: {
            selected = 16
            Backend.getConfig(16);
        }
        button3.onClicked: {
            selected = 15
            Backend.getConfig(15);
        }
        button2.onClicked: {
            selected = 14
            Backend.getConfig(15);
        }
        button1.onClicked: {
            selected = 13
            Backend.getConfig(13);
        }
        button.onClicked: {
            selected = 12
            Backend.getConfig(12);
        }

        encFRight.onClicked: {
            selected = 11;
            Backend.getConfig(11)
        }

        encFLeft.onClicked: {
            selected = 10;
            Backend.getConfig(10)
        }

        encERight.onClicked: {
            selected = 9;
            Backend.getConfig(9)
        }

        encELeft.onClicked: {
            selected = 8;
            Backend.getConfig(8)
        }

        encDRight.onClicked: {
            selected = 7;
            Backend.getConfig(7)
        }

        encDLeft.onClicked: {
            selected = 6;
            Backend.getConfig(6)
        }

        encCRight.onClicked: {
            selected = 5;
            Backend.getConfig(5)
        }

        encCLeft.onClicked: {
            selected = 4;
            Backend.getConfig(4)
        }

        encBRight.onClicked: {
            selected = 3;
            Backend.getConfig(3)
        }
        encBLeft.onClicked: {
            selected = 2;
            Backend.getConfig(2)
        }
        encARight.onClicked: {
            selected = 1;
            Backend.getConfig(1)
        }
        encALeft.onClicked: {
            selected = 0;
            Backend.getConfig(0);

        }
        confirmButton.onClicked: {
            Backend.writeConfig(selected, 0, textInput.text);
        }

    }
}
