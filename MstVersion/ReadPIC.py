#import pytesseract
from PIL import Image

#import Image    
from PIL import ImageEnhance    
from PIL import ImageFilter    
import sys    
#from pytesseract import *  
threshold = 150    
table = []    
for i in range(256):    
    if i < threshold:    
        table.append(0)    
    else:    
        table.append(1)    

rep={'O':'0',    
    'I':'1','L':'1',    
    'Z':'2',    
    'S':'8'    
    };    

def  getverify1(name):          
    im = Image.open(name)    
    im = im.filter(ImageFilter.MedianFilter())
    enhancer = ImageEnhance.Contrast(im)
    #im = im.filter(ImageFilter.MedianFilter())
    im = enhancer.enhance(2)
    imgry = im.convert('1')
 
    #im.show() #????

    s = 2      #?? ??? x
    t = 2       #?? ??? y
 
    w = 15      #?? ? +y
    h = 25      #?? ? +x
 
    im_new = []
    for i in range(6): #?????
        im1 = im.crop((s+w*i+i*2,t,s+w*(i+1)+i*2,h))
        im_new.append(im1)
    #im_new[0].show()#????
    #im_new[1].show()#????
    #im_new[2].show()#????
    #im_new[3].show()#????
    #im_new[4].show()#????
    #im_new[5].show()#????

    #re=""
    #for i in im_new:
    #    re+=image_to_string(i)
    #print re

    imgry = im.convert('L')  
    imgry.save('g'+name)    
    imgry = imgry.filter(ImageFilter.MedianFilter())
    out = imgry.point(table,'1')    
    out.save('b'+name)    
#    text = image_to_string(out)    
#    text = text.strip()    
#    text = text.upper();      
#    for r in rep:    
#        text = text.replace(r,rep[r])     
    #out.save(text+'.jpg')    
#    print text    
#    return text    


if __name__=="__main__":
    getverify1("nm.jpg")
#    vcode = pytesseract.image_to_string("nm.jpg")
    #print pytesseract.image_file_to_string("1.jpg")
#    print vcode
    #getverify1('7498.png') 
