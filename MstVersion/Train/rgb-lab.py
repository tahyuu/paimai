#import pytesseract
from PIL import Image

#import Image    
from PIL import ImageEnhance    
from PIL import ImageFilter    
import sys    
#from pytesseract import *  
#encoding:utf-8
import numpy as np 
import cv2 

class RGB2LAB():
    def __init__(self):
        pass
    def run(self):
	im= Image.open("1148.png")    
	#im.show()
	#cv2.waitKey(0) #lab?? 
	im = im.filter(ImageFilter.MedianFilter())
	#cv2.waitKey(0) #lab?? 
	enhancer = ImageEnhance.Contrast(im)
	#im.show()
	#cv2.waitKey(0) #lab?? 
	im.save("1148.png".replace('.png','_1.png'))   
	#im.show()
	image = cv2.imread("1148_1.png")
	#cv2.imshow("Original",image) 
	#cv2.waitKey(0) #lab?? 
	labs = cv2.cvtColor(image, cv2.COLOR_BGR2LAB) 
	print len(labs)
	print len(labs[0])
	print type(labs)
	data=[]
	#for row in labs:
	#    for col in row:
	#        data.append(col)
	        
	print len(data)
	return data
	#print len(lab[0])
	#print lab[16]
	#abc=cv2.imshow("L*a*b*", lab)
	#cv2.waitKey(0)
	
if __name__=="__main__":
    rgb2lab=RGB2LAB()
    rgb2lab.run()

