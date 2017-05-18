#import pytesseract
import os
import os.path
from PIL import Image
from PIL import ImageEnhance    
from PIL import ImageFilter    
import sys    
#from pytesseract import *  
class IMGPRO():
    '''the 2bit the image cut into crops'''
    def __init__(self,rootdir):
        '''init the IMGPRO class'''
        self.rootdir=rootdir
    def To2Bit(self):
        path_imgs = os.path.join(self.rootdir,"IMG")
        if os.path.isdir(path_imgs):
            list_imgs = os.listdir(path_imgs)
            for l in list_imgs:
                path_img = os.path.join(path_imgs,l)
                if os.path.isfile(path_img):
                    self.ConvertTo2Bit(path_img)
    def ConvertTo2Bit(self,name):          
        #print name
        threshold = 200    
        table = []    
        for i in range(256):    
            if i < threshold:    
                table.append(0)    
            else:    
                table.append(1)    
	im = Image.open(name)    
        #im.show()
	im = im.filter(ImageFilter.MedianFilter())
	enhancer = ImageEnhance.Contrast(im)
	#im = im.filter(ImageFilter.MedianFilter())
	im = enhancer.enhance(2)
	imgry = im.convert('1')
        imgry = im.convert('L')  
        imgry.save(name.replace('IMG','IMG_G'))    
        imgry = imgry.filter(ImageFilter.MedianFilter())
        out = imgry.point(table,'1')    
        out.save(name.replace('IMG','IMG_B'))   
        #self.get_crop_imgs(name.replace('1L','1L_B'))
    def get_crop_imgs(self,f):
	"""
	:param img:
	:save crops file:
	"""
        startPix=(7,6)
        crops_size=(14,20)
        crops_margin=(2,20)
        print f
	img = Image.open(f)    
	child_img_list = []
	for i in range(6):
	    x = startPix[0] + i * (crops_size[0] + crops_margin[0])
	    y = startPix[1]
	    child_img = img.crop((x, y, x + crops_size[0], y + crops_size[1]))
	    #child_img_list.append(child_img)
	    child_img.save(f.replace("IMG_B","crops").replace(".png","_%s.png" %i).replace(".jpg","_%s.jpg" %i))
    def get_crop_imgs_2(self,f):
	"""
	:param img:
	:save crops file:
	"""
        print f
        startPix=(3,5)
        title_size=(17,20)
        title_margin=(1,20)
        crops_size=(13,20)
        crops_margin=(3,20)
	img = Image.open(f)    
	child_img_list = []
        ##################################################
        #Cut line 1
        ##################################################
        #step to cut the tile
        #step to cut the crops
	child_img = img.crop((startPix[0], startPix[1], startPix[0] + title_size[0], startPix[1] + title_size[1]))
	child_img.save(f.replace("IMG_B","crops_title").replace(".png","_1.png"))
	for i in range(5):
	    x = startPix[0]+title_size[0] +title_margin[0]+ i * (crops_size[0] + crops_margin[0])
	    y = startPix[1]
	    child_img = img.crop((x, y, x + crops_size[0], y + crops_size[1]))
	    #child_img_list.append(child_img)
	    child_img.save(f.replace("IMG_B","crops").replace(".png","_1%s.png" %i))
        ##################################################
        #Cut line 2
        ##################################################
        #step1 to cut the tile
        #step2 to cut the crops
        startPix=(3,25) # reinit the start Pix
	child_img = img.crop((startPix[0], startPix[1], startPix[0] + title_size[0], startPix[1] + title_size[1]))
	child_img.save(f.replace("IMG_B","crops_title").replace(".png","_2.png"))
	for i in range(5):
	    x = startPix[0]+title_size[0] +title_margin[0]+ i * (crops_size[0] + crops_margin[0])
	    y = startPix[1]
	    child_img = img.crop((x, y, x + crops_size[0], y + crops_size[1]))
	    #child_img_list.append(child_img)
	    child_img.save(f.replace("IMG_B","crops").replace(".png","_2%s.png" %i))
    def get_position_imgs(self,f):
	"""
	:param img:
	:save position file
	"""
	#start from (7,24)
	#84=14*6+2*5
	img = Image.open(f)    
	child_img = img.crop((7, 25, 7+94, 25+7))
	#print f.replace("1L_B","crops_p").replace(".png","_p.png")
	child_img.save(f.replace("IMG_B","crops_p"))
    def CUT_TO_Corps(self):
	#rootdir = "E:\\HP\\1L_B"
        rootdir= os.path.join(self.rootdir,"IMG_B")
	list = os.listdir(rootdir)
	for i in range(0,len(list)):
	        path = os.path.join(rootdir,list[i])
	        if os.path.isfile(path):
	            self.get_crop_imgs(path)
	            #self.get_crop_imgs_2(path)
    def Get_Position(self):
	#rootdir = "E:\\HP\\1L_B"
        rootdir= os.path.join(self.rootdir,"IMG_B")
	list = os.listdir(rootdir)
	for i in range(0,len(list)):
	        path = os.path.join(rootdir,list[i])
	        if os.path.isfile(path):
	            get_position_imgs(path)
	
    def get_feature(self,f):
	"""
	:param img_path:
	:get feature:
	"""
	
	pixel_cnt_list = []
	img = Image.open(f)    
	width, height = img.size
	digCount=6
	
	
	for i in range(digCount):
	    pix_cnt_dig = 0
	    for x in range(14):
	        for y in range(height):
	            if img.getpixel((i*(14+2)+x, y)) == 0:  # ???
	                pix_cnt_dig += 1
	
	    pixel_cnt_list.append(pix_cnt_dig)
	print pixel_cnt_list
	reStr="001111:"
	for i in range(len(pixel_cnt_list)):
	    reStr += " %s:%s" %(i,pixel_cnt_list[i])
	    
	
	return reStr+"\n"
    def CreateTrainFile(self):
	rootdir = "E:\\HP\\crops_p\\001111"
	list = os.listdir(rootdir)
	li=[]
	for i in range(0,len(list)):
	        path = os.path.join(rootdir,list[i])
	        if os.path.isfile(path):
	            li.append(self.get_feature(path))
	f=file("E:\\HP\\crops_p\\train_pix_feature_001111.txt","w+")
	f.writelines(li)
	f.close()
    def run(self):
        self.To2Bit()
        self.CUT_TO_Corps()
        pass

rep={'O':'0',    
    'I':'1','L':'1',    
    'Z':'2',    
    'S':'8'    
    };    


    

if __name__=="__main__":
    imgpro=IMGPRO("E:\HP\\201601")
    imgpro.run()
    #getverify1("E:\\HP\\TestPIC\\8933.png") 
    #CUT_TO_Corps()
    #get_crop_imgs("E:\\HP\\TestPIC\\8933.png")
#    Get_Position()
    #get_feature("0056.png")
    #CreateTrainFile()
#    vcode = pytesseract.image_to_string("nm.jpg")
    #print pytesseract.image_file_to_string("1.jpg")
#    print vcode
    #getverify1('7498.png') 
