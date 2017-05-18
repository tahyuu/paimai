# pretreat_image.py
# ??:????0/1?????0/255
from PIL import Image,ImageDraw,ImageChops
from PIL import ImageGrab
import os
import time
import numpy as np 
class TreatImage():
    def __init__(self):
        pass
    #def pretreat_image(self,image):
    def run(self,image):
        #image = image.convert("L")
        # ??threshold = 180
        #image = self.iamge2imbw(image,180)
        # N = 4
        image=self.clear_noise(image,5)
        image=self.clear_noise(image,5)
        image=self.clear_noise(image,5)
        #image.save("crops/nos00.jpg")  
        return image
        #if BlackCount>5:
         #   return image
        #else:
        #    return None
        #clear_noise(image,2)
        # ????:122*54
        # ????,? <= x < ?
        #box = (   8,   10,  118,  50 )
        #image = image.crop(box)
    def iamge2imbw(self,image,threshold):
        table = []
        for i in range(256):
            if i < threshold:
                table.append(0)
            else:
                table.append(1)
        #image = image.point(table,'1')
    	
        image = image.convert('L')
        return image
    def get_near_pixel(self,image,x,y,N):
        pix = image.getpixel((x,y))
        near_dots = 0
        if pix == image.getpixel((x - 1,y - 1)):
	    near_dots += 1
        if pix == image.getpixel((x - 1,y)):
            near_dots += 1
        if pix == image.getpixel((x - 1,y + 1)):
            near_dots += 1
        if pix == image.getpixel((x,y - 1)):
            near_dots += 1
        if pix == image.getpixel((x,y + 1)):
            near_dots += 1
        if pix == image.getpixel((x + 1,y - 1)):
            near_dots += 1
        if pix == image.getpixel((x + 1,y)):
            near_dots += 1
        if pix == image.getpixel((x + 1,y + 1)):
            near_dots += 1
        if x>2 and y>2 and pix == image.getpixel((x - 2,y - 2)):
            near_dots += 1
        if x>2 and y>1 and pix == image.getpixel((x - 2,y - 1)):
            near_dots += 1
        if x>2 and pix == image.getpixel((x - 2,y )):
            near_dots += 1
        if x>2 and  y+1<image.size[1] and pix == image.getpixel((x - 2,y+1 )):
            near_dots += 1
        if x>2 and  y+2<image.size[1] and pix == image.getpixel((x - 2,y+2 )):
            near_dots += 1
        if  x>1 and y >2 and pix == image.getpixel((x - 1,y - 2)):
            near_dots += 1
        if x >1 and  y+2<image.size[1] and pix == image.getpixel((x - 1,y + 2)):
            near_dots += 1
        if y>2 and pix == image.getpixel((x ,y - 2)):
            near_dots += 1
        if y+2<image.size[1] and pix == image.getpixel((x ,y + 2)):
            near_dots += 1
        if y>2 and  x+1<image.size[0] and pix == image.getpixel((x+1 ,y - 2)):
            near_dots += 1
        if  x+1<image.size[0] and  y+2<image.size[1] and pix == image.getpixel((x+1 ,y + 2)):
            near_dots += 1
        if y >2 and  x+2<image.size[0] and pix == image.getpixel((x+2 ,y - 2)):
            near_dots += 1
        if y>1 and x+2<image.size[0] and pix == image.getpixel((x+2 ,y - 1)):
            near_dots += 1
        if x+2<image.size[0] and pix == image.getpixel((x+2 ,y )):
            near_dots += 1
        if x+2<image.size[0] and y+1<image.size[1] and pix == image.getpixel((x+2 ,y+1 )):
            near_dots += 1
        if x+2<image.size[0] and y+2<image.size[1] and pix == image.getpixel((x+2 ,y+2 )):
            near_dots += 1
        if near_dots < N:
            return image.getpixel((x,y-1))
        else:
            return None
    def clear_noise(self,image,N):
        BlackCount=0
        draw = ImageDraw.Draw(image)
        im=None
        im = np.asarray(image).copy()
        #im=np.matrix(image,dtype="float")/255.0
        #im=np.matrix(image)
        Width,Height=image.size
        for x in range(Width):
            #im[x][0]=255
            #im[x][Height-2]=255
            im[0][x]=255
            im[Height-1][x]=255
            #draw.point((x,0),255)
            #draw.point((x,Height-1),255)
        for y in range(Height):
            #print len(im)
            im[y][0]=255
            im[y][Width-1]=255
            #draw.point((0,y),255)
            #draw.point((Width-1,y),255)
        for x in range(1,Width - 1):
            for y in range(1,Height - 1):
                color = self.get_near_pixel(image,x,y,N)
                if color != None:
                    BlackCount=BlackCount+1
                    #draw.point((x,y),color)
                    im[y][x]=color

        new_im = Image.fromarray(im)
        
        return new_im
        #return BlackCount
     	
if __name__ == '__main__':

    start=time.time()
    #pic=ImageGrab.grab((1032,699,1032+170,699+50))
    #pic=ImageGrab.grab((0,0,1032+170,699+50))
    #pic=ImageGrab.grab(1002,499,1002+104,499+30)
    #pic=ImageGrab.grab(1002,499,1002+104,499+30)
    #pic=ImageGrab.grab((690,475,670+120,475+34))
    #pic=ImageGrab.grab((690,475,670+120,475+50))
    #pic=ImageGrab.grab()
    #time.sleep(0.1)
    #pic.save("2.jpg")
    #print time.time()-start
    ti=TreatImage()
    image = Image.open('crops/cat8.jpg')
    #image = pretreat_image(image)
    img=ti.run(image)
    img=ti.run(img)
    img=ti.run(img)
    img.show()
    #image.save("cat00.jpg")  

