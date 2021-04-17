#ifndef MESSAGEHANDLER_H
#define MESSAGEHANDLER_H

#include <QObject>
#include <QDebug>
#include <QFile>
#include <QIODevice>
#include <QDataStream>
#include <windows.h>
#include <WinUser.h>
#include "keypadconfiguration.h"
#include "shortcutkey.h"

/**
  * Max number of keystrokes allowed from device
  * This is standard to bluetotoh LE HID
  */
#define NUM_KEYSTROKES 6
class MessageHandler : public QObject
{
    Q_OBJECT
public:
    // Organized memory
    struct hid_msg {
        char modifier;
        char k[NUM_KEYSTROKES];
    };
    /**
     * @brief Byte array describing which keys are being pressed
     * This should be traversed before deciding which keystroke to send
     * to the operating system.
     */
    QByteArray enabled_keys;
    /**
     * @brief MessageHandler
     * Deafult constructor
     */
    explicit MessageHandler();
    /**
     * @brief MessageHandler
     * Initialize object with a reference to a master config file
     * @param config
     * Reference to the config file to use
     */
    explicit MessageHandler(KeypadConfiguration &config);
    /**
     * @brief Event fired when a message has been received from CreativeKeypad::messageReceived
     * Responsible for parsing raw bytes into
     * @param msg
     */
    void handleMessage(const QByteArray &msg);
    /**
     * @brief Parse raw bytes in the array to a struct
     * @param msg
     * @return
     */
    hid_msg msg2hid(QByteArray msg);

    void sendVirtualKeyEvent(hid_msg hid);
    DWORD hid2vk(char key);
    KeypadConfiguration * config;
private:
    /**
     * @brief msg2key
     * Gets the shortcutkey object the physical key binds to
     * @return
     * a pointer to the key in the configuration class
     */
    ShortcutKey * msg2key(char);
signals:

};

#endif // MESSAGEHANDLER_H
