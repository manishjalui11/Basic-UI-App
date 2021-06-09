
from PySide2.QtCore import QObject, Slot, Signal

#Main Window Class
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    #static info
    staticUser = "manish"
    staticPass = "mj"
    staticId = 3

    #Signal To Sennd Data
    signnalUser = Signal(str)
    signnalPass = Signal(str)
    signnalId = Signal(int)
    signalLogin = Signal(bool)

    #Funnction to Check Login
    @Slot(str,str)
    def checkLogin(self, getUser, getPass):
        if(self.staticUser.lower()==getUser.lower() and self.staticPass==getPass):
            #Send User, Id and Pass
            # self.signnalUser.emit("Username: " + self.staticUser)
            # self.signnalPass.emit("Password: " + self.staticPass)
            # self.signnalId.emit(self.staticId)

            #Send Login Signal
            self.signalLogin.emit(True)
            print("Loginned")
        else:
            self.signalLogin.emit(False)
            print("Error")