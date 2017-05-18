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


class HP:
    def __init__(self):
        self.strategy={
                "40":500,
                "41":500,
                "42":500}
        self.dict = {}
        self.step="Init the HP class and Read config file"
        #lines = file(configFile).readlines()
        lines=[]
        self.passcodeSize=(114,33)
        self.timeSize=(70,18)
        self.priceSize=(46,14)
        self.cookieid=0
        self.points={"enterPrice":(889,398),
                "addPrice":(981,398),
                "offerPrice":(985,501),
                "flashPasscode":(500,502),
                "readPasscode":(687,494),
                "readTime":(450,512),
                "readPrice":(330,500),
                "submit":(745,592),
                }
        for i in lines:
            if i.strip() != '' and i[0] != '#':
                tmp = i.split()
                self.dict[tmp[0]] = tmp[1]
        #for (k,v) in self.dict.items():
        #    print k,v
        self.step="enterPrice"
    def enterPrice(self):
        #read the current time and decide which price should be add is better
        startTime=time.time()
        #while time.time()-startTime<30:
        #for i in xrange(10):
        #    self.readTime()
        #self.step="exit"
        if self.readPrice():
            pass
        print time.time()-startTime
        #if self.readTime():
        #    pass
        if self.readPrice():
            pass
        point=self.points["enterPrice"]
        mouse_dclick(point[0],point[1])
        addprice=str(self.strategy["40"])
        print type(addprice)
        key_input(addprice)
        self.step="addPrice"
    def addPrice(self):
        point=self.points["addPrice"]
        mouse_click(point[0],point[1])
        self.step="offerPrice"
        pass
    def offerPrice(self):
        point=self.points["offerPrice"]
        mouse_click(point[0],point[1])
        self.step="readPasscode"
        pass
    def flashPasscode(self):
        #to get the image file and check the rectange image is black or blue. if so then click until the correct passcode 
        point=self.points["addPrice"]
        #im = ImageGrab.grab((point[0],point[1],point[0]+109,point[1]+22))
        im = ImageGrab.grab()
        im.save('tmp.jpg')
        #point=self.points["flashPasscode"]
        #mouse_click(point[0],point[1])
        self.step="break"
    def inputPasscode(self):
        key_input(self.passcode)
        self.step="submit"
        pass
    def submit(self):
        # read the price if evluate price - readprice <500 then submit
        # or time > 55s then submit
        point=self.points["submit"]
        mouse_click(point[0],point[1])
        self.step="exit"
        pass
    def readPasscode(self):
        time.sleep(3)
        point=self.points["readPasscode"]
        im = ImageGrab.grab((point[0],point[1],point[0]+self.passcodeSize[0],point[1]+self.passcodeSize[1]))
        #im = ImageGrab.grab()
        im.save('tmp.jpg')
        # read it code here
        self.passcode="1234"
        self.step="inputPasscode"
        pass
    def readTime(self):
        point=self.points["readTime"]
        im = ImageGrab.grab()
        im = ImageGrab.grab((point[0],point[1],point[0]+self.timeSize[0],point[1]+self.timeSize[1]))
        im.save('tmp1.jpg')
        self.ConvertTo2Bit(im)
        image = Image.open('tmp_b.jpg')
        #imgry = image.convert('L')
        #sharpness=ImageEnhance.Contrast(imgry)
        #sharp_img=sharpness.enhance(2.0)
        #sharp_img.save("tmp11.jpg")
        #image = Image.open('tmp11.jpg')
        vcode = pytesseract.image_to_string(image)
        print (vcode)
        return vcode
    def readPrice(self):
        point=self.points["readPrice"]
        im = ImageGrab.grab()
        im = ImageGrab.grab((point[0],point[1],point[0]+self.priceSize[0],point[1]+self.priceSize[1]))
        im.save('tmp_b.jpg')
        #self.ConvertTo2Bit(im)
        #image = Image.open('tmp_b.jpg')
        vcode = pytesseract.image_to_string(im)
        #image = Image.open('tmp2.jpg')
        #imgry = image.convert('L')
        #sharpness=ImageEnhance.Contrast(imgry)
        #sharp_img=sharpness.enhance(2.0)
        #sharp_img.save("tmp21.jpg")
        #image = Image.open('tmp21.jpg')
        #vcode = pytesseract.image_to_string(image)
        print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        print (vcode)
        return vcode
    def ConvertTo2Bit(self,image):          
        #print name
        threshold = 120    
        table = []    
        for i in range(256):
            if i < threshold:    
                table.append(0)    
            else:    
                table.append(1)    
	#im = Image.open(name)    
        im=image
	#im = im.filter(ImageFilter.MedianFilter())
	enhancer = ImageEnhance.Contrast(im)
	#im = im.filter(ImageFilter.MedianFilter())
	#im = enhancer.enhance(2)
        imgry = im.convert('L')  
        imgry.save('tmp_g.jpg')    
        #imgry.save(name.replace('.jpg','_g.jpg'))    
        #imgry = imgry.filter(ImageFilter.MedianFilter())
        out = imgry.point(table,'1')    
        #out.save(name.replace('.jpg','_b.jpg'))   
        out.save("tmp_b.jpg")   

        #encoding=utf-8
#author: walker
#date: 2014-05-15
#function: ????????
import os
import os.path
from PIL import Image
'''
'''
def ResizeImage(filein, fileout, width, height, type):
  img = Image.open(filein)
  out = img.resize((width, height),Image.ANTIALIAS) #resize image with high-quality
  out.save(fileout, type)

if __name__=="__main__":
    filein = r'tmp21.jpg'
    fileout = r'tmp31.PNG'
    width = 138
    height = 42
    type = 'PNG'
    ResizeImage(filein, fileout, width, height, type)
    hp=HP()
    #im = Image.open('8.png')
    #hp.ConvertTo2Bit(im)
    #hp.readPrice()
    im = Image.open('tmp31.PNG')
    vcode = pytesseract.image_to_string(im)
    print vcode
