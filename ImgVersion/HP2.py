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


class HP:
    def __init__(self):
        #self.strategy=["50","50"]
        self.strategy=["49"]
        self.pushByforce=55
        self.CheckPassCode=True
        #self.CheckPassCode=False
        #self.strategy_time_price_dic_1={
        self.strategy_time_price={
                "36":1200,
                "37":1100,
                "38":1100,
                "39":1100,
                "40":1100,
                "41":1100,
                "42":1100,
                "43":1100,
                "44":1000,
                "45":1000,
                "46":900,
                "47":800,
                "48":900,
                "49":900,
                "50":900,
                "51":900,
                "52":600,
                "53":500,
                "54":500,
                "55":500,
                "56":300,
                "57":300,
                "58":300,
                "59":300,
                "60":300}
        self.points={"enterPrice":(889,398), # enter price input
                "addPrice":(981,398), # add price button
                "offerPrice":(985,501), # offer price button
                "flashPasscode":(500,502),# flash price button
                "readPasscode":(687,494), # not need for this time
                "readTime":(302,483), # right position of read system Time
                "readPrice":(330,500), # right position of read latest price
                "readMyPrice":(862,350),# right position of readMyPrice in righ
                "submit":(745,592), # submit button
                "getInputpasscode":(876,494),#the right postion of input passcode
                }
        self.dict = {}
        self.step="Init the HP class and Read config file"
        self.latestPrice=0
        self.currentTime_in_str=""
        lines=[]
        self.passcodeSize=(114,33)
        self.timeSize=(70,16)
        self.priceSize=(46,14)
        self.mypriceSize=(50,24)
        self.getinputpasscodeSize=(115,27)
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
        try:
            if self.action.find("TestPoints")>-1:
                self.step="enterPrice"
                return
            currentTime_in_str=self.readTime()
            if not currentTime_in_str:
                self.step="waitForStart"
                return
            else:
                currentSecond=self.readTime().split(":")[2]
            if int(currentSecond)>=int(self.strategy[0])-1:
                self.step="enterPrice"
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
        if True:
            addprice=0
            currentTime_in_str=self.readTime()
            #if currentTime_in_str:
            #    currentSecond=self.readTime().split
            #while not currentTime_in_str:
            #    currentTime_in_str=self.readTime()
            currentSecond=self.readTime().split(":")[2]
            point=self.points["enterPrice"]
            mouse_dclick(point[0],point[1])
            if int(currentSecond)<=int(self.strategy_time_price.keys()[0]):
                addprice=str(self.strategy_time_price.values()[0])
            else:
                addprice=str(self.strategy_time_price[currentSecond])
                
            #print type(addprice)
            key_input(addprice)
            self.step="addPrice"
         #   #self.step="addPrice"
        try:
            pass
        except:
            self.step="enterPrice"
    def addPrice(self):
        try:
            point=self.points["addPrice"]
            mouse_click(point[0],point[1])
            self.step="offerPrice"
        except:
            self.step="addPrice"
        pass
    def offerPrice(self):
        try:
            point=self.points["offerPrice"]
            mouse_click(point[0],point[1])
            self.myPrice=int(self.readMyPrice())
            self.step="flashPasscode"
        except:
            self.step="offerPrice"
        pass
    def flashPasscode(self):
        if True:
            #to get the image file and check the rectange image is black or blue. if so then click until the correct passcode 
            for i in range(4):
                time.sleep(0.3)
                point=self.points["flashPasscode"]
                mouse_click(point[0],point[1])
            print point
            point=self.points["getInputpasscode"]
            mouse_click(point[0]+80,point[1]+15)
            #point=self.points["submit"]
            #mouse_move(point[0],point[1])
            #self.step="exit"
            self.step="inputPasscode"
        try:
            pass
        except:
            self.step="flashPasscode"
    def inputPasscode(self):
        if True:
            #point=self.points["comdPosition"]
            #mouse_click(point[0],point[1])
            #passcode=raw_input()
            #key_input(self.passcode)
            #self.step="waitForSubmit"
            self.step="waitForSubmit"
        try:
            pass
        except:
            self.step="inputPasscode"
            
        pass
    def waitForSubmit(self):
        if True:
            # read the price if evluate price - readprice <500 then submit
            # or time > 55s then submit
            # if not input pass code will wait
            
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
                    print "????????????????????????????????"
                    self.step="waitForSubmit"
                    return
            print "passcode(%s)" %self.inputedPasscode
            #if not self.Flag_passcode_in_range:
            #########################################################
            #read time and get latest price
            #########################################################
            self.latestPrice=0
            latestPrice_in_str=self.readPrice()
            currentSecond=self.readTime().split(":")[2]
            print time.time()-startTime
            #########################################################
            #To check if current Sencond >55 if >55 then submit by force
            #########################################################
            if  int(currentSecond)>=self.pushByforce-2:
                waitTime=(self.pushByforce-int(currentSecond))*0.6
                print "current time: %s\nwait time: %s" %(currentSecond,waitTime)
                time.sleep(waitTime)
                print "Time out(%s)" %self.myPrice
                self.step="submit"
                return
            #########################################################
            #To check the price already in submit range 
            #########################################################
            print "%s - %s = %s" %(self.myPrice,self.latestPrice,self.myPrice-self.latestPrice)
            if latestPrice_in_str:
                self.latestPrice=int(latestPrice_in_str)
                print self.latestPrice
            else:
                self.step="waitForSubmit"
                return
            if self.latestPrice>=self.myPrice-500:
                print "In range(%s)" %self.myPrice
                time.sleep(0.5)
                self.step="submit"
                return
            else:
                print "%s - %s = %s" %(self.myPrice,self.latestPrice,self.myPrice-self.latestPrice)
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
        try:
	    point=self.points["readTime"]
	    im = ImageGrab.grab()
	    im = ImageGrab.grab((point[0],point[1],point[0]+self.timeSize[0],point[1]+self.timeSize[1]))
	    width=self.priceSize[0]*10
	    height=self.priceSize[1]*10
	    big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if self.action.find("Test")>-1 and (not self.Imgsaved):
                big_im.save("Image\\big_Time.png")
	    imgry = big_im.convert('L')
	    sharpness=ImageEnhance.Contrast(imgry)
	    sharp_img=sharpness.enhance(2.0)
	    sharp_img.save("Time/time_b%s.png" %i)
	    vcode = pytesseract.image_to_string(sharp_img)
            if self.action.find("Test")>-1: 
                if len(vcode)==8:
                    print "READ System Time PASS (%s)" %vcode
                else:
                    print "READ System Time FAIL (%s)" %vcode
	    self.currentTime_in_str=vcode
            #print "11:29:%s - %s" %(self.strategy[0],vcode)
            print (vcode)
	    return vcode
        except:
            return ""

    def readPrice(self):
        if True:
            point=self.points["readPrice"]
            im = ImageGrab.grab()
            im = ImageGrab.grab((point[0],point[1],point[0]+self.priceSize[0],point[1]+self.priceSize[1]))
            width=self.priceSize[0]*5
            height=self.priceSize[1]*5
            big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if self.action.find("Test")>-1 and (not self.Imgsaved):
                big_im.save("Image\\big_Price.png")
            imgry = big_im.convert('L')
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
            vcode = pytesseract.image_to_string(sharp_img)
            if self.action.find("Test")>-1: 
                if len(vcode)==5:
                    print "READ Current Price PASS (%s)" %vcode
                else:
                    print "READ Current Price FAIL (%s)" %vcode
            self.latestPrice=int(vcode.replace(" ",""))
            return vcode
        try:
            pass
        except:
            return ""
    def readMyPrice(self):
        if True:
            point=self.points["readMyPrice"]
            im = ImageGrab.grab()
            im = ImageGrab.grab((point[0],point[1],point[0]+self.mypriceSize[0],point[1]+self.mypriceSize[1]))
            width=self.mypriceSize[0]*5
            height=self.mypriceSize[1]*5
            big_im= im.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
            if self.action.find("Test")>-1 and (not self.Imgsaved):
                big_im.save("Image\\big_MyPrice.png")
            imgry = big_im.convert('L')
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
            vcode = pytesseract.image_to_string(sharp_img)
            if self.action.find("Test")>-1: 
                if len(vcode)==5:
                    print "READ My Price PASS (%s)" %vcode
                else:
                    print "READ My Price FAIL (%s)" %vcode
            self.latestPrice=int(vcode)
            print (vcode)
            return vcode
        try:
            pass
        except:
            return ""
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
            sharpness=ImageEnhance.Contrast(imgry)
            sharp_img=sharpness.enhance(2.0)
            #sharp_img.save("Image\\b_InputPassCode.png")
            vcode = pytesseract.image_to_string(sharp_img)
            #if self.action.find("Test")>-1: 
            #    if len(vcode)==4:
            #        print "Test get Inptut passCode PASS (%s)" %vcode
            #    else:
            #        print "Test get Inptut passCode FAIL (%s)" %vcode
            self.latestPrice=int(vcode)
            #return len(vcode.strip())
            return vcode.strip()
            pass
        except:
            return ""
    def TestPoints(self):
        hp.waitForStart()
        hp.readPrice()
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
            print "Test get Inptut passCode PASS (%s)" %code
        else:
            print "Test get Inptut passCode FAIL (%s)" %code
        hp.submit()

if __name__=="__main__":
    hp=HP()
    start=time.time()
    if len(argv)==2:
        hp.action=argv[1]
    if hp.action.find("TestPoints")>-1:
        hp.TestPoints()
    while True:
        #if the 29:55- current time =4 start
        if hp.step=="waitForStart":
            hp.waitForStart()
        elif hp.step=="enterPrice":
            hp.enterPrice()
        elif hp.step=="addPrice":
            hp.addPrice()
        elif hp.step=="offerPrice":
            hp.offerPrice()
        elif hp.step=="getPasscode":
            hp.getPasscode()
        elif hp.step=="flashPasscode":
            hp.flashPasscode()
        elif hp.step=="readPasscode":
            hp.readPasscode()
        elif hp.step=="inputPasscode":
            hp.inputPasscode()
        if hp.step=="waitForSubmit":
            hp.waitForSubmit()
        elif hp.step=="submit":
            hp.submit()
        elif hp.step=="exit":
            break
        else:
            time.sleep(0.1)
        if time.time()-start>64:
            break
    print time.time()-start
