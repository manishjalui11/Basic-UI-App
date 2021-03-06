#clg project password manager
# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from backend.Login import MainWindow

#Instance Class
if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    #Get Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)
    #Load Qml file
    engine.load(os.path.join(os.path.dirname(__file__), "qml/splashScreen.qml"))


    #Check Exit App
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
