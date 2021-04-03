#include "shortcutkey.h"

ShortcutKey::ShortcutKey()
{
    this->mod = ShortcutKey::NONE;
    this->physical_key = '\0';
    this->virtual_key = (qint64) 0;
    this->virtual_modifier = 0;
}
ShortcutKey::ShortcutKey(QString key, ShortcutKey::MODIFIERS mod) {
    char k = key.toUtf8()[0];
    this->mod = mod;
    this->physical_key = key;
    // For the virtual keys
    HKL locale = LoadKeyboardLayoutA("0x0409", 1);
    this->virtual_key = (qint64) VkKeyScanEx(k, locale);
    switch (mod) {
    case ShortcutKey::CTRL:
        this->virtual_modifier = VK_LCONTROL;
        break;
    case ShortcutKey::ALT:
        break;
    case ShortcutKey::SHIFT:
        this->virtual_modifier = VK_LSHIFT;
        break;
    case ShortcutKey::NONE:
        this->virtual_modifier = NULL;
        break;
    default:
        this->virtual_modifier = NULL;
        break;
    }

}

QDataStream &operator<<(QDataStream &out, ShortcutKey const &in) {
    out << qint64(in.mod)
        << QString(in.physical_key)
        << qint64(in.virtual_key)
        << qint64(in.virtual_modifier);
    return out;
}


QDataStream &operator>>(QDataStream &in, ShortcutKey &key) {
    qint64 mod;
    QString phys_key;
    qint64 virt_key, virt_mod;
    in >> mod;
    in >> phys_key;
    in >> virt_key;
    in >> virt_mod;
    ShortcutKey tmp(phys_key, (ShortcutKey::MODIFIERS) mod);
    key.mod = tmp.mod;
    key.virtual_key = tmp.virtual_key;
    key.virtual_modifier = tmp.virtual_modifier;
    key.physical_key = tmp.physical_key;
    return in;
}
