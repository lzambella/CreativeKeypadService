#ifndef BACKEND_H
#define BACKEND_H
#include "keypadconfiguration.h"
#include "shortcutkey.h"
#include <QQuickView>
#include <QObject>
#include <QQmlApplicationEngine>

/**
 * @brief The backend class
 * Backend class for the UI
 */
class Backend : public QObject
{
    Q_OBJECT
public:
    Backend() {
        this->config = new KeypadConfiguration();
    }
    /**
     * @brief Object constructor
     * @param pointer to the QML file used with all the stuff
     * @param config Reference to a master configuration file to use, should be an address
     */
    Backend(QQmlApplicationEngine * eng, KeypadConfiguration *config);
    /**
     * @brief buttonOnClicked
     * Handles pressing a button by changing to the next state
     * and filling the dialog with parameters from the configuration
     * instance
     * @param id the id number of the button, sent through the signal for each button
     */
    Q_INVOKABLE void getConfig(int id);
    /**
     * @brief confirmButtonClicked
     * takes the info given in state 2 and writes to the config
     * instance. also writes the config to a file. Return to state 1 as well.
     */
    Q_INVOKABLE void writeConfig(int id, int mod, QString keystroke);
    void loadWindowComponents();
signals:
    /**
    * @brief sendConfiguration
    * Send the keybind character as a qstring along with the modifier value as an integer.
    * For sending what the selected button is to QML so the user knows that the button
    * maps to.
    * @param keybind
    * @param modifier
    */
    void sendConfiguration(qint16 id, QString keybind, qint16 modifier);
private:
    /**
     * @brief config
     * Master configuration class instance
     */
    KeypadConfiguration * config;
    /**
     * @brief engine
     * Pointer to the main engine holding the program
     * For manipulating values within this class
     */
    QQmlApplicationEngine * engine;
    QObject * keypadUI;
};

#endif // BACKEND_H
