//********************************************************
/// @brief 
/// @author yanhuajian
/// @date 2023/12/15
/// @note
/// @version 1.0.0
//********************************************************

#include "SparkleAutoUpdater.h"
#include "ui_SparkleAutoUpdater.h"
#include <QTimer>
#include <QMouseEvent>
#include <QWindow>

SparkleAutoUpdater::SparkleAutoUpdater(QWidget *parent)
        : QWidget(parent), ui(new Ui::SparkleAutoUpdater) {
    ui->setupUi(this);
    setWindowTitle("SparkleAutoUpdater——version 3.0.0");
    connect(ui->btnUpdater, &QPushButton::clicked, this, [=]() {
        Q_EMIT checkForUpdates();
    });

    setAttribute(Qt::WA_Hover, true);
    setAttribute(Qt::WA_MouseTracking, true);
    ui->btnUpdater->setEnabled(false);
}

SparkleAutoUpdater::~SparkleAutoUpdater() {
    delete ui;
}

void SparkleAutoUpdater::mouseMoveEvent(QMouseEvent *event) {
    QWidget::mouseMoveEvent(event);
    if(ui->btnUpdater->geometry().contains(event->pos())) {
        setCursor(Qt::SizeVerCursor);
    } else {
        setCursor(Qt::ArrowCursor);
    }
}
