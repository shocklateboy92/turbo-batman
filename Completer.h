#ifndef COMPLETER_H
#define COMPLETER_H

#include <QCompleter>

class Completer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString prefix READ prefix
               WRITE setPrefix NOTIFY prefixChanged)
    Q_PROPERTY(QObject* sourceModel READ sourceModel
               WRITE setSourceModel NOTIFY sourceModelChanged)
    Q_PROPERTY(QString bestMatchId READ bestMatchId NOTIFY bestMatchIdChanged)
    Q_PROPERTY(int bestMatchId READ bestMatchId NOTIFY bestMatchIdChanged)

public:
    explicit Completer(QObject *parent = 0);

    QObject* 	sourceModel() const;
    int 		bestMatchId() const;
    QString 	bestMatch() const;
    QString 	prefix() const;

signals:
    void sourceModelChanged(QObject* arg);
    void prefixChanged(QString arg);
    void bestMatchIdChanged(int arg);
    void bestMatchChanged(const QString &text);

public slots:
    void setSourceModel(QObject* arg);
    void setPrefix(QString arg);

private:
    QCompleter *m_completer;
};

#endif // COMPLETER_H
