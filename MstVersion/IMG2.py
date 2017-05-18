#import pytesseract
import os
import os.path
from PIL import Image
from PIL import ImageEnhance    
from PIL import ImageFilter    
import sys    
from KMeansCluster import *
from Cluster2Crops import *
from RGB2LAB import *
from cut_to_crops import *
from TreatImage import *

if __name__=="__main__":
    startTime=time.time()
    #rgb2lab=RGB2LAB("green0272-red6375.png")
    #rgb2lab=RGB2LAB("green1320-red1124.png")
    rgb2lab=RGB2LAB("6.png")
    st=rgb2lab.run()
    labVectors=st.split("\n")
    #print labVectors
    kmc=KMeansCluster()
    crops_list=kmc.run(labVectors)
    c2c=cut_to_crops()
    #print crops_list
    i=0
    for crop in crops_list:
    #for k in xrange(8):
    #    #print "......"
        #crop=crops_list[8-k]
        c2c.run(crop,i)
        i=i+1
    #imgpro=IMGPRO("E:\HP\\201601")
    #imgpro.run()
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
    print time.time()-startTime
