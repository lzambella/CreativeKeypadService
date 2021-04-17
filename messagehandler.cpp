#include "messagehandler.h"
MessageHandler::MessageHandler() {

}
MessageHandler::MessageHandler(KeypadConfiguration &config)
{
    //enabled_keys->resize(NUM_KEYSTROKES);
    enabled_keys.resize(6);
    // Point the instance config to the address of the object
    this->config = &config;
}

void MessageHandler::handleMessage(const QByteArray &msg) {
    qDebug("Message Received!");
    qDebug() << "Message: " << msg;

    if (msg.size() != NUM_KEYSTROKES +2) {
        qDebug("Payload is not the correct size! Ignoring...");
        return;
    } else {
        MessageHandler::hid_msg hid = msg2hid(msg);
        MessageHandler::sendVirtualKeyEvent(hid);
    }

}

MessageHandler::hid_msg MessageHandler::msg2hid(QByteArray msg) {
    struct MessageHandler::hid_msg hid;

    // Ignore the first two bytes of the report
    for (int i = 2; i < NUM_KEYSTROKES + 2; i++) {
        hid.k[i - 2] = msg.at(i);
    }
    return hid;
}

void MessageHandler::sendVirtualKeyEvent(MessageHandler::hid_msg hid) {
    // Check each key event when there is a change
    // This method allows for n-key rollover
    INPUT input;		// Have no idea if there are modifiers or not, each require seperate input
    for (int i = 0; i < NUM_KEYSTROKES; i++) {
        // If key release, set the enabled_keys[i] to zero as well
        if (hid.k[i] == 0x00 && enabled_keys.at(i) != 0x00) {
            // release the key
            INPUT release;
            ZeroMemory(&release, sizeof(release));
            release.type = INPUT_KEYBOARD;
            release.ki.dwFlags = KEYEVENTF_KEYUP;
            release.ki.wVk = hid2vk(enabled_keys.at(i));
            release.ki.wScan = enabled_keys.at(i);
            SendInput(1, &release, sizeof(INPUT));
            enabled_keys[i] = 0x00;
            // Release any modifiers (if any)
            INPUT modifiers[3];
            ZeroMemory(modifiers, sizeof(modifiers));
            modifiers[0].ki.wVk = VK_RCONTROL;
            modifiers[1].ki.wVk = VK_MENU;
            modifiers[2].ki.wVk = VK_RSHIFT;
            for (int x = 0; x < 3; x++) {
                modifiers[x].type = INPUT_KEYBOARD;
                modifiers[x].ki.dwFlags = KEYEVENTF_KEYUP;
            }
            SendInput(3, modifiers, sizeof(INPUT));
         } else if (hid.k[i] == enabled_keys.at(i))
            continue;
        // Check if modifiers
        ShortcutKey * key = msg2key(hid.k[i]);
        INPUT modifier;
        ZeroMemory(&modifier, sizeof(modifier));
        if (key != NULL) {
            switch (key->mod) {
            case ShortcutKey::MODIFIERS::CTRL:
                modifier.type = INPUT_KEYBOARD;
                modifier.ki.wVk = VK_RCONTROL;
                SendInput(1, &modifier, sizeof(INPUT));
                break;
            case ShortcutKey::MODIFIERS::ALT:
                modifier.type = INPUT_KEYBOARD;
                modifier.ki.wVk = VK_MENU;
                SendInput(1, &modifier, sizeof(INPUT));
                break;
            case ShortcutKey::MODIFIERS::SHIFT:
                modifier.type = INPUT_KEYBOARD;
                modifier.ki.wVk = VK_RSHIFT;
                SendInput(1, &modifier, sizeof(INPUT));
                break;
            case ShortcutKey::MODIFIERS::NONE:
                break;
            }
        }

        ZeroMemory(&input, sizeof(input));
        // Go through the keystroke and create a windows-compatible virtual keycode event
        input.type = INPUT_KEYBOARD;
        DWORD VK = hid2vk(hid.k[i]);
        input.ki.wVk = VK;
        input.ki.wScan = hid.k[i];
        SendInput(1, &input, sizeof(INPUT));
        char c = hid.k[i];
        enabled_keys[i] = c;
    }
}

// This should eventually be customizable with a struct containing
// any modifiers and keys
DWORD MessageHandler::hid2vk(char key) {
    //qDebug("Received key: %x", key);
    switch (key) {
    case 0x27:
        return this->config->num_pad[0].virtual_key;
    case 0x1E:
        return this->config->num_pad[1].virtual_key;
    case 0x1F:
        return this->config->num_pad[2].virtual_key;
    case 0x20:
        return this->config->num_pad[3].virtual_key;
    case 0x21:
        return this->config->num_pad[4].virtual_key;
    case 0x22:
        return this->config->num_pad[5].virtual_key;
    case 0x23:
        return this->config->num_pad[6].virtual_key;
    case 0x24:
        return this->config->num_pad[7].virtual_key;
    case 0x25:
        return this->config->num_pad[8].virtual_key;
    case 0x26:
        return this->config->num_pad[9].virtual_key;
    case 0x04:				// Encoder A Left
        return this->config->encoder_a[1].virtual_key;
    case 0x05:				// Encoder A Right
        return this->config->encoder_b[1].virtual_key;
    case 0x06:
        return this->config->encoder_c[1].virtual_key;
    case 0x07:
        return this->config->encoder_d[1].virtual_key;
    case 0x08:
        return this->config->encoder_e[1].virtual_key;
    case 0x09:
        return this->config->encoder_f[1].virtual_key;
    case 0x0A:
        return this->config->encoder_a[0].virtual_key;
    case 0x0B:
        return this->config->encoder_b[0].virtual_key;
    case 0x0C:
        return this->config->encoder_c[0].virtual_key;
    case 0x0D:
        return this->config->encoder_d[0].virtual_key;
    case 0x0E:
        return this->config->encoder_e[0].virtual_key;
    case 0x0F:
        return this->config->encoder_f[0].virtual_key;
    }
    return 0x00;
}

ShortcutKey * MessageHandler::msg2key(char key) {
    switch (key) {
    case 0x27:
        return &this->config->num_pad[0];
    case 0x1E:
        return &this->config->num_pad[1];
    case 0x1F:
        return &this->config->num_pad[2];
    case 0x20:
        return &this->config->num_pad[3];
    case 0x21:
        return &this->config->num_pad[4];
    case 0x22:
        return &this->config->num_pad[5];
    case 0x23:
        return &this->config->num_pad[6];
    case 0x24:
        return &this->config->num_pad[7];
    case 0x25:
        return &this->config->num_pad[8];
    case 0x26:
        return &this->config->num_pad[9];
    case 0x04:				// Encoder A Left
        return &this->config->encoder_a[1];
    case 0x05:				// Encoder A Right
        return &this->config->encoder_b[1];
    case 0x06:
        return &this->config->encoder_c[1];
    case 0x07:
        return &this->config->encoder_d[1];
    case 0x08:
        return &this->config->encoder_e[1];
    case 0x09:
        return &this->config->encoder_f[1];
    case 0x0A:
        return &this->config->encoder_a[0];
    case 0x0B:
        return &this->config->encoder_b[0];
    case 0x0C:
        return &this->config->encoder_c[0];
    case 0x0D:
        return &this->config->encoder_d[0];
    case 0x0E:
        return &this->config->encoder_e[0];
    case 0x0F:
        return &this->config->encoder_f[0];
    }
    return NULL;
}
