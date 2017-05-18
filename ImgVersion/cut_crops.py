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


class cut_crops:
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
    def find_first_column(self,image):
	    Width,Height=image.size
	    for x in range(Width):
	        for y in range(Height):
	            if image.getpixel( (x,y) ) == 0:
	                return x
	    # ??????,?????
	    return 0
	
	# ??image?????????
    def find_first_row(self,image):
	    Width,Height=image.size
	    for y in range(Height):
	        for x in range(Width):
	            if image.getpixel( (x,y) ) == 0:
	                return y
	    # ??????,?????
	    return 0
    def cut_one_char(self,image):
	    CharWidth=14
	    CharHeight=19
	    Width,Height=image.size
	    x = self.find_first_column(image)
	
	    box = (x,0,x+CharWidth,Height)
	    image2 = self.crop_white(image,box)
	    y = self.find_first_row(image2)
	
	    box = (x,y,x+CharWidth,y+CharHeight)
	    image_char = self.crop_white(image,box)
	
	    if x+CharWidth > Width:
	        image_residue = None
	    else:
	        box = (x+CharWidth,0,Width,Height)
	        image_residue = self.crop_white(image,box)

            if np.sum(np.matrix(image_char,dtype="float")/255)>CharWidth*CharHeight*0.9:
                image_char=None

            print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX %s "%np.sum(np.matrix(image_char,dtype="float")/255)
	    return [image_char,image_residue]
    def run(self,image):
            i=0
            #image = self.ti.run(image)
            #image=self.image
            k=0
            #while image:
            #    image_char1,image = self.cut_one_char(image)
            #    if image_char1:
            #        image_char1.save("crops/t%s%s.jpg" %(i,k))
            #    k=k+1
            if image:
                image_char1,image = self.cut_one_char(image)
                if image_char1:
                    image_char1.save("crops/t%s1.jpg" %i)
            else:
                return
            if image:
	        image_char2,image = self.cut_one_char(image)
                if image_char2:
                    image_char2.save("crops/t%s2.jpg" %i)
            else:
                return
            if image:
	        image_char3,image = self.cut_one_char(image)
                if image_char3:
                    image_char3.save("crops/t%s3.jpg" %i)
            else:
                return
            if image:
	        image_char4,image = self.cut_one_char(image)
                if image_char4:
                    image_char4.save("crops/t%s4.jpg" %i)
            else:
                return
            if image:
	        image_char5,image = self.cut_one_char(image)
                if image_char5:
                    image_char5.save("crops/t%s5.jpg" %i)
            #print "XXXXXXXXXXXXXXXXXXXXXX",image
            else:
                return
            if image:
	        image_char6,image = self.cut_one_char(image)
                if image_char6:
                    image_char6.save("crops/t%s6.jpg" %i)
            else:
                return
if __name__=="__main__":
    im = Image.open('tmp21.jpg')
    cc=cut_crops()
    cc.run(im)
