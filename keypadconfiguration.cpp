#include "keypadconfiguration.h"

KeypadConfiguration::KeypadConfiguration()
{
}

void KeypadConfiguration::setEncoderValue(int id,
                                            ShortcutKey *key_config,
                                            KeypadConfiguration::DIRECTION dir) {
    int i = (dir == KeypadConfiguration::LEFT ? 1 : 0);
    switch (id) {
    case 0:
        KeypadConfiguration::encoder_a[i].mod = key_config->mod;
        KeypadConfiguration::encoder_a[i].virtual_key = key_config->virtual_key;
        KeypadConfiguration::encoder_a[i].virtual_modifier = key_config->virtual_modifier;
        KeypadConfiguration::encoder_a[i].physical_key = key_config->physical_key;
        break;
    default:
        break;
    }
    qDebug() << "Encoder configured";
}
void KeypadConfiguration::serializeConfiguration() {
}
void KeypadConfiguration::setKeypadValue(int id, ShortcutKey *key_config) {
    qDebug() << "Set the Keypad Value";
    this->num_pad[id].virtual_key = key_config->virtual_key;
    this->num_pad[id].virtual_modifier = key_config->virtual_modifier;
    this->num_pad[id].physical_key = key_config->physical_key;
    this->num_pad[id].mod = key_config->mod;
}
QDataStream &operator<<(QDataStream &out, const KeypadConfiguration &config) {
    for (int i = 0; i < 12; i++) {
        out << config.num_pad[i];
    }
    for (int i = 0; i < 2; i++) {
        out << config.encoder_a[i]
            << config.encoder_b[i]
            << config.encoder_c[i]
            << config.encoder_d[i]
            << config.encoder_e[i]
            << config.encoder_f[i];
    }
    return out;
}

QDataStream &operator>>(QDataStream &in, KeypadConfiguration &config) {
    int i;
    for (i = 0; i < 12; i++) {
        in >> config.num_pad[i];
    }
    for (i = 0; i < 2; i++) {
        in >> config.encoder_a[i]
           >> config.encoder_b[i]
           >> config.encoder_c[i]
           >> config.encoder_d[i]
           >> config.encoder_e[i]
           >> config.encoder_f[i];
    }
    return in;
}
