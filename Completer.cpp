#include "Completer.h"
#include <QDebug>

Completer::Completer(QObject *parent) :
    QObject(parent), m_completer(nullptr)
{
//    setCaseSensitivity(Qt::CaseInsensitive);
//    setCompletionColumn(0);
//    setCompletionMode(QCompleter::InlineCompletion);
}

QObject *Completer::sourceModel() const
{
    return m_completer->model();
}

int Completer::spellId() const
{
    return m_completer->currentRow();
}

QString Completer::prefix() const
{
    return m_completer->completionPrefix();
}

void Completer::setSourceModel(QObject *arg)
{
    QAbstractItemModel *_arg = qobject_cast<QAbstractItemModel*>(arg);
    Q_ASSERT(_arg);

    // screw keeping around the old completer
    if (m_completer) {
        m_completer->deleteLater();
    }

    m_completer = new QCompleter(_arg, this);
    m_completer->setCaseSensitivity(Qt::CaseInsensitive);
    m_completer->setCompletionRole(_arg->roleNames().key("name"));
    m_completer->setCompletionMode(QCompleter::InlineCompletion);

    connect(m_completer, static_cast<void (QCompleter::*)(const QString&)>(&QCompleter::highlighted), [this](const QString &v) -> void {
        qDebug() << "some highlit!" << v;
        emit bestMatchChanged(v);
    });
//    connect(m_completer, SIGNAL(highlighted(QString)),
//            SIGNAL(bestMatchChanged(QString)));

    emit sourceModelChanged(arg);
}

void Completer::setPrefix(QString arg)
{
    if (m_completer->completionPrefix() == arg)
        return;

    m_completer->setCompletionPrefix(arg);
    m_completer->complete();

    emit prefixChanged(arg);
}
