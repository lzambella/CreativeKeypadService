#ifndef KEYPADCONFIGURATION_H
#define KEYPADCONFIGURATION_H
#include "shortcutkey.h"
#include <WinUser.h>
#include <QJsonObject>
#include <QDataStream>
#include <QObject>
#include <QFile>
/**
 * @brief Datastructure for storing a custom configuration of the device
 */
class KeypadConfiguration : public QObject
{

public:
    enum DIRECTION {
        LEFT,
        RIGHT
    };
    KeypadConfiguration();
    /**
     * @brief Set a specific keypad key to a shortcut
     * @param id ID of the key, zero-indexed, from top left to bottom right
     * @param key_config Pointer to a ShortcutKey data structure
     */
    void setKeypadValue(int id, ShortcutKey * key_config);
    /**
     * @brief setEncoderValue Change an encoder's configuration
     * @param id ID of the encoder from top left to bottom right
     * @param key_config Pointer to the configuration to use
     */
    void setEncoderValue(int id, ShortcutKey * key_config, DIRECTION dir);

    /**
     * @brief Serialize all the data of the instance to a file
     * for use with the service program
     */
    void serializeConfiguration();
    /**
     * @brief Number pad configuration where num_i represents the ith key
     * from left to right, top to bottom
     */
    ShortcutKey num_pad[12];
    // Use separate vars for these just because
    // each instance refers to a single encoder
    // and the array values refer to counter clockwise/clockwise movement
    ShortcutKey encoder_a[2];
    ShortcutKey encoder_b[2];
    ShortcutKey encoder_c[2];
    ShortcutKey encoder_d[2];
    ShortcutKey encoder_e[2];
    ShortcutKey encoder_f[2];

    /**
     * @brief id2enc Get the correct encoder based on id
     * @param id ID of the encoder from top-left to bottom-right
     * @return pointer to encoder_[a-f] depending on given id
     */
    ShortcutKey * id2enc(int id);
};

QDataStream &operator<<(QDataStream &, const KeypadConfiguration &);
QDataStream &operator>>(QDataStream &, KeypadConfiguration &);
#endif // KEYPADCONFIGURATION_H
