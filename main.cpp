#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUuid>
#include <QtBluetooth>
#include <QObject>
#include <QQmlContext>
#include <QFile>
#include <QDataStream>
#include <QIODevice>

#include "creativekeypad.h"
#include "messagehandler.h"
#include "keypadconfiguration.h"
#include "backend.h"

// UART service
QUuid serviceUuid = QUuid("6e400001-b5a3-f393-e0a9-e50e24dcca9e");
// This is RXD on the device, this app receives
QUuid receiveUuid = QUuid("6e400003-b5a3-f393-e0a9-e50e24dcca9e");

QBluetoothDeviceInfo * keypad_info = NULL;
QLowEnergyController * connection = NULL;
QLowEnergyService * keypad_service = NULL;
Backend * gui_backend;
// Master config class

void loadConfig();

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    KeypadConfiguration config;
    /*
     * Load the configuration file into \config\
     */
    QFile file("./config.dat");
    if (!file.open(QIODevice::ReadOnly))
    {
        qDebug() << "Could not open configuration file!";
    } else {
        QDataStream str(&file);
        str.startTransaction();
        str >> config;
        str.commitTransaction();
        file.close();
    }
    QGuiApplication app(argc, argv);

    MessageHandler handler(config);
    CreativeKeypad keypad;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
        else
            loadConfig();
    }, Qt::QueuedConnection);
    gui_backend = new Backend(&engine, &config);

    engine.rootContext()->setContextProperty("Backend", gui_backend);
    engine.rootContext()->setContextProperty("keypadService", &keypad);
    engine.rootContext()->setContextProperty("backendService", gui_backend);
    engine.load(url);

    // Connect the message receiver from the keypad object to the message handler
    QObject::connect(&keypad, &CreativeKeypad::messageReveiced, &handler, &MessageHandler::handleMessage);
    return app.exec();
}
void loadConfig() {

    // Load config data into GUI
    for (int i = 0; i < 24; i++) {
       gui_backend->getConfig(i);
    }
}
