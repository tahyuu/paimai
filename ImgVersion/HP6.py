import urllib
import urllib2
import cookielib
import random
import json
import time
from MK import *
from PIL import ImageGrab
import pytesseract
from PIL import Image,ImageEnhance,ImageFilter,ImageFilter
from sys import argv
from InputPassCode import InputPassCode 
import win32con
import win32gui
import win32process
import subprocess
import threading
import random

#---------------------config---------------------
add_price_strategy=2 # add price strategy is 1 mean add price with 1000-(price_on_2-price_on_1)>800?1000-(price_on_2-price_on_1):800; 2 means price_on_2+900
second_on_2=48 # for strategy 1 and 2
pushByforce=53 # for strategy 1 and 2
# strategy1 
second_on_1=40 # for strategy 1

# strategy2 
strategy_2_add_price=900 #for strategy 2
#---------------------config--------------------

#paramater
latestPrice = 0
price_on_1= 0
price_on_2= 0 
stopFlag = False
currentSecond=0
logstr=""

class HP:
    def __init__(self):
        global add_price_strategy
        global pushByforce
    	#add price strategy is 1 mean add price with 1000-(price_on_2-price_on_1)>800?1000-(price_on_2-price_on_1):800; 2 means price_on_2+900
	self.add_price_strategy=add_price_strategy
        self.pushByforce=pushByforce
        self.selfInputPrice=True
        self.price_on_1=0
        self.price_on_2=0
        self.RunModel=2 # if runModl is 1 then submit at 49 go run1, if runmodle is 2 go run2
        self.CheckPassCode=True
        self.passcode=""
        #self.CheckPassCode=False
        self.points={"enterPrice":(889,398), # enter price input
                "addPrice":(981,398), # add price button
                "offerPrice":(985,501), # offer price button
                "flashPasscode":(500,502),# flash price button
                "readPasscode":(687,494), # not need for this time
                "readTime":(302,483), # right position of read system Time
                "readPrice":(330,500), # right position of read latest price
                "readMyPrice":(862,350),# right position of readMyPrice in righ
                "submit":(745,592), # submit button
                "cancelSubmit":(745,592), # submit button
                "getInputpasscode":(876,494),#the right postion of input passcode
                }
        self.dict = {}
        self.step="Init the HP class and Read config file"
        self.latestPrice=0
        self.currentTime_in_str=""
        self.currentSecond=0
        lines=[]
        self.passcodeSize=(114,33)
        self.timeSize=(70,16)
        self.priceSize=(46,14)
        self.mypriceSize=(54,24)
        self.getinputpasscodeSize=(80,27)
        self.cookieid=0
        self.inputedPasscode=""
        self.Flag_input_passcode=False
        lines = file("positions.txt").readlines()
        for i in lines:
            if i.strip() != '' and i[0] != '#':
                tmp = i.split(":")
                self.dict[tmp[0]] = eval(tmp[1])
        self.points=self.dict
        self.Imgsaved=False
        self.action=""
        self.step="waitForStart"
        self.startWaitTime=0
        #self.step="exit"
    def waitForStart(self):
        global currentSecond
	global price_on_2
        if True:
            if self.action.find("TestPoints")>-1:
                self.step="enterPrice"
                return
            #currentTime_in_str=self.readTime()
            #if not currentTime_in_str:
            #    self.step="waitForStart"
            #    return
            #else:
            #    currentSecond=self.readTime()
            #print "current second:%s" %currentSecond
	    #change to check if the price_on_2 > price_on_1
            if price_on_2>price_on_1:
                self.step="enterPrice"
        #print self.step
        try:
            pass
        except:
                self.step="waitForStart"
        #read the current time and decide which price should be add is better
        #startTime=time.time()
        #while time.time()-startTime<30:
        #for i in xrange(10):
        #    self.readTime()
        #for i in xrange(500):
        #     self.enterPrice()
        #    self.readTime(i)
        #print time.time()-startTime
        #self.step="exit"
        #if self.readTime():
        #    pass
        #if self.readPrice():
        #    pass
    def enterPrice(self):
        #if True:
        global latestPrice
        global price_on_1
        global price_on_2
        global logstr
        if self.selfInputPrice:
            point=self.points["inputPrice"]
	    if self.add_price_strategy==1:
            	bestPrice=((1000-(price_on_2-price_on_1))>=800 and price_on_2+(1000-(price_on_2-price_on_1)) or price_on_2+800)
	    else:
            	bestPrice=price_on_2+900
            bestPrice=bestPrice>latestPrice and bestPrice or latestPrice+300
            print "price_on_1s is:%s; price_on_2s is:%s; best price is:%s" %(price_on_1,price_on_2,bestPrice)
            logstr+= "price_on_1s is:%s; price_on_2s is:%s; best price is:%s\n" %(price_on_1,price_on_2,bestPrice)
            mouse_dclick(point[0],point[1])
            if self.action.find("TestPoints")>-1:
                bestPrice=88000
            key_input(str(bestPrice))
            self.step="addPrice"
            return
        else:
            addprice=0
            point=self.points["enterPrice"]
            if price_on_2>0 and price_on_1>0:
                addprice=str(((1000-(price_on_2-price_on_1))>=800 and (1000-(price_on_2-price_on_1)) or 800))
            else:
                self.step="enterPrice"
                return
            print "price_on_1s is:%s; price_on_2s is:%s; add price is:%s" %(price_on_1,price_on_2,addprice)
            logstr+= "price_on_1s is:%s; price_on_2s is:%s; add price is:%s\n" %(price_on_1,price_on_2,addprice)
                
            #print type(addprice)
            #if action is test points then add price value is 88000
            mouse_dclick(point[0],point[1])
            time.sleep(0.1)
            key_input(str(addprice))
            self.step="addPrice"
         #   #self.step="addPrice"
        #try:
        #    pass
        #except:
        #    self.step="enterPrice"
    def addPrice(self):
        if True:
            if not self.selfInputPrice:
                point=self.points["addPrice"]
                mouse_click(point[0],point[1])
            self.step="offerPrice"
        try:
            pass
        except:
            self.step="addPrice"
        pass
    def offerPrice(self):
        if True:
            point=self.points["offerPrice"]
            mouse_click(point[0],point[1])
            #time.sleep(0.2)
            #self.myPrice=int(self.readMyPrice())
            self.step="flashPasscode"
        try:
            pass
        except:
            self.step="offerPrice"
        pass
    def flashPasscode(self):
        if True:
            if self.RunModel==2:
                self.step="inputPasscode"
                return
            #to get the image file and check the rectange image is black or blue. if so then click until the correct passcode 
            for i in range(4):
                time.sleep(0.3)
                point=self.points["flashPasscode"]
                mouse_click(point[0],point[1])
            if self.RunModel==1:
                point=self.points["getInputpasscode"]
                mouse_click(point[0]+80,point[1]+15)
            self.step="inputPasscode"
            #point=self.points["submit"]
            #mouse_move(point[0],point[1])
            #self.step="exit"
        try:
            pass
        except:
            self.step="flashPasscode"
    def inputPasscode(self):
        if True:
            #point=self.points["comdPosition"]
            #mouse_click(point[0],point[1])
            #passcode=raw_input()
            #to read my price
            if self.RunModel==0:
                self.passcode="%s" %random.randint(0,10000)
                time.sleep(6)
                #self.notepad = subprocess.Popen ([r"python","InputPassCode.py"],stdout=subprocess.PIPE)
                #for hwnd in get_hwnds_for_pid (self.notepad.pid):
                #    print hwnd, "=>", win32gui.GetWindowText (hwnd)
                #    win32gui.SetForegroundWindow(hwnd)
                #self.notepad.wait()
                print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                #self.passcode=self.notepad.communicate()[0].strip()
                #print "XXXXXXXXXXXXX %s" %self.passcode
                #self.passcode=self.passcode=
                #inp=InputPassCode()
                #inp.pid
                #self.passcode=inp.passcode 
                self.step="waitForSubmit"
                return
            elif self.RunModel==2:
                try:
                    self.myPrice=int(self.readMyPrice())
                except:
                    self.myPrice=0
                    
                point=self.points["getInputpasscode"]
                mouse_click(point[0]+30,point[1]+7)
                print self.passcode
                key_input(self.passcode)
                self.step="waitForSubmit"
                return
            elif  self.RunModel==1:
                self.myPrice=int(self.readMyPrice().replace(" ",""))
                self.step="waitForSubmit"
                return
        try:
            pass
        except:
            self.step="inputPasscode"
            
        return self.passcode
    def waitForSubmit(self):
        global latestPrice
        global currentSecond
        global logstr
        if True:
            # read the price if evluate price - readprice <500 then submit
            # or time > 55s then submit
            # if not input pass code will wait
            #########################################################
            #if the runmodel is 2, then submit right now
            #########################################################
            if self.RunModel==2:
                self.step="submit"
                return
            #########################################################
            #to get the start time
            #########################################################
            startTime=time.time()
            if self.startWaitTime==0:
                self.startWaitTime=time.time()
            #if not self.Flag_input_passcode:
            #########################################################
            #To check if in test points model if so will not wait submit right now
            #########################################################
            if self.action.find("TestPoints")>-1:
                self.step="submit"
                return
                
            #########################################################
            #To check if already inputed the pass code
            #########################################################
            if self.CheckPassCode:
                self.inputedPasscode=self.getInputPassCode()
                #print "passcode(%s)" %self.inputedPasscode
                if len(self.inputedPasscode)==4 or time.time()-self.startWaitTime>=3:
                    #self.step="waitForSubmit"
                    self.Flag_input_passcode=True
                else:
                    self.step="waitForSubmit"
                    return
            print "passcode(%s)" %self.inputedPasscode
            logstr+= "passcode(%s)\n" %self.inputedPasscode
            #if not self.Flag_passcode_in_range:
            #########################################################
            #read time and get latest price
            #########################################################
            #self.latestPrice=0
            #latestPrice_in_str=self.readPrice()
            #currentSecond=self.readTime()
            #print time.time()-startTime
            #########################################################
            #To check if current Sencond >55 if >55 then submit by force
            #########################################################
            if  int(currentSecond)>=self.pushByforce-1:
                waitTime=(self.pushByforce-int(currentSecond))*0.5
                #to check if waittime>0 because wait(-1) will wait long time
                if waitTime>0:
                    pass
                else:
                    waitTime=0
                print "current time: %s\nwait time: %s" %(currentSecond,waitTime)
                logstr+=  "current time: %s\nwait time: %s\n" %(currentSecond,waitTime)
                time.sleep(waitTime)
                print "Time out(%s)" %self.myPrice
                logstr+= "Time out(%s)\n" %self.myPrice  
                self.step="submit"
                return
            #########################################################
            #To check the price already in submit range 
            #########################################################
            print "%s - %s = %s" %(self.myPrice,latestPrice,self.myPrice-latestPrice)
            logstr+= "%s - %s = %s\n" %(self.myPrice,latestPrice,self.myPrice-latestPrice)  
            #if latestPrice_in_str:
            #    self.latestPrice=int(latestPrice_in_str)
                #print self.latestPrice
            #else:
            #    self.step="waitForSubmit"
            #    return
            #if self.latestPrice>=self.myPrice-500:
            if latestPrice>=self.myPrice-400:
                #time.sleep(0.2)
                print "In range(%s)" %self.myPrice
                logstr+= "In range(%s)\n" %self.myPrice  
                self.step="submit"
                return
            else:
                #print "%s - %s = %s" %(self.myPrice,latestPrice,self.myPrice-latestPrice)
                self.step="waitForSubmit"
                return
        try:
                pass
        except:
            self.step="waitForSubmit"
    def submit(self):
        if True:
            if self.action.find("Test")<0:
                point=self.points["submit"]
                mouse_click(point[0],point[1])
            else:
                point=self.points["submit"]
                mouse_move(point[0],point[1])
            self.step="exit"
        try:
            pass
        except:
            self.step="submit"
        pass
    def cancelSubmit(self):
        if True:
            point=self.points["cancelSubmit"]
            mouse_click(point[0],point[1])
        try:
            pass
        except:
            pass
        pass
    def readPasscode(self):
        try:
            #time.sleep(3)
            #point=self.points["readPasscode"]
            #im = ImageGrab.grab((point[0],point[1],point[0]+self.passcodeSize[0],point[1]+self.passcodeSize[1]))
            #im = ImageGrab.grab()
            #im.save('tmp.jpg')
            # read it code here
            #self.passcode="1234"
            self.step="inputPasscode"
            #self.step="exit"
        except:
            self.step="readPasscode"
    def readTime(self,i=0):
        global currentSecond
        return currentSecond
    def readPrice(self):
        global latestPrice
        return latestPrice
    def readMyPrice(self):
        if True:
            #add below condition because there was a bug to when test the points, need to make the Image show good before read
            if self.action.find("Test")>-1:
                time.sleep(1)
            point=self.points["readMyPrice"]
            im = ImageGrab.grab()
            im = ImageGrab.grab((point[0],point[1],point[0]+self.mypriceSize[0],point[1]+self.mypriceSize[1]))
            width=self.mypriceSize[0]*10
            height=self.mypriceSize[1]*10
            big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if self.action.find("Test")>-1 and (not self.Imgsaved):
                big_im.save("Image\\big_MyPrice.png")
            imgry = big_im.convert('L')
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
            #vcode = pytesseract.image_to_string(sharp_img,config='-psm 7 digits')
            vcode = pytesseract.image_to_string(sharp_img)
            if self.action.find("Test")>-1: 
                if len(vcode)==5:
                    print "My Price PASS (%s)" %vcode
                else:
                    print "My Price FAIL (%s)" %vcode
            #self.latestPrice=int(vcode)
            print (vcode)
            return vcode
        try:
            pass
        except:
            return "0"
    def getInputPassCode(self):
        #if True:
        try:
            point=self.points["getInputpasscode"]
            im = ImageGrab.grab()
            im = ImageGrab.grab((point[0],point[1],point[0]+self.getinputpasscodeSize[0],point[1]+self.getinputpasscodeSize[1]))
            width=self.mypriceSize[0]*5
            height=self.mypriceSize[1]*5
            big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if self.action.find("Test")>-1 and (not self.Imgsaved):
                big_im.save("Image\\big_InputPassCode.png")
            #else:
            #    big_im.save("Image\\big_InputPassCode.png")
            imgry = big_im.convert('L')
            imgry.save("Image\\l_InputPassCode.png")
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
            sharp_img.save("Image\\b_InputPassCode.png")
            vcode = pytesseract.image_to_string(sharp_img)
            #if self.action.find("Test")>-1: 
            #    if len(vcode)==4:
            #        print "Test get Inptut passCode PASS (%s)" %vcode
            #    else:
            #        print "Test get Inptut passCode FAIL (%s)" %vcode
            #return len(vcode.strip())
            return vcode.replace("|","").strip()
            pass
        except:
            return ""
    def TestPoints(self):
        hp.waitForStart()
        #hp.readPrice()
        hp.enterPrice()
        hp.addPrice()
        hp.offerPrice()
        #hp.getPasscode()
        hp.flashPasscode()
        hp.readPasscode()
        hp.inputPasscode()
        hp.waitForSubmit()
        startTime=time.time()
        po=win32gui.GetCursorPos()
        code=""
        while po[1]<600:
            code=hp.getInputPassCode()
            if len(code)==4:
                break
            if time.time()-startTime>6:
                break
            po=win32gui.GetCursorPos()
        if len(code)==4:
            print "Inptut passCode PASS (%s)" %code
        else:
            print "Inptut passCode FAIL (%s)" %code
        hp.submit()
    def Run1(self):
        global stopFlag
	start=time.time()
        print self.step
        print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx"
	while True:
           if stopFlag:
                break
	    #if the 29:55- current time =4 start
	   if self.step=="waitForStart":
	       self.waitForStart()
	   elif self.step=="enterPrice":
	       self.enterPrice()
	   elif self.step=="addPrice":
	       self.addPrice()
	   elif self.step=="offerPrice":
	       self.offerPrice()
	   elif self.step=="getPasscode":
	       self.getPasscode()
	   elif self.step=="flashPasscode":
	       self.flashPasscode()
	   elif self.step=="readPasscode":
	       self.readPasscode()
	   elif self.step=="inputPasscode":
	       self.inputPasscode()
	   if self.step=="waitForSubmit":
	       self.waitForSubmit()
	   elif self.step=="submit":
	       self.submit()
	   elif self.step=="exit":
	       break
	   else:
               pass
	       #time.sleep(0.1)
	   #if time.time()-start>64:
	   #    break
