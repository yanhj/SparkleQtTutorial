//********************************************************
/// @brief 
/// @author yanhuajian
/// @date 2023/12/15
/// @note
/// @version 1.0.0
//********************************************************

#pragma once

#include <QWidget>


QT_BEGIN_NAMESPACE
namespace Ui { class SparkleAutoUpdater; }
QT_END_NAMESPACE

class SparkleAutoUpdater : public QWidget {
Q_OBJECT

public:
    explicit SparkleAutoUpdater(QWidget *parent = nullptr);

    ~SparkleAutoUpdater() override;


protected:
    void mouseMoveEvent(QMouseEvent *event) override;

Q_SIGNALS:
    void checkForUpdates();


private:
    Ui::SparkleAutoUpdater *ui;
};
