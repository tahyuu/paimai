# -*- coding: cp936 -*-
import httplib, urllib, time, json, md5, Tkinter, threading, re, Cookie, sys
from collections import OrderedDict
from StringIO import StringIO
from PIL import Image,ImageTk

#style="display: true;"
#conn = httplib.HTTPSConnection("paimai.alltobid.com")
params = "%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492228427942%22%2C%22bidnumber%22%3A%2254155387%22%2C%22requestid%22%3A%221492228427948%22%2C%22checkcode%22%3A%222f9bb97db8fcf0cf3434dd356bc8a697%22%2C%22request%22%3A%7B%22info%22%3A%22Win10%3Bfirefox%3A%3B25%22%2C%22uniqueid%22%3A%2209257752-5771-4fb0-bead-c43bdf8928f7%22%2C%22bidnumber%22%3A%2254155387%22%2C%22bidpassword%22%3A%224958104d5167dba77794b590c131f6aa%22%2C%22imagenumber%22%3A%22439103%22%2C%22idcard%22%3A%22%22%2C%22clientId%22%3A%22%22%2C%22idtype%22%3A%220%22%7D%7D"
#params = "%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492226314374%22%2C%22requestid%22%3A%221492226314374%22%2C%22request%22%3A%7B%7D%2C%22checkcode%22%3A%22fe4728397f1541e581bbd887332776df%22%7D"
#params = '{"method":"getimagecode","cmd":"%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492228432488%22%2C%22requestid%22%3A%221492228432488%22%2C%22request%22%3A%7B%7D%2C%22checkcode%22%3A%22f94eac34ce7574e93da7d76598959859%22%7D"}'
print urllib.unquote(params)
#print params
#print urllib.unquote("%E7%8E%8B%E6%9E%9C").decode('utf8').encode('gb2312')
#print urllib.unquote("2017%E5%B9%B49%E6%9C%8830%E6%97%A5").decode('utf8').encode('gb2312')
#print urllib.unquote("222.73.120.236%3A8300%2C222.73.122.102%3A8300")
#print urllib.unquote("paimai.alltobid.com%3A80")

'''
timestamp = str(int(time.time()*1000))
params = '{"method":"getimagecode","cmd":"%7B%22version%22%3A%221.0%22%2C%22'+\
         'timestamp%22%3A%22'+timestamp+'%22%2C%22requestid%22%3A%22'+timestamp+'%22%2C%22request%22%3A%7B%7D%2C%22'+\
         'checkcode%22%3A%22fe4728397f1541e581bbd887332776df%22%7D"}'
print params
params = '{"method":"getimagecode","cmd":"%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492226314374%22%2C%22requestid%22%3A%221492226314374%22%2C%22request%22%3A%7B%7D%2C%22checkcode%22%3A%22fe4728397f1541e581bbd887332776df%22%7D"}'
print params
print len(params)
print urllib.unquote(params)
headers = {"Host": "paimai.alltobid.com",
           "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
           "Accept": "application/json, text/javascript, */*; q=0.01",
           "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
           "Accept-Encoding": "gzip, deflate, br",
           "Content-Type": "application/json",
           "X-Requested-With": "XMLHttpRequest",
           #"Referer": "https://paimai.alltobid.com/bid/2017031801/login.htm",
           "Content-Length": str(len(params)),
           "Connection": "keep-alive"}
conn.request("POST","/webwcf/BidCmd.svc/WebCmd",params,headers)
res = conn.getresponse()
print res.status, res.reason
data = res.read()
print data.decode('utf8').encode('gb2312')
'''

#print poststr