def Run2(hpobj):
        if hpobj.RunModel==1:
            hpobj.RunModel=1
            hpobj.step="waitForStart"
            hpobj.Run1()
            return
    
	if len(argv)==2:
	    hpobj.action=argv[1]
	if hpobj.action.find("TestPoints")>-1:
	    hpobj.TestPoints()
            return
        passcodes=[]
        for i in range(2):
            #hpobj.readPrice()
            hpobj.enterPrice()
            hpobj.addPrice()
            hpobj.offerPrice()
            hpobj.flashPasscode()
            hpobj.RunModel=0
	    hpobj.inputPasscode()
            passcodes.append(hpobj.passcode)
            #passcode= raw_input("Please pass code:")
            # to pump window to ask passcode
            # if in client and service model. send request to server to pass the passcode Image
            #time.sleep(3)
            hpobj.cancelSubmit()
        passcodeAreSame=False
        #to check if the passscodes are the same, 
        if len(passcodes)>0 and passcodes.count(passcodes[0])==len(passcodes):
            hpobj.passcode=passcodes[0]
            #to disable it because not passcode are not same at most of the time.
            #passcodeAreSame=True

        if passcodeAreSame: # if the tree passcode is same or not, if same then submit at 55, else go to Run1
            #hpobj.passcode="1234"
            hpobj.strategy=["55"]
            hpobj.RunModel=2
	    #hpobj.waitForStart()
            #hpobj.enterPrice()
            #hpobj.addPrice()
            #hpobj.offerPrice()
            #hpobj.flashPasscode()
	    #hpobj.inputPasscode()
	    #hpobj.submit()
            #start=time.time()
            hpobj.step="waitForStart"
            hpobj.Run1()
        else:
            hpobj.RunModel=1
            hpobj.step="waitForStart"
            hpobj.Run1()


        #hp.getPasscode()
    #1, 1,GetPassCode
    #2, 5,GetPassCode
    #3,   GetPassCode
    #4  if passcode1=passcode2=passcode3
    #5   55+5000
    #6  else: 
    #    old program.
        pass

