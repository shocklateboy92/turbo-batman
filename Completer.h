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
    Q_PROPERTY(int spellId READ spellId NOTIFY spellIdChanged)

public:
    explicit Completer(QObject *parent = 0);

    QObject* 	sourceModel() const;
    int 	spellId() const;
    QString 	prefix() const;

signals:
    void sourceModelChanged(QObject* arg);
    void spellIdChanged(int arg);
    void prefixChanged(QString arg);
    void bestMatchChanged(const QString &text);

public slots:
    void setSourceModel(QObject* arg);
    void setPrefix(QString arg);

private:
    QCompleter *m_completer;
};

#endif // COMPLETER_H
