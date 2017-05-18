#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
=========================================================
K-means Clustering
=========================================================

The plots display firstly what a K-means algorithm would yield
using three clusters. It is then shown what the effect of a bad
initialization is on the classification process:
By setting n_init to only 1 (default is 10), the amount of
times that the algorithm will be run with different centroid
seeds is reduced.
The next plot displays what using eight clusters would deliver
and finally the ground truth.

"""
print(__doc__)


# Code source: GaÃ«l Varoquaux
# Modified for documentation by Jaques Grobler
# License: BSD 3 clause

import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import time
import cv2


from sklearn.cluster import KMeans
from sklearn import datasets
from RGB2LAB import *

startTime=time.time()
np.random.seed(5)

class KMeansCut():
    def __init__(self):
        pass
	
    def run(self):
	#print time.time()-startTime
	centers = [[1, 1], [-1, -1], [1, -1]]
	iris = datasets.load_iris()
	#rgb2lab=RGB2LAB()
	#X=rgb2lab.run()
	dataSet=[]
	fileIn=open('testData.txt')
	for line in fileIn.readlines():
	    lineArr=line.strip().split('\t')
	    dataSet.append([float(lineArr[0]),float(lineArr[1]),float(lineArr[2])])
	## step 2: clustering...  
	#print "step 2: clustering..."  
	X=np.mat(dataSet)
	#X = iris.data
	y = iris.target
	#print X
	#print y
	
	estimators = {'k_means_iris_3': KMeans(n_clusters=3),
	              'k_means_iris_8': KMeans(n_clusters=8),
	              'k_means_iris_bad_init': KMeans(n_clusters=3, n_init=1,
	                                              init='random')}
	
	
	fignum = 1
	K=10
	With=113
	High=50
	est=KMeans(n_clusters=K)
	est.fit(X)
	labels = est.labels_
	    #print time.time()-startTime
	#print labels
	i=0
	st=""
	for lab in labels:
	    if (i+1)%With==0:
	        st=st+str(lab)+"\n"
	    else:
	        st=st+str(lab)
	    i=i+1
	img_arrs=[]
	img_rows=[]
	# to store the sum count of all every lab
	sums=[]
	# to store the sum count of all every lab
	rowCounts=[]
	colCounts=[]
        Points=[]
	for x in range(K):
	    img_arrs.append([])
	    img_rows.append([])
	    sums.append(0)
	    rowCounts.append([])
	    colCounts.append([])
            #start[x,y], end[x,y]
            Points.append([With,High,0,0])
	    for i in range(With):
	        rowCounts[x].append(0)
	    for i in range(High):
	        colCounts[x].append(0)
	#print len(labels)
	i=0
	for lab in labels:
	    if (i+1)%With==0:
	        for x in range(K):
	            if lab==x:
                        if i%With<Points[x][0]:
                            Points[x][0]=i%With
                        if i/With<Points[x][1]:
                            Points[x][1]=i/With
                        if i%With>Points[x][2]:
                            Points[x][2]=i%With
                        if i/With>Points[x][3]:
                            Points[x][3]=i%With
	                #add the sum value
	                sums[x]=sums[x]+1
	                #add img_rows to make picture value
	                img_rows[x].append(0)
	                #add img_rows to make picture value
	                #print x, (i+1)%With,(i+1)/High
	                #print x,i ,i/With
	                rowCounts[x][i%With]= rowCounts[x][i%With]+1
	
	                colCounts[x][i/With]= rowCounts[x][i/With]+1
	            else:
	                img_rows[x].append(255)
	                #rowCounts[x].append(0)
	            img_arrs[x].append(img_rows[x])
	            img_rows[x]=[]
	    else:
	        for x in range(K):
	            if lab==x:
                        if i%With<Points[x][0]:
                            Points[x][0]=i%With
                        if i/With<Points[x][1]:
                            Points[x][1]=i/With
                        if i%With>Points[x][2]:
                            Points[x][2]=i%With
                        if i/With>Points[x][3]:
                            Points[x][3]=i%With
	                sums[x]=sums[x]+1
	                img_rows[x].append(0)
	                #print x,i ,(i+1)%With,(i+1)/High
	                rowCounts[x][i%With]= rowCounts[x][i%With]+1
	                #print x,i ,i/With
	                colCounts[x][i/With]= colCounts[x][i/With]+1
	            else:
	                img_rows[x].append(255)
	    i=i+1
	
        h=0
        img_new_arrs=[]
        print Points
	for img_arr in img_arrs:
            img_new_arr=[]
            j=0
            for row in img_arr:
                if j<Points[h][0] or j> Points[h][2]:
                    continue
                else:
                    #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx"
                    img_new_arr.append(row[Points[h][1]:Points[h][3]])
                j=j+1
            h=h+1
            img_new_arrs.append(img_new_arr)
	        
	width = 14
	height = 19
	no_of_bits = 8
	channels = 3
        #print img_new_arrs
	#image = cv2.CreateImage((width,height), no_of_bits, channels)
	#img = np.zeros((512,512),np.uint8)
	#print np.mat(img)
	#cv2.line(img,(0,0),(511,511),(155,155,155),5)
	#cv2.imshow(img,'gray')
	for x in range(K):
	    #eval("      img%s=None" %x)
	    if sums[x]<30 or sums[x]>600:
	        continue
	#    start=0
	#    end=0
	#    i=0
	#    for rowc in rowCounts[x]:
	#        if rowc>4 and start==0:
	#            start=i
	#        else:
	#            continue
	#        i=i+1
	#    for f in range(len(rowCounts[x])):
	#        lenrows=len(rowCounts[x])
	#        if rowCounts[x][lenrows-f-1]>3 and end==0:
	#            end=lenrows-f-1
	#        else:
	#            continue
	#        i=i+1
	#    k=0
	    #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
	    #print start, end
	    #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
	    #reslut=[]
            #k=0
	    #for img_row in img_new_arrs[x]:
	    #    #print k
	    #    if k<start:
	    #        k=k+1
	    #        continue
	    #    elif k>end:
	    #        k=k+1
	    #        continue
	    #    else:
	    #        reslut.append(img_row)
	    #        k=k+1
	            
	        
	    #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
	    #print img_arrs[x]
	    #print "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
            #print img_new_arrs[x]
	    img=np.mat(img_arrs[x])
	    #print reslut
	    #img=np.mat(reslut)
	    #print img
	    cv2.imwrite("cat%s.jpg" %x, img)
	    #img = Image.open("cat%s.jpg" %x)
	    #img = img.filter(ImageFilter.MedianFilter())
	    #img.save("cat%s.jpg" %x)   
	    #cv2.imwrite("cat%s.jpg" %x, img)
	    #print rowCounts[x]
	    #print colCounts[x]
	
	#def ToCrops(X):
	#    for li in X:
	#print sums
	
	#cv2.ShowImage(win_name, "test.png")
	f=file("pic.txt","w+")
	f.writelines(st)
	f.close()
	print time.time()-startTime
	#for name, est in estimators.items():
	#    est.fit(X)
	#    labels = est.labels_
	    #print time.time()-startTime
	#    print labels
	#print time.time()-startTime
	
if __name__=="__main__":
    pass
    kmc=KMeansCut()
    kmc.run()
