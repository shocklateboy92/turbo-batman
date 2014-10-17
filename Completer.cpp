#include "Completer.h"
#include <QDebug>
#include <QAbstractProxyModel>

Completer::Completer(QObject *parent) :
    QObject(parent), m_completer(new QCompleter(this))
{
    m_completer->setCompletionMode(QCompleter::InlineCompletion);
    m_completer->setCaseSensitivity(Qt::CaseInsensitive);

//    connect(m_completer, SIGNAL(highlighted(QString)),
//            SIGNAL(bestMatchChanged(QString)));
//    connect(this, &Completer::bestMatchChanged, [this](){
//         emit bestMatchIdChanged(bestMatchId());
//    });
}

QObject *Completer::sourceModel() const
{
    return m_completer->model();
}

int Completer::bestMatchId() const
{
    QAbstractProxyModel *m = qobject_cast<QAbstractProxyModel*>(
                m_completer->completionModel());
    Q_ASSERT(m);
    return m->mapToSource(m_completer->currentIndex()).row();
}

QString Completer::bestMatch() const
{
    return m_completer->currentCompletion();
}

QString Completer::prefix() const
{
    return m_completer->completionPrefix();
}

void Completer::setSourceModel(QObject *arg)
{
    QAbstractItemModel *_arg = qobject_cast<QAbstractItemModel*>(arg);
    Q_ASSERT_X(_arg, "completer", "source model is not a data model");

    m_completer->setModel(_arg);
    m_completer->setCompletionRole(_arg->roleNames().key("name"));

    emit sourceModelChanged(arg);
}

void Completer::setPrefix(QString arg)
{
    if (m_completer->completionPrefix() == arg)
        return;

    m_completer->setCompletionPrefix(arg);
    m_completer->complete();

    emit prefixChanged(arg);
    emit bestMatchChanged(bestMatch());
    emit bestMatchIdChanged(bestMatchId());
}
