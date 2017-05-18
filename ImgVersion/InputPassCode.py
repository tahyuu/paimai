from Tkinter import *

class InputPassCode():
    def __init__(self, master=None):
        self.passcode=""
        self.root = Tk()
        self.root.title("pass code input window")
        self.root['bg'] = 'lightblue'
        w, h = self.root.winfo_screenwidth(), self.root.winfo_screenheight()
        self.root.geometry("%dx%d+%d+%d" % (25, 25, w-250, h-250))
        self.frame = Frame(self.root)
        self.frame.place(relx=0.5, rely=0.5, anchor=CENTER)
        self.createWidgets()
        self.root.mainloop()
        #Frame.__init__(self, master)
        #self.pack()
    def createWidgets(self):
        self.font = "Times -24 bold"
        self.width =10 
        self.SN_SV = StringVar()
        self.SN = Entry(self.frame, font=self.font, width=self.width)
        self.SN["textvariable"] = self.SN_SV
        self.SN.bind('<KeyPress-Return>', self.SNCheck)
        self.SN.focus_set()
        self.SN.grid(row=0, column=0, sticky=E, pady=5)
        #self.QUIT = Button(self)
        #self.QUIT["text"] = "QUIT"
        #self.QUIT["fg"]   = "red"
        #self.QUIT["command"] =  self.quit
        

        #self.QUIT.pack({"side": "left"})

        #self.hi_there = Button(self)
        #self.hi_there["text"] = "Hello",
        #self.hi_there["command"] = self.say_hi

        #self.hi_there.pack({"side": "left"})
    def SNCheck(self, event):
        passcode = self.SN_SV.get()
        if passcode:
            self.passcode=passcode
            self.root.destroy()


#root = Tk()
#app = Application(master=root)
#app.mainloop()
#root.destroy()
if __name__=="__main__":
    inp=InputPassCode()
    print inp.passcode

