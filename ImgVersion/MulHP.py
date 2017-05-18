#coding=utf-8
import urllib
import urllib2
import cookielib
import random
import json
import time
from MK import *
from PIL import ImageGrab
import pytesseract
from PIL import Image,ImageEnhance,ImageFilter,ImageFilter
from sys import argv
from InputPassCode import InputPassCode 
import win32con
import win32gui
import win32process
import subprocess
import threading
from time import ctime,sleep


def readPrice(price=""):
    for i in range(100):
        print "I am reading price"
        sleep(0.2)

def readTime(time=""):
    for i in range(100):
        print "I am reading Time"
        sleep(0.2)

threads = []
t1 = threading.Thread(target=readPrice,args=(u'price',))
threads.append(t1)
t2 = threading.Thread(target=readTime,args=(u'time',))
threads.append(t2)

if __name__ == '__main__':
    for t in threads:
        t.setDaemon(True)
        t.start()
    t.join()

    print "all over %s" %ctime()
