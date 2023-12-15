#import <QApplication>
#import "updater.h"
#include "SparkleAutoUpdater.h"

int main(int argc, char *argv[]) {
    @autoreleasepool {
        QApplication app(argc, argv);
        SparkleAutoUpdater wUpdater;
        wUpdater.show();
        Updater *updater = new Updater();
        QObject::connect(&wUpdater, &SparkleAutoUpdater::checkForUpdates, updater, &Updater::checkForUpdates);
        return app.exec();
    }
}
