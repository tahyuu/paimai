#!/usr/bin/python  
#encoding=utf-8  
from twisted.internet.protocol import Factory  
from twisted.protocols.basic import LineReceiver  
from twisted.internet import reactor  
  
class Chat(LineReceiver):  
    def __init__(self, users):  
        self.users = users  
        self.name = None  
        self.state = "login_username"  
  
    def connectionMade(self):  
        self.sendLine("What's your name?")  
  
    def connectionLost(self, reason):  
        if self.users.has_key(self.name):  
            del self.users[self.name]  
  
    def lineReceived(self, line):  
        print self.state
        if self.state == "login_username":  
            self.handle_login_username(line)  
        if self.state == "login_password":  
            self.handle_login_password(line)  
            #self.handle_GETNAME(line)  
        else:  
            self.handle_CHAT(line)  
    def handle_login_username(self, name):
        if self.users.has_key(name):  
            self.sendLine("Name taken, please choose another.")  
            return  
        self.sendLine("please input password:")
        self.name = name  
        #self.users[name] = self  
        self.state = "login_password"  
    def handle_login_password(self, password):
        self.password=password
        # to check if username and password is correct.
        if password=="123":
           self.sendLine("Welcome, %s!" % (self.name,))  
           self.users[self.name] = self  
           self.state = "CHAT"  
        else:
           self.sendLine("the user dosen't exit, please input again!")  
           self.state = "login_username"  
  
    def handle_GETNAME(self, name):  
        if self.users.has_key(name):  
            self.sendLine("Name taken, please choose another.")  
            return  
        self.sendLine("Welcome, %s!" % (name,))  
        self.name = name  
        self.users[name] = self  
        self.state = "CHAT"  
  
    def handle_CHAT(self, message):  
        message = "<%s> %s" % (self.name, message)  
        for name, protocol in self.users.iteritems():  
            if protocol != self:  
                protocol.sendLine(message)  
  
class ChatFactory(Factory):  
  
    def __init__(self):  
        self.users = {}    # maps user names to Chat instances  
  
    def buildProtocol(self, addr):  
        return Chat(self.users)  
  
if __name__ == '__main__':  
    reactor.listenTCP(8123, ChatFactory())  
    reactor.run()  
