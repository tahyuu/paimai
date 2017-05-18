# pretreat_image.py
# ??:????0/1?????0/255
from PIL import Image,ImageDraw,ImageChops
from PIL import ImageGrab
import os
import time

# ??????,?????
# ????????0/255????
# ??,?? http://blog.csdn.net/xinghun_4/article/details/47864949
def pretreat_image(image):
    # ??????????
    image = image.convert("L")

    # ???,??0/255????
    # ??threshold = 180
    image = iamge2imbw(image,180)

    # ?????????
    # N = 4
    clear_noise(image,5)
    #clear_noise(image,2)

    # ?????
    # ????:122*54
    # ????,? <= x < ?
    #box = (   8,   10,  118,  50 )
    #image = image.crop(box)
    return image

# ???????,??0/255????
def iamge2imbw(image,threshold):
    # ???????
    table = []
    for i in range(256):
        if i < threshold:
            table.append(0)
        else:
            table.append(1)

    # ?????0,1
    image = image.point(table,'1')

    # ?????0,255
    image = image.convert('L')
    return image

# ?????A????(0/255?),????8??????
# ???N: N=1,2,3,4,5,6,7
# ?A?????8????????N?,?????
# ???????,???????????????
def get_near_pixel(image,x,y,N):
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
        # ?????,??????????
        return image.getpixel((x,y-1))
    else:
        return None

# ????
def clear_noise(image,N):
    draw = ImageDraw.Draw(image)

    # ???????
    Width,Height=image.size
    for x in range(Width):
        draw.point((x,0),255)
        draw.point((x,Height-1),255)
    for y in range(Height):
        draw.point((0,y),255)
        draw.point((Width-1,y),255)

    # ????
    for x in range(1,Width - 1):
        for y in range(1,Height - 1):
            color = get_near_pixel(image,x,y,N)
            if color != None:
                draw.point((x,y),color)

if __name__ == '__main__':

    start=time.time()
    #pic=ImageGrab.grab((1032,699,1032+170,699+50))
    #pic=ImageGrab.grab((0,0,1032+170,699+50))
    #pic=ImageGrab.grab(1002,499,1002+104,499+30)
    #pic=ImageGrab.grab(1002,499,1002+104,499+30)
    pic=ImageGrab.grab((690,475,670+120,475+34))
    #pic=ImageGrab.grab((690,475,670+120,475+50))
    #pic=ImageGrab.grab()
    #time.sleep(0.1)
    pic.save("2.jpg")
    print time.time()-start
    #image = Image.open('cat3.jpg')
    #image = pretreat_image(image)
    #image.show()
    #image.save("cat00.jpg")  