def get_hwnds_for_pid (pid):
    def callback (hwnd, hwnds):
        if win32gui.IsWindowVisible (hwnd) and win32gui.IsWindowEnabled (hwnd):
            _, found_pid = win32process.GetWindowThreadProcessId (hwnd)
            if found_pid == pid:
                hwnds.append (hwnd)
            return True
    hwnds = []
    win32gui.EnumWindows (callback, hwnds)
    return hwnds

def readTime(hpobj,i=0):
    global stopFlag
    global latestPrice
    global price_on_1
    global price_on_2
    global second_on_1
    global second_on_2
    global currentSecond
    global logstr
    #for i in xrange(200):
    while True:
        if True:
            if stopFlag:
                break
	    point=hpobj.points["readTime"]
            timestamp=time.time()*1000
	    im = ImageGrab.grab()
	    im = ImageGrab.grab((point[0],point[1],point[0]+hpobj.timeSize[0],point[1]+hpobj.timeSize[1]))
	    width=hpobj.priceSize[0]*30
	    height=hpobj.priceSize[1]*30
            #im.show()
	    big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if hpobj.action.find("TestPoints")>-1 and (not hpobj.Imgsaved):
                big_im.save("Image\\big_Time.png")
	    imgry = big_im.convert('L')
	    sharpness=ImageEnhance.Contrast(imgry)
	    sharp_img=sharpness.enhance(2.0)
	    #sharp_img.save("Image\\time_b%s.png" %i)
            #vcode = pytesseract.image_to_string(sharp_img,config='-psm 7 digits')
	    vcode = pytesseract.image_to_string(sharp_img)
            if hpobj.action.find("TestPoints")>-1: 
                if len(vcode)==8:
                    print "System Time PASS (%s)" %vcode
                else:
                    print "System Time FAIL (%s)" %vcode
                break
	    hpobj.currentTime_in_str=vcode
            try:
                hpobj.currentSecond=int(vcode.split(":")[2])
                currentSecond=int(vcode.split(":")[2])
            except:
                currentSecond=0
            #print "timestamp: %s current second: %s latest price: %s" %(timestamp, currentSecond, latestPrice)
            print " %s : %s" %(currentSecond, latestPrice)
            logstr+= " %s : %s\n" %(currentSecond, latestPrice)  
            if currentSecond==second_on_1 and latestPrice>price_on_1:
                price_on_1= latestPrice
            if currentSecond>=second_on_1 and price_on_1==0:
                price_on_1= latestPrice
            if currentSecond==second_on_2  and latestPrice>price_on_2:
                price_on_2= latestPrice
            if currentSecond>=second_on_2  and price_on_2==0:
                price_on_2= latestPrice
            if currentSecond>=59:
                stopFlag=True
                break
            #print "11:29:%s - %s" %(hpobj.strategy[0],vcode)
            #hpobj.timeList.append([int(time.time()*10),vcode])
            #print (vcode)
	    #return vcode
        try:
            pass
        except:
            pass
            #return ""
    #print price_on_1
    #print price_on_2
    logstr+= "best price is:%s\n" %((1000-(price_on_2-price_on_1))>=800 and price_on_2+(1000-(price_on_2-price_on_1)) or price_on_2+800)  
    print "best price is:%s" %((1000-(price_on_2-price_on_1))>=800 and price_on_2+(1000-(price_on_2-price_on_1)) or price_on_2+800)
    #print hpobj.timeList

