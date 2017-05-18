import urllib
import urllib2
import cookielib
import random
import json
import time
import hashlib
from itertools import permutations
from multiprocessing import Pool,Value

#sendData={"version":"1.0","timestamp":"1492228427942","checkcode":'00ea21aee1978ffbf3a6ae8276c1a444'}
#sendData={"version":"1.0","timestamp":"1492228427942","bidnumber":"54155387","requestid":"1492228427948","checkcode":"2f9bb97db8fcf0cf3434dd356bc8a697","request":{"info":"Win10;firefox:;25","uniqueid":"09257752-5771-4fb0-bead-c43bdf8928f7","bidnumber":"54155387","bidpassword":"4958104d5167dba77794b590c131f6aa","imagenumber":"439103","idcard":"","clientId":"","idtype":"0"}}
#sendData={"version":"1.0","timestamp":"1492228427942","bidnumber":"54155387","requestid":"1492228427948","checkcode":"51a2cf585cc4f51877d6b75f917c3a8b","request":{"info":"Win10;firefox:;25","uniqueid":"09257752-5771-4fb0-bead-c43bdf8928f7","bidnumber":"54155387","bidpassword":"4958104d5167dba77794b590c131f6aa","imagenumber":"439103","idcard":"","clientId":"","idtype":"0",'price':'87900'}}
sendData={"version":"1.0","timestamp":"1492228427942","bidnumber":"54155387","requestid":"1492228427948","checkcode":"51a2cf585cc4f51877d6b75f917c3a8b1","request":{"info":"Win10;firefox:;25","uniqueid":"09257752-5771-4fb0-bead-c43bdf8928f7","bidnumber":"54155387","bidpassword":"4958104d5167dba77794b590c131f6aa","imagenumber":"439103","idcard":"","clientId":"","idtype":"0",'price':'87900'}}
#sendData={"version":"1.0","timestamp":"1492226314374","requestid":"1492226314374","request":{},"checkcode":"fe4728397f1541e581bbd887332776df"}
#sendDir={}
checkcode=""
def md5(src):
    myMd5 = hashlib.md5()
    myMd5.update(src)
    myMd5_Digest = myMd5.hexdigest()
    return myMd5_Digest
#def md5(str):
    #m = hashlib.md5()   
    #m.update(str)
    #return m.hexdigest()
def createDir(org_dir,sendDir):
    for key,value in org_dir.items():
        if type(value)==type(""):
            sendDir[key]=value
        if type(value)==type({}):
            createDir(value,sendDir)
    return sendDir
def getCheckCode(sendDir):
    global checkcode
    #print sendDir.values()
    checkcode=sendDir.pop('checkcode')
    sendDir.pop('info')
    valueList=[]
    for key,value in sendDir.items():
        #remove the empty value
        if value=="":
            sendDir.pop(key)
            continue
        #remove the repeated value
        if value in valueList:
            sendDir.pop(key)
        else:
            valueList.append(value)
            
    #print md5("aaa")

    print sendDir
    print checkcode
    return sendDir
    #print md5(sendDir["bidpassword"]+sendDir["bidnumber"]+sendDir["imagenumber"]+sendDir["idcard"]+sendDir["requestid"]+sendDir["uniqueid"]+sendDir["version"])



def GetMethod(count,m):
    global checkcode
    breakFlag=False
    if True:
    #for n in xrange(len(sendDir)+1):
    #for n in xrange(2):
        #for m in permutations(sendDir.values(), n):
            count.value=count.value+1
            #print i
            #continue
            summ=""
            for l in m:
                summ+=str(l)
            if md5(summ)==checkcode:
                breakFlag=True
                sumstr=""
                print "PASS %s %s" %(md5(summ),checkcode)
                print m
                print "**************************************************************************"
                for l in m:
                    for key,value in sendDir.items():
                        if value==l:
                            sumstr+=value
                            print key
                            break
                print "**************************************************************************"
                print sumstr
                #break
            else:
                print "FAIL %s %s" %(md5(summ),checkcode)
        #if breakFlag:
        #    break
                

def f(x):
    return x*x

if __name__ == '__main__':
    startTime=time.time()
    sendDir={}
    createDir(sendData,sendDir)
    sendDir=getCheckCode(sendDir)
    count= Value('d', 0.0)
    #p = Pool(50)
    #li=[]
    for n in xrange(len(sendDir)+1):
        print len(list(permutations(sendDir.values(), n)))
        #for m in permutations(sendDir.values(), n):
        #    print len(m)
            #li.append(m)
            #p.map(GetMethod, list())                
    print "time cost:%ss" %(time.time()-startTime)

#if __name__=="__main__":
    #startTime=time.time()
    #sendDir={}
    #createDir(sendData,sendDir)
    #getCheckCode(sendDir)
    #GetMethod()
    #print "time cost:%ss" %(time.time()-startTime)

    


