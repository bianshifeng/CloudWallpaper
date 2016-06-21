
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QScreen>
#include <QDebug>


void initEngine(QQmlEngine *engine);
void initView(QQuickView *view);
int main(int argc, char *argv[])
{
    QGuiApplication app(argc,argv);

    QQmlApplicationEngine engine;
    initEngine(qobject_cast<QQmlEngine*> (&engine));
    engine.load(QUrl(QStringLiteral("qrc:/qml/applicationWindow.qml")));

    QQuickView view;
    initView(&view);
    view.show();
    return app.exec();
}

void initView(QQuickView *view)
{
    initEngine(view->engine());
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->setSource(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    view->setModality(Qt::WindowModal);
}

void initEngine(QQmlEngine *engine)
{
    engine->setOfflineStoragePath(QString("./"));
    QObject::connect(engine, SIGNAL(quit()), qApp, SLOT(quit()));

    QString BSF_TEST_FLAG = "false" ;//"false";
    engine->rootContext()->setContextProperty("bsf_test_flag", BSF_TEST_FLAG);
    engine->rootContext()->setContextProperty("app_root_dir",qApp->applicationDirPath());
    engine->rootContext()->setContextProperty("g_rootDir",qApp->applicationDirPath());
    engine->rootContext()->setContextProperty("g_testFlag",qApp->applicationDirPath());

    //and golbal property dp
    QScreen *m_screen = qApp->primaryScreen();
    int m_dpi = m_screen->physicalDotsPerInch() * m_screen->devicePixelRatio();
    bool isMoble = false;

#if defined(Q_OS_IOS)
    //IOS integration of scaling (retina, non-retina, 4k) does itself.
    m_dpi = m_screen->physicalDotsPerInch();
    isMoble = true;
#endif

#if defined(Q_OS_ANDROID)
    // https://bugreports.qt-project.org/browse/QTBUG-35701
    // recalculate dpi for Android

#endif
    // now calculate the dp ratio
    qreal dp = m_dpi / 160.f;
    qDebug() << dp;
    engine->rootContext()->setContextProperty("g_dp",dp);
    engine->rootContext()->setContextProperty("g_isMobile",isMoble);
    engine->rootContext()->setContextProperty("g_gridUnit",64);
    engine->rootContext()->setContextProperty("g_deviceType",5);
}

