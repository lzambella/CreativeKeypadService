#include "backend.h"

Backend::Backend(QQmlApplicationEngine * eng, KeypadConfiguration * config)
{
    // Get the QML
    this->engine = eng;
    this->config = config;
    qDebug() << "Engine used:" << engine->baseUrl();
    qDebug() << "Configuration used: " << &this->config;
    /*
     * Send all the configuration parameters to the GUI
     * via signals after the configuration is set so the
     * buttons have their configuration
     */

}
void Backend::loadWindowComponents() {

    // Get the actual view where all the stuff is
    QObject * mainWindow = Backend::engine->findChild<QObject *>("mainWindow");
    if (mainWindow)
        Backend::keypadUI = mainWindow->findChild<QObject *>("keypadWindow");
    if (!Backend::keypadUI)
        qDebug() << "Configuration window not found.";
    else
        qDebug() << " Found the configuration window";
}
void Backend::getConfig(int id) {
    QString keybind;
    qint16 mod;
    // Numpad keys
    if (id > 11 && id < 24) {
        keybind = this->config->num_pad[id - 12].physical_key;
        mod = this->config->num_pad[id - 12].mod;
    } else {
        switch (id) {
        case 0:
            keybind = this->config->encoder_a[0].physical_key;
            mod = this->config->encoder_a[0].mod;
            break;
        case 1:
            keybind = this->config->encoder_a[1].physical_key;
            mod = this->config->encoder_a[1].mod;
            break;
        case 2:
            keybind = this->config->encoder_b[0].physical_key;
            mod = this->config->encoder_b[0].mod;
            break;
        case 3:
            keybind = this->config->encoder_b[1].physical_key;
            mod = this->config->encoder_b[1].mod;
            break;
        case 4:
            keybind = this->config->encoder_c[0].physical_key;
            mod = this->config->encoder_c[0].mod;
            break;
        case 5:
            keybind = this->config->encoder_c[1].physical_key;
            mod = this->config->encoder_c[1].mod;
            break;
        case 6:
            keybind = this->config->encoder_d[0].physical_key;
            mod = this->config->encoder_d[0].mod;
            break;
        case 7:
            keybind = this->config->encoder_d[1].physical_key;
            mod = this->config->encoder_d[1].mod;
            break;
        case 8:
            keybind = this->config->encoder_e[0].physical_key;
            mod = this->config->encoder_e[0].mod;
        case 9:
            keybind = this->config->encoder_e[1].physical_key;
            mod = this->config->encoder_e[1].mod;
            break;
        case 10:
            keybind = this->config->encoder_f[0].physical_key;
            mod = this->config->encoder_f[0].mod;
            break;
        case 11:
            keybind = this->config->encoder_f[1].physical_key;
            mod = this->config->encoder_f[1].mod;
            break;
        default:
            keybind = '0';
            mod = 0;
            break;
        }
    }
    qDebug() << "Sending keybind " << keybind;
    emit sendConfiguration(id, keybind, mod);

}

void Backend::writeConfig(int id, int mod, QString keystroke) {
    qDebug() << "Saving the config";
    qDebug() << "Setting ID " << id << " to " << keystroke;
    // Get the status of the current button and change accordingly
    ShortcutKey shortcut(keystroke, (ShortcutKey::MODIFIERS) mod);
    switch (id) {
    // A Left
    case 0:
        this->config->setEncoderValue(0, &shortcut, KeypadConfiguration::LEFT);
        break;
    // A Right
    case 1:
        this->config->setEncoderValue(0, &shortcut, KeypadConfiguration::RIGHT);
    // B Left
    case 2:
        this->config->setEncoderValue(1, &shortcut, KeypadConfiguration::LEFT);
        break;
    case 3:
        this->config->setEncoderValue(1, &shortcut, KeypadConfiguration::RIGHT);
        break;
    case 4:
        this->config->setEncoderValue(2, &shortcut, KeypadConfiguration::LEFT);
        break;
    case 5:
        this->config->setEncoderValue(2, &shortcut, KeypadConfiguration::RIGHT);
        break;
    case 6:
        this->config->setEncoderValue(3, &shortcut, KeypadConfiguration::LEFT);
        break;
    case 7:
        this->config->setEncoderValue(3, &shortcut, KeypadConfiguration::RIGHT);
        break;
    case 8:
        this->config->setEncoderValue(4, &shortcut, KeypadConfiguration::LEFT);
        break;
    case 9:
        this->config->setEncoderValue(4, &shortcut, KeypadConfiguration::RIGHT);
        break;
    case 10:
        this->config->setEncoderValue(5, &shortcut, KeypadConfiguration::LEFT);
        break;
    case 11:
        this->config->setEncoderValue(5, &shortcut, KeypadConfiguration::RIGHT);
        break;
    default:
        break;
    }
    // Now for the numpad fi applicable
    // This is tedious
    if (id >= 12) {
        // numpad IDS are from 0-11, id will never be higher than 23
        int true_id = id - 12;
        this->config->setKeypadValue(true_id, &shortcut);
    }
    // Use QDatastream streams
    qDebug() << "serializing the configuration";
    // Fill the view with the data from the config
    QFile file("./config.dat");
    if (!file.open(QIODevice::WriteOnly))
            qDebug() << "Could not open file";
    else {
        QDataStream stream(&file);
        stream << *this->config;
        file.close();
        qDebug() << "File written";
    }
    // Send the updated key to the GUI
    emit sendConfiguration(id, keystroke, mod);
}
