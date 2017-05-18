#import pytesseract
import os
import os.path
from PIL import Image
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
    imgry.save(name.replace('1L','1L_G'))    
    imgry = imgry.filter(ImageFilter.MedianFilter())
    out = imgry.point(table,'1')    
    out.save(name.replace('1L','1L_B'))   
#    text = image_to_string(out)    
#    text = text.strip()    
#    text = text.upper();      
#    for r in rep:    
#        text = text.replace(r,rep[r])     
    #out.save(text+'.jpg')    
#    print text    
#    return text    
def get_crop_imgs(f):
    """
    :param img:
    :return:
    """
    img = Image.open(f)    
    child_img_list = []
    for i in range(6):
        x = 7 + i * (14 + 2)
        y = 6
        child_img = img.crop((x, y, x + 14, y + 19))
        #child_img_list.append(child_img)
        child_img.save(f.replace("1L_B","crops").replace(".png","_%s.png" %i))
def get_position_imgs(f):
    """
    :param img:
    :return:
    """
    #start from (7,24)
    #84=14*6+2*5
    img = Image.open(f)    
    child_img = img.crop((7, 25, 7+94, 25+7))
    print f.replace("1L_B","crops_p").replace(".png","_p.png")
    child_img.save(f.replace("1L_B","crops_p"))
def To2Bit():
    rootdir = "E:\\HP\\1L"
    list = os.listdir(rootdir)
    for i in range(0,len(list)):
            path = os.path.join(rootdir,list[i])
            if os.path.isfile(path):
                getverify1(path)
def CUT_TO_Corps():
    rootdir = "E:\\HP\\1L_B"
    list = os.listdir(rootdir)
    for i in range(0,len(list)):
            path = os.path.join(rootdir,list[i])
            if os.path.isfile(path):
                get_crop_imgs(path)
def Get_Position():
    rootdir = "E:\\HP\\1L_B"
    list = os.listdir(rootdir)
    for i in range(0,len(list)):
            path = os.path.join(rootdir,list[i])
            if os.path.isfile(path):
                get_position_imgs(path)

def get_feature(f,mark):
    """
    :param img_path:
    :return:
    """
    img = Image.open(f)    
    width, height = img.size

    pixel_cnt_list = []
    #height = 10
    for y in range(height):
        pix_cnt_x = 0
        for x in range(width):
            if img.getpixel((x, y)) == 0:  # ???
                pix_cnt_x += 1

        pixel_cnt_list.append(pix_cnt_x)

    for x in range(width):
        pix_cnt_y = 0
        for y in range(height):
            if img.getpixel((x, y)) == 0:  # ???
                pix_cnt_y += 1

        pixel_cnt_list.append(pix_cnt_y)

    reStr="%s" %mark
    for i in range(len(pixel_cnt_list)):
        reStr += " %s:%s" %(i+1,pixel_cnt_list[i])
        

    print reStr
    return reStr+"\n"
def CreateTrainFile():
    rootdir = "E:\\HP\\crops\\"
    list_dir = os.listdir(rootdir)
    li=[]
    for l in list_dir:
        path_dir = os.path.join(rootdir,l)
        if os.path.isdir(path_dir):
                list_file = os.listdir(path_dir)
                for i in range(0,len(list_file)):
                    path = os.path.join(path_dir,list_file[i])    
                    if os.path.isfile(path):
                        li.append(get_feature(path,l))
    f=file("E:\\HP\\crops\\train_pix_feature_di.txt","w+")
    f.writelines(li)
    f.close()
def train_svm_model():
    os.chdir("C:\Python27\Lib\site-packages\libsvm-3.22\python")
    #from libsvm.python.svmutil import *
    from svmutil import *
    model_path='E:\\HP\\crops\\train.di'
    y, x = svm_read_problem('E:\\HP\\crops\\train_pix_feature_di.txt')
    model = svm_train(y, x)
    svm_save_model(model_path, model)
def svm_model_test():
    """
    :return:
    """
    os.chdir("C:\Python27\Lib\site-packages\libsvm-3.22\python")
    from svmutil import *
    model_path='E:\\HP\\crops\\train.di'
    li=get_feature("E:\HP\TestPIC\\t00.jpg",3)
    f=file("test.txt","w+")
    f.writelines(li)
    f.close()
    yt, xt = svm_read_problem('test.txt')
    model = svm_load_model(model_path)
    p_label, p_acc, p_val = svm_predict(yt, xt, model)#p_label???????
    print p_label
    

if __name__=="__main__":
    #CreateTrainFile()
    train_svm_model()
    svm_model_test()