def readPrice(hpobj):
    global stopFlag
    global latestPrice
    global price_on_1
    global price_on_2
    #for i in xrange(100):
    while True:
        if True:
        #try:
            if stopFlag:
                break
            point=hpobj.points["readPrice"]
            im = ImageGrab.grab()
            im = ImageGrab.grab((point[0],point[1],point[0]+hpobj.priceSize[0],point[1]+hpobj.priceSize[1]))
            width=hpobj.priceSize[0]*30
            height=hpobj.priceSize[1]*30
            #im.show()
            #big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if hpobj.action.find("TestPoints")>-1 and (not hpobj.Imgsaved):
                big_im.save("Image\\big_Price.png")
            imgry = big_im.convert('L')
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
	    #sharp_img.save("Image\\price_b0s.png")
            #vcode = pytesseract.image_to_string(sharp_img,config='-psm 7 digits')
            vcode = pytesseract.image_to_string(sharp_img)
            vcode = vcode.replace(" ","").replace("T","7")
            if hpobj.action.find("TestPoints")>-1: 
                if len(vcode.strip())==5:
                    print "Current Price PASS (%s)" %vcode.strip()
                else:
                    print "Current Price FAIL (%s)" %vcode.strip()
                break
            currentPrice=0
	    try:
            	currentPrice=int(vcode.replace(" ","").replace("T","7")) 
	    except:
	    	pass
            latestPrice= latestPrice<currentPrice and currentPrice or latestPrice
            #latestPrice=int(vcode.replace(" ","").replace("T","7"))
            #hpobj.latestPrice=latestPrice
            #print latestPrice
            #vcode=vcode.replace(" ","")
            #hpobj.priceList.append([int(time.time()*10),latestPrice])
            #if hpobj.currentSecond>=59:
            #    break
            #print vcode.replace(" ","")
            #return vcode
        try:
            pass
        except:
            pass
            #return "0"
    #print hpobj.priceList

