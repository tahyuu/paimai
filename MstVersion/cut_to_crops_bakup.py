# cut_all_char.py
# ??:????0/1?????0/255
from PIL import Image,ImageDraw,ImageChops
import os
#from pretreat_image import *
from TreatImage import *
import random
import numpy as np

class cut_to_crops():
        def __init__(self):
            #pass
            self.ti=TreatImage()
	        
	# ????,?????????
	# ???????
	def cut_one_char(self,image):
            if not image:
                return[None,None]

            #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX %s "%np.mean(image/255.0)
            #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX %s "%np.sum(np.matrix(image,dtype="float")/255)
            #if np.mean(np.matrix(image,dtype="float")*4)>1000:
            #if np.sum(np.matrix(image,dtype="float")/255)<3500:
            #    return[None,None]
            #    return[None,None]
	    # ????
	    # N = 4
            line=2
	    image=self.ti.clear_noise(image,5)
	
	    CharWidth=14
	    CharHeight=19
	    Width,Height=image.size
	    # ??image?????????
	    x = self.find_first_column(image)
	
	    # ???
	    # ????,? <= x < ?
	    box = (x,0,x+CharWidth,Height)
	    image2 = self.crop_white(image,box)
	    y = self.find_first_row(image2)
	
	    # ???????
	    box = (x,y,x+CharWidth,y+CharHeight)
	    image_char = self.crop_white(image,box)
	
	    # ?????
	    if x+CharWidth > Width:
	        image_residue = None
	    else:
	        box = (x+CharWidth,0,Width,Height)
	        image_residue = self.crop_white(image,box)

            if np.sum(np.matrix(image_char,dtype="float")/255)>CharWidth*CharHeight*0.9:
                image_char=None

            print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX %s "%np.sum(np.matrix(image_char,dtype="float")/255)
	    return [image_char,image_residue]
	
	def run(self,image,i):
            image = self.ti.run(image)
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
            else:
                return
            if image:
	        image_char6,image = self.cut_one_char(image)
                if image_char6:
                    image_char6.save("crops/t%s6.jpg" %i)
            else:
                return
            if image:
	        image_char7,image = self.cut_one_char(image)
                if image_char7:
                    image_char7.save("crops/t%s7.jpg" %i)
            else:
                return
            if image:
	        image_char8,image = self.cut_one_char(image)
                if image_char8:
                    image_char8.save("crops/t%s8.jpg" %i)
            else:
                return
            if image:
	        image_char9,image = self.cut_one_char(image)
                if image_char9:
                    image_char9.save("crops/t%s9.jpg" %i)
            else:
                return
            if image:
	        image_char10,image = self.cut_one_char(image)
                if image_char10:
                    image_char10.save("crops/t%s10.jpg" %i)
            else:
                return
            if image:
	        image_char11,image = self.cut_one_char(image)
                if image_char11:
                    image_char11.save("crops/t%s11.jpg" %i)
            else:
                return
	    #return [image_char1,image_char2,image_char3,image_char4,image_char5]
	    #return [image_char1,image_char2,image_char3,image_char4]
	    #return [image_char1,image_char2,image_char3]
	    #return [image_char1,image_char2]
	    #return [image_char1]
	
	# ??box??????,????????
	# ????????????????,??????,???????
	def crop_white(self,image,box):
	    # 255 - old
	    image = ImageChops.invert(image)
	    image = image.crop(box)
	    return ImageChops.invert(image)
	
	def find_left_point(self,image):
	    Width,Height=image.size
	    for x in range(Width):
	        for y in range(Height):
	            if image.getpixel( (x,y) ) == 0:
	                return x
	    # ??????,?????
	    return 0
	    pass
	
	# ??image?????????
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
if __name__ == '__main__':
    #image = Image.open('cat00.jpg')
    #image = pretreat_image(image)
    cac=cut_to_crops()
    image_char_list=cac.run()
    #image_char_list = cut_all_char(image)
    #image_char_list[0].save("t00.jpg")
    #image_char_list[1].save("t01.jpg")
    #image_char_list[2].save("t02.jpg")
    #image_char_list[3].save("t03.jpg")
    #image_char_list[4].save("t04.jpg")
