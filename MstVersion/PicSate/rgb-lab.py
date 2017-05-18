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
image = cv2.imread("E:\HP\\201612\\1148.png") 
cv2.imshow("Original",image) 
cv2.waitKey(0) #lab?? 
lab = cv2.cvtColor(image, cv2.COLOR_BGR2LAB) 
cv2.imshow("L*a*b*", lab)
cv2.waitKey(0)


