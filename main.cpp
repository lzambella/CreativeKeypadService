#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUuid>
#include <QtBluetooth>
#include <QObject>
#include <QQmlContext>

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

// Master config class
KeypadConfiguration config;


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    CreativeKeypad * keypad = new CreativeKeypad();
    MessageHandler * handler = new MessageHandler(config);

    // Connect the message receiver from the keypad object to the message handler
    QObject::connect(keypad, &CreativeKeypad::messageReveiced, handler, &MessageHandler::handleMessage);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    Backend gui_backend(&engine, config);

    engine.rootContext()->setContextProperty("Backend", &gui_backend);
    engine.rootContext()->setContextProperty("keypadService", keypad);
    engine.rootContext()->setContextProperty("backendService", &gui_backend);
    engine.load(url);

    return app.exec();
}