class BID:
    def __init__(self):
        self.version = '1.0'
        self.bidnumber = '54155387'
        self.bidpassword = '4958104d5167dba77794b590c131f6aa'
        self.imagenumber = '439103'
        self.idcard = ''
        self.uniqueid = '09257752-5771-4fb0-bead-c43bdf8928f7'
    def GetPassCode4Login(self):
        timestamp = str(int(time.time()*1000))
        params = OrderedDict()
        params['method'] = 'getimagecode'
        params['cmd'] = OrderedDict()
        params['cmd']['version'] = self.version
        params['cmd']['timestamp'] = timestamp
        params['cmd']['requestid'] = timestamp
        params['cmd']['request'] = {}
        #requestid + timestamp + version
        params['cmd']['checkcode'] = md5.new(params['cmd']['requestid']+params['cmd']['timestamp']+params['cmd']['version']).hexdigest()
        params['cmd'] = urllib.quote(json.dumps(params['cmd'],separators=(',',':')))
        poststr = json.dumps(params,separators=(',',':'))

        headers = {"Host": "paimai.alltobid.com",
                   "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
                   "Accept": "application/json, text/javascript, */*; q=0.01",
                   "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
                   "Accept-Encoding": "gzip, deflate, br",
                   "Content-Type": "application/json",
                   "X-Requested-With": "XMLHttpRequest",
                   "Referer": self.referer,
                   "Content-Length": str(len(poststr)),
                   "Connection": "keep-alive"}
        self.conn.request("POST","/webwcf/BidCmd.svc/WebCmd",poststr,headers)
        ############################################
        #if jason return ok, then show image and ask to recoginize the image
        if "OK":
            self.step="readPassCode"
        else:
            self.step="GetPassCode4Login"
    def readPassCode4Login():
        self.passcode4login="124556"
        return "124556"
        pass

    def Login(self):
        timestamp = str(int(time.time()*1000))
        params = OrderedDict()
        params['method'] = 'login'
        params['cmd'] = OrderedDict()
        params['cmd']['version'] = self.version
        params['cmd']['timestamp'] = timestamp
        params['cmd']['bidnumber'] = self.bidnumber       
        params['cmd']['requestid'] = timestamp
        #bidpassword + bidnumber + imagenumber + idcard + requestid + uniqueid + version
        s = self.bidpassword+self.bidnumber+self.passcode4login+self.idcard+"1492228427948"+self.uniqueid+self.version
        print s
        params['cmd']['checkcode'] = md5.new(s).hexdigest()
        print params['cmd']['checkcode']
        params['cmd'] = urllib.quote(json.dumps(params['cmd'],separators=(',',':')))
        poststr = json.dumps(params,separators=(',',':'))
        if "login success":
            self.step="GetPassCode4OfferePrice":
        else:
            self.step="GetPassCode4Login":
    def Wait4Start(self):
        if currentMinitues==29:
            self.step="GetPassCode4OfferPrice"
        else:
            self.step="Wait4Start"
    def GetPassCode4OfferPrice(self):
        timestamp = str(int(time.time()*1000))
        params = OrderedDict()
        params['method'] = 'getimagecode'
        params['cmd'] = OrderedDict()
        params['cmd']['version'] = self.version
        params['cmd']['timestamp'] = timestamp
        params['cmd']['requestid'] = timestamp
        params['cmd']['request'] = {}
        #requestid + timestamp + version
        params['cmd']['checkcode'] = md5.new(params['cmd']['requestid']+params['cmd']['timestamp']+params['cmd']['version']).hexdigest()
        params['cmd'] = urllib.quote(json.dumps(params['cmd'],separators=(',',':')))
        poststr = json.dumps(params,separators=(',',':'))

        headers = {"Host": "paimai.alltobid.com",
                   "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
                   "Accept": "application/json, text/javascript, */*; q=0.01",
                   "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
                   "Accept-Encoding": "gzip, deflate, br",
                   "Content-Type": "application/json",
                   "X-Requested-With": "XMLHttpRequest",
                   "Referer": self.referer,
                   "Content-Length": str(len(poststr)),
                   "Connection": "keep-alive"}
        if "OK":
            self.step="ReadPassCode4OfferPrice"
        else:
            self.step="GetPassCode4OfferPrice"
    def ReadPassCode4OfferPrice(self):
        self.passcode4login="124556"
        self.step="Wait4Submit"
        return "124556"
    def Wait4Submit(self)
        if currentSecond==57:
            self.step="Submit"
    def Submit(self):
        pass

    def StopThread(self):
        self.step = 'Stop'
        self.top.destroy()
        sys.exit(0)

    def NoCallback(self):
        print 'hello world'
       
    def Run(self):
        #if currentsecond >56 then submit
        if time.time()> 1520784000.0:  #2018年3月12
            self.label_msg.set('程序已过期'.decode('GBK').encode('UTF-8'))
            return
        else:
            timestr = time.strftime('%Y%m%d',time.localtime())
            self.referer = "https://paimai.alltobid.com/bid/"+timestr+"01/login.htm"        
            self.conn = httplib.HTTPSConnection("paimai.alltobid.com")
            while True:
                if self.step == 'GetImageCode':
                    self.GetImageCode()
                elif self.step == 'Login':
                    self.Login()
                    self.step = 'Stop'
                elif self.step == 'GetLeftTicketUrl':
                    self.GetLeftTicketUrl()                
                elif self.step == 'SubmitOrderRequest':
                    self.SubmitOrderRequest()
                elif self.step == 'CheckOrderInfo':
                    self.CheckOrderInfo()
                elif self.step == 'GetQueueCount':
                    self.GetQueueCount()
                elif self.step == 'ConfirmSingleForQueue':
                    self.ConfirmSingleForQueue()
                elif self.step == 'QueryOrderWaitTime':
                    self.QueryOrderWaitTime()
                    time.sleep(10)
                elif self.step == 'Stop':
                    break
def GetCurrentTime()
    pass
def GetLatestPrice()
    pass

    
if __name__=='__main__':
    bid=BID()
    bid.run()
    t_read_time=threading.Thread(target=readTime,args=(hp,))
    t_read_time.start()
    t_read_price=threading.Thread(target=readPrice,args=(hp,))
    t_read_price.start()









    
