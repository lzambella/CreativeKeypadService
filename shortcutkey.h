/**
  * Class describing a single key action
  * A physical key will be mapped to an instance of
  * this class where it can be translated to a keystroke
  *
  * This code is window-specific
  */

#ifndef SHORTCUTKEY_H
#define SHORTCUTKEY_H
#include <QObject>
#include <windows.h>
#include <WinUser.h>
#include <QDataStream>
class ShortcutKey : public QObject
{
public:
    enum MODIFIERS {
        CTRL,
        SHIFT,
        ALT,
        NONE
    };

    ShortcutKey();
    /**
     * @brief ShortcutKey Create an instance of the class
     * @param key The key the button maps to
     * @param mod any modifiers the key should use
     */
    ShortcutKey(QString key, MODIFIERS mod);
    QString getPhysKey() {return this->physical_key; }
    qint64 getVirtKey() { return this->virtual_key; }
    qint64 getVirtMod() { return this->virtual_modifier;}
    MODIFIERS getMod() { return this->mod; }
    /**
     * @brief What physical key this instance represents
     * See the table for a list of keys
     */
    QString physical_key;
    /**
     * @brief virtual keycode the key maps to.
     * Usable by windows
     */
    qint64 virtual_key;
    /**
     * @brief Virtual keycode modifier, if applicable, the key maps to.
     * Usable by windows.
     * This value can be null
     */
    qint64 virtual_modifier;
    MODIFIERS mod;
};
QDataStream &operator<< (QDataStream &, const ShortcutKey &);
QDataStream &operator>> (QDataStream &, ShortcutKey &);
#endif // SHORTCUTKEY_H
