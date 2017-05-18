1,two type, one line PIC with *, two line PIC.
One line:

A:split the PIC into two part
	1, Digital part.
	2, Position part.

step:
	1, Get train Data
	1, split the two line.
	2, train the svm to get the position
	3, splite the digital.
	4, train the svm to get the digital.

Point:
after 2 value.
 1 114*33 for all PIC .
 2 Position Part 114*8 (0,8) [7,24]
 3 Digital part  114*25 (9,33)
 5 6 first 14*19 0 14*19, 
   start from (7,6) +14+2 (23,6)+14+2 (39,6)+14+2(55,6)+14+2(71,6)+16(87,6)
 
Create a folder for every Year/Moth. copy the file into it. 
Folder structor.
IM
IM_B
IM_G
crops
Y_M.train
Y_M.model.


Web CS:
1 Server.
   Runner Action.
	Login
	Ph1OfferPri
	GetPassCode.
   User Action
	Login
	DisPassCodeImage
	ReturnPassCode

2,User:
   GetPassCodeImage
   ReturnPassCode
3,Runer:
   StartWebPro
   Login
   Ph1OfferPri
   SendPassCodeImage
   RecivePassCode
   
	
	



Two Line:
Split the PIC into two four part.
	1, line1 key part
	2, line1 Digital part
	3, line2 key part
	4, line2 Digital part.
Step:
	1,splite into four part.
	2, train the svm to recognize the key.
	3, train the svm to get the digital.

The main part of program will be.
1, Read PIC of all thhe train picture. cut into small crops.
    Use RGB2HLA and get RGB vector.use the kmeans and cut them into small crops.
2, Train the svm and with these pic.
3, Test the pic.
    use RGB2HLA and get RGB vector for every test pic. and use kmeans and cut them into small crops.
    use svm to test it.

Class:
1, RGB2HLA. input image output testData
2, preateimage cut the samll group pic into small srops 
3, KmeansClass. input testData.txt and cut to small pic with group
4, 

    