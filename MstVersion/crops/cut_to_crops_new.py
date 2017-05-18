# cut_all_char.py
# ??:????0/1?????0/255
from PIL import Image,ImageDraw,ImageChops
import os
#from pretreat_image import *
from TreatImage import *
import random
import numpy as np

class cut_to_crops():
        def __init__(self,image_name):
            im= Image.open(image_name)
            w,h=im.size
            #im=im.convert("L")
            #data=im.getdata()
            #self.data=np.matrix(data,dtype="float")/255.0
            self.new_data=np.matrix(im,dtype="float")
            #self.new_data=np.reshape(data,(w,h))
            #print new_data.shape
            #print new_data.ndim
            #print new_data.itemsize
            #new_im=Image.fromarray(new_data)
        def test(self):
            #print self.img_arry[0][0][0][0]
            #print len(self.img_arry[2][0])
            #print type(self.img_arry[1][0])
            x=0
            y=0
            print self.new_data[0]
            print self.new_data[0,1]
            self.img_arry=[]
            for l in self.new_data:
                pass
                #print l
                #print l[0]
                #for i in l[0]:
                #    if x==49:
                #        print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx"
                #    y=y+1
            #print x, y
            #        print len(i)
	def cut_one_char(self,image):
            if not image:
                return[None,None]

	    image=self.ti.clear_noise(image,5)
            if not image:
                return[None,None]
	
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
            #print "XXXXXXXXXXXXXXXXXXXXXX",image
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
            zeos=np.zeros((box[3]-box[1],box[2]-box[0]))
            #zeos=np.zeros((10,10))
	    image = ImageChops.invert(image)
            #image.show()
            #time.sleep(5)
            zeos_img=Image.fromarray(zeos)
            #image.show()
	    im= image.crop(box)
            #print zeos_img.size
            #print box
            #image.paste(zeos_img,(0,0,10,10))
            image.paste(zeos_img,box)
            #image.show()
            #print image
            #time.sleep(5)
	    image= ImageChops.invert(im)
            #time.sleep(5)
            return image
	
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
    cac=cut_to_crops("cat1.jpg")
    image_char_list=cac.test()
    #image_char_list = cut_all_char(image)
    #image_char_list[0].save("t00.jpg")
    #image_char_list[1].save("t01.jpg")
    #image_char_list[2].save("t02.jpg")
    #image_char_list[3].save("t03.jpg")
    #image_char_list[4].save("t04.jpg")
