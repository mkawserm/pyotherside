!win32{
    isEmpty(PYTHON_CONFIG) {
        PYTHON_CONFIG = python3-config
    }

    message(PYTHON_CONFIG = $$PYTHON_CONFIG)

    QMAKE_LIBS += $$system($$PYTHON_CONFIG --ldflags)
    QMAKE_CXXFLAGS += $$system($$PYTHON_CONFIG --includes)
}

win32{
    QMAKE_LIBS += -LC:\Python37\libs -lpython37
    QMAKE_CXXFLAGS += -IC:\Python37\include\
}