if __name__=="__main__":
    #inp=InputPassCode()
    #print inp.passcode 
    hp=HP()
    #print readTime(hp)
    #readTime(hp)
    #readPrice(hp)
    #hp.Run2()
    #Run2(hp)
    run=threading.Thread(target=Run2,args=(hp,))
    run.start()
    t_read_time=threading.Thread(target=readTime,args=(hp,))
    t_read_time.start()
    t_read_time=threading.Thread(target=readTime,args=(hp,))
    t_read_time.start()
    t_read_price=threading.Thread(target=readPrice,args=(hp,))
    t_read_price.start()
    t_read_price=threading.Thread(target=readPrice,args=(hp,))
    t_read_price.start()
    print "XXXXXXXXXXXXXXXXXXXXXXXXXXBBBBBBBBBBBBBBBBBBBBBBBBB"
    #t_read_time=threading.Thread(target=readTime,args=(hp,))
    #t_read_time.start()
    #t_read_price=threading.Thread(target=readPrice,args=(hp,))
    #t_read_price.start()
    #t_read_time=threading.Thread(target=readTime,args=(hp,))
    #t_read_time.start()
    #t_read_price=threading.Thread(target=readPrice,args=(hp,))
    #t_read_price.start()
    #time.sleep(1)
    #hp.stop=True
    #print "ENDDDDDDDDDDDDDDDDDDDD"
    #print readPrice(hp)



    #1, 1,GetPassCode
    #2, 5,GetPassCode
    #3,   GetPassCode
    #4  if passcode1=passcode2=passcode3
    #5   55+5000
    #6  else: 
    #    oldprogram.
