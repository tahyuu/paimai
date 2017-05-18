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
        
                
        self.top = Tkinter.Tk()
        self.top.resizable(False,False)
        self.top.title('BID'.decode('GBK').encode('UTF-8'))
        #image = Image.open("test.jpg")
        #print image.format, image.size, image.mode
        #im_click = image.tostring()
        #im_click = '\xff\xfe\xff\xfc\xfe\xfb\xf8\xff\xfd\xf8\xff\xfb\xfd\xff\xf9\xff\xff\xf8\xff\xfe\xf8\xff\xfd\xf7\xff\xff\xfb\xff\xfc\xf9\xff\xf7\xf4\xff\xf4\xef\xff\xee\xea\xff\xed\xeb\xff\xf2\xf3\xff\xf5\xf8\xff\xf9\xff\xff\xfc\xff\xff\xfc\xfd\xff\xfd\xf9\xfe\xff\xfd\xfe\xff\xff\xff\xfc\xff\xff\xfc\xff\xfe\xff\xff\xfb\xff\xff\xff\xfc\xff\xff\xff\xff\xf1\xfa\xf5\xf9\xff\xfb\xff\xff\xfa\xff\xfa\xf6\xff\xf3\xef\xff\xf5\xf3\xff\xeb\xea\xff\xd2\xd0\xe3\xa2\x9e\xc4wq\xb4YT\xb9^[\xcd}~\xef\xad\xaf\xff\xd1\xd4\xff\xe6\xe7\xff\xf6\xf4\xff\xf7\xf3\xff\xfe\xfb\xfc\xfe\xfd\xff\xfd\xff\xff\xfa\xff\xfe\xff\xff\xfb\xff\xff\xff\xfc\xff\xfd\xfb\xfe\xfc\xff\xfd\xfe\xff\xfb\xff\xfc\xfa\xff\xf5\xf7\xff\xe7\xec\xfa\x9e\xa3\x9b\x1a\x1e\xa1\x0f\x10\xa8\x0e\x0c\xa9\x0c\x07\xb5\x16\x10\xb3\x11\x0c\xb0\x0e\x0c\xa7\x0e\t\x97\x0e\x06\xb7H?\xff\xb5\xaf\xff\xeb\xe7\xff\xfb\xfb\xfe\xfe\xff\xff\xfe\xff\xff\xff\xff\xfe\xff\xff\xfc\xff\xfd\xff\xfb\xff\xff\xfd\xff\xff\xfe\xfc\xff\xfa\xf8\xff\xf2\xf5\xff\xce\xd3\x9e5:\x9f\x13\x16\xb9\x0b\r\xc8\x10\x10\xbd\x11\r\xc9\'"\xba\x1f\x1a\xc5(#\xc8\x1c\x1a\xc2\x10\x0c\xc7\x19\x0e\xb3\x17\x0b\x8e\x15\r\xbcgd\xff\xd9\xdc\xff\xf4\xf7\xff\xf7\xfa\xff\xff\xff\xfe\xff\xff\xfe\xff\xfd\xff\xfc\xff\xff\xfa\xfd\xff\xfc\xfe\xff\xf2\xf6\xff\xb8\xc2\x96\x14\x1c\xb1\x13\x14\xbf\x10\x0b\xc9\x12\x0e\xb3\x10\x0b\xc1JD\xff\xb6\xb1\xff\xc4\xc2\xff\xc3\xc3\xfa\x8e\x8e\xad&#\xb8\x0f\n\xc4\x0e\n\xc1\x13\x12\xa2\x0e\x0e\xa8@?\xff\xc7\xc8\xff\xf8\xf8\xff\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfd\xfc\xff\xfb\xfb\xff\xf7\xf6\xff\xc8\xca\x91\x0f\x17\xb7\x12\x19\xbb\r\x0c\xb8\x0f\n\xb9"\x1b\xf1xp\xff\xc9\xc3\xff\xef\xeb\xff\xf3\xf4\xff\xf2\xf4\xff\xeb\xec\xff\xa8\xa8\xd8VV\xb0\x11\x0e\xc7\x11\x10\xc3\x11\x0f\xa2\x0e\x0c\xaaA>\xff\xd3\xd0\xff\xf7\xf7\xff\xfc\xfe\xff\xff\xff\xf9\xff\xf9\xff\xfb\xf4\xff\xe0\xd8\x9e3-\xb5\x12\x13\xbf\x0c\x0f\xab\x0f\x12\xc8LL\xff\xc4\xbf\xff\xf0\xea\xff\xf2\xed\xff\xf2\xf0\xff\xef\xf0\xff\xf5\xf6\xff\xf6\xf4\xff\xf2\xf0\xff\xe7\xe7\xff\xa2\xa3\xbc**\xbc\x0f\x0b\xc3\x12\n\xa1\x0c\x05\xbee_\xff\xe4\xe1\xff\xf9\xfc\xfe\xfd\xff\xfc\xff\xfd\xff\xf4\xed\xda|r\xa0\x12\x08\xb8\x0b\x05\xb3\x0e\x0c\xd0UX\xff\xd9\xde\xff\xf0\xef\xff\xee\xe9\xff\xbd\xb8\xd4\x83\x7f\xbchf\xbcqn\xdc\x9f\x9c\xff\xd7\xd3\xff\xf3\xf1\xff\xec\xed\xff\xb0\xad\xb0\x1f\x1a\xc1\x0c\x05\xbe\x11\n\x8d\x11\t\xfa\xaf\xaa\xff\xf6\xf7\xfe\xfd\xff\xff\xfb\xfe\xff\xe5\xe5\x9d\x1a\x12\xb7\x0f\x04\xb2\r\x07\xae(%\xff\xd1\xd6\xff\xef\xf6\xff\xe5\xe6\xb9ZV\xa7\x14\x0c\xbf\x13\x07\xc1\x16\x0c\xbc\x15\x0c\xb1\x12\x0c\xa7&!\xeb\x9c\x98\xff\xeb\xe9\xff\xec\xed\xf6\x96\x97\xb2\x0f\x10\xc7\x11\x0e\xa8\x0b\x04\xb7JC\xff\xe0\xdd\xff\xfe\xfc\xff\xf4\xfc\xe6\x9f\xa3\x9f\x07\x04\xbe\x0b\x06\xab\x12\r\xf8\x8b\x88\xff\xee\xf2\xff\xe7\xea\xb9]`\xa2\x18\x16\xcd\x18\r\xe1\x19\n\xd9\x18\t\xd4\x14\x07\xe0\x1d\x17\xc2\x16\x12\x9b \x1b\xec\x9d\x99\xff\xef\xf0\xff\xe7\xeb\xcfCF\xb9\t\x0b\xbb\x0c\t\x92\r\x08\xf7\xc6\xc1\xff\xf9\xf6\xff\xee\xf4\xb4Y^\xaa\t\x0e\xb7\x07\n\xa7!"\xff\xc7\xc7\xff\xef\xec\xee\xa8\xa6\xa2\x18\x18\xc0\x17\x14\xba\x14\x08\xbf\x1f\x0f\xb3\x1b\r\xc1%\x19\xc0\x14\x10\xc7\x15\x13\xbc\x13\x0e\xbb:5\xff\xd8\xda\xff\xef\xf3\xf3~\x84\xab\x0c\x11\xc2\x0f\x12\x9d\t\t\xdf\x9f\x9d\xff\xf0\xeb\xff\xea\xec\x9703\xaf\n\x10\xb4\t\x0f\xc1JN\xff\xe1\xe0\xff\xe5\xe0\xb4]V\xaa\x10\x10\xcb#"\xff\x85}\xff\xa5\x98\xff\xae\xa5\xff\xab\xa4\xff\xa4\xa3\xed\\Y\xd0\x1b\x14\xa6\x0c\x04\xdd\x99\x98\xff\xec\xef\xff\xb1\xb5\xaa\x1b\x1f\xb7\x06\x0c\xa3\x08\x0c\xc9\x7f~\xff\xe9\xe6\xff\xe9\xe3\x8b# \xa9\x05\x06\xad\n\r\xcdfg\xff\xe9\xe5\xff\xcf\xca\x9d97\xa5\x16\x1a\xf2mp\xff\xe4\xe5\xff\xf1\xf1\xff\xf3\xf2\xff\xef\xee\xff\xf0\xee\xff\xd2\xcc\xc2&\x1a\xb6\x19\x10\xbfto\xff\xed\xeb\xff\xcb\xc7\xab+*\xb3\n\x11\xa8\x0e\x16\xbbkn\xff\xe2\xe0\xff\xe7\xe2\x8b$\x1f\xad\t\x08\xa8\x08\x08\xcajk\xff\xe8\xe5\xff\xbe\xb8\x9b51\xa2\x16\x17\xecos\xff\xec\xf2\xff\xf4\xf8\xfb\xf5\xf9\xfd\xf7\xf9\xff\xfb\xfa\xff\xd8\xd3\xc4+#\xad\x0f\x06\xbdli\xff\xe8\xe6\xff\xd5\xce\xa8.)\xac\x05\x0c\xa2\x08\x10\xb7ii\xff\xde\xdc\xff\xe3\xe7\x9703\xad\x0b\t\xac\t\n\xc5ac\xff\xea\xe9\xff\xd1\xca\xa8G@\xa5\x10\x0c\xce<=\xff\xac\xb3\xff\xe6\xec\xff\xf4\xf4\xff\xf6\xf2\xff\xd9\xd8\xf3\x8f\x8f\xc5 \x1e\xab\x0b\x0b\xcbv{\xff\xed\xef\xff\xc2\xbd\xa6\'!\xb4\n\r\xa2\x0c\x0e\xbfxt\xff\xe6\xde\xff\xeb\xf1\xacQV\xa6\x08\x07\xab\x07\x06\xa47:\xff\xd6\xd7\xff\xef\xe8\xc0pg\xaa\x16\x12\xa9\x0b\n\x89\x14\x1a\xd7\x8c\x90\xff\xf1\xef\xe3\xbc\xb7\x9387\x94\x0e\x0f\xb2\x0c\x0e\xac\x1a\x1d\xf5\xaa\xaf\xff\xea\xef\xff\x9b\x97\x9c\x13\r\xb3\x07\x07\x9d\x0b\x0b\xca\x8d\x88\xff\xf1\xea\xff\xf3\xf7\xd9\x91\x94\x9d\x0b\x0b\xae\n\t\x90\x14\x14\xff\xb5\xb5\xff\xee\xec\xfe\xc7\xc4\xa2!\x1c\xb0\x0e\x0b\xa8\x10\x0f\xc5OM\xff\xed\xe8\xbexv\x9c\x14\x14\xb6\x11\x15\xa6\x10\x12\xc5RU\xff\xe7\xea\xff\xed\xed\xd5b_\xa6\r\x08\xb6\n\x08\x93\t\x07\xed\xb7\xb5\xff\xf6\xf4\xff\xf9\xfb\xff\xcd\xce\x98\x18\x17\xa6\x0b\t\x9d\x11\x10\xc9a`\xff\xed\xf0\xff\xe8\xe8\xf5\x92\x8d\xa6\x1f\x1b\xaa\x0c\t\xd1GD\xff\xe0\xdc\xcdzv\xb0\x14\x15\xb0\n\x0c\xb5>@\xff\xbd\xbd\xff\xea\xea\xff\xcf\xcf\xac**\xa7\x05\x03\xaa\x0c\t\x94\x1d\x19\xfd\xd1\xce\xff\xfe\xfb\xff\xfc\xfd\xff\xed\xee\xc9ab\x99\x0b\n\xa4\n\x08\x94\x0e\r\xe7\x96\x9c\xff\xee\xf3\xff\xef\xea\xf4\xa4\x9d\xa2\x1c\x1b\xd0LJ\xff\xe6\xe0\xc7tp\x9f\n\x0c\xd2AD\xff\xd7\xd2\xff\xf3\xed\xff\xe7\xe4\xa8LM\x9c\t\x0f\xad\x0e\x12\x8d\x0b\x0b\xdf\x87\x83\xff\xeb\xe6\xff\xfe\xf8\xff\xfd\xfd\xff\xf7\xf6\xff\xc1\xc3\x97)*\xa3\x0f\r\xa2\x0e\x0e\x90!\'\xef\xa0\xa5\xff\xeb\xe7\xb9zu\x85\x14\x16\xbcIL\xff\xe8\xe4\xbewu\x98\x16\x18\xa8*-\xff\xc9\xc5\xff\xe8\xe2\xc0kh\x8f\x14\x16\xa6\x0c\x14\x9b\x0b\x14\x9002\xff\xce\xcc\xff\xf9\xf3\xff\xff\xf7\xff\xfe\xfb\xff\xfb\xfb\xff\xf4\xf7\xd4\x96\x99\x8f\x17\x18\x9c\n\n\x97\x0b\x0e\x86\x0e\x10\xa8MLp\x1f\x1e\x81%*\xd8\x87\x8d\xff\xf1\xf4\xdf\xad\xae\x8d)+\x88\x16\x16\x8c43\xa4EC\x93\t\t\xa7\x0c\x10\x9e\x08\x11\x87\x13\x1c\xe8\xb0\xb3\xff\xf1\xf2\xff\xfe\xfd\xfa\xff\xfb\xff\xfd\xfa\xff\xfd\xfc\xff\xfe\xff\xff\xf4\xf6\xcavv\x8b\x17\x17\xa8,*\xc8RP\xc5fd\xdb\x8b\x8a\xff\xb7\xbb\xff\xdc\xe2\xff\xe6\xec\xff\xe8\xec\xff\xbe\xbe\xe8\x8d\x8a\xc5ml\xbaRS\xad##\x95\x06\x08\x8c\x17\x1d\xdd\x8e\x93\xff\xeb\xed\xff\xfe\xfd\xff\xff\xff\xfd\xff\xfe\xff\xff\xfb\xff\xff\xfb\xff\xff\xfd\xff\xfc\xfa\xff\xf4\xf1\xc5\x8e\x89\xa8ga\xff\xe8\xe0\xff\xe7\xe1\xff\xea\xe6\xff\xe8\xe7\xff\xe6\xe9\xff\xe5\xe9\xff\xe9\xea\xff\xe6\xe2\xff\xeb\xe5\xff\xe6\xe2\xff\xe6\xe3\xc5mk\x8a43\xd8\x9c\x9c\xff\xea\xea\xff\xfb\xf8\xff\xfe\xfa\xff\xfe\xfa\xff\xfe\xf9\xff\xff\xfd\xff\xff\xfd\xff\xfe\xfa\xff\xfc\xf7\xff\xfc\xf8\xff\xf8\xf4\xe8\xcb\xc7\xaa\x87\x81\x81XR\x82WQ\x86YV\x86XX\x89X[\x87VY\x8b[W\x83VQ~WR}TP\xa7vr\xf2\xc9\xc5\xff\xf3\xf2\xff\xfb\xfa\xff\xfd\xf8\xff\xfe\xf8\xff\xfe\xf8\xff\xff\xf6\xff\xfe\xff\xff\xfe\xff\xff\xfd\xfa\xff\xfd\xfa\xff\xfe\xfb\xff\xfc\xfe\xff\xf9\xfe\xff\xf7\xfc\xdb\xc1\xc0\xae\x8b\x87\x85RNs63i\'(d$%r79\x87WW\xae\x8f\x8d\xdb\xc3\xc1\xff\xf0\xed\xff\xfb\xfa\xfd\xfb\xfe\xfe\xfe\xff\xff\xfd\xfa\xff\xfd\xf6\xff\xff\xf6\xff\xff\xf4\xff\xfd\xff\xff\xfd\xff\xff\xfc\xfa\xff\xfd\xf8\xff\xff\xff\xfe\xfd\xff\xff\xfa\xff\xff\xf9\xff\xff\xf9\xfb\xff\xf3\xf0\xff\xe6\xe1\xff\xdd\xd8\xff\xd7\xd6\xff\xd7\xd8\xff\xdc\xe1\xff\xe2\xe6\xff\xf3\xf2\xff\xfb\xfa\xff\xfd\xfb\xfe\xfe\xfe\xf9\xff\xff\xfb\xff\xff\xff\xfc\xfa\xff\xfa\xf3\xff\xff\xf4\xfe\xff\xf4'
        #self.im_click = ImageTk.PhotoImage(Image.fromstring('RGB',(26,26),im_click))
        self.canvas = Tkinter.Canvas(self.top,width=293,height=190)
        self.canvas.bind('<ButtonRelease-1>',lambda event:self.CreatXYList(event))
        self.canvas.pack()
        self.label_msg = Tkinter.StringVar()
        Tkinter.Label(self.top,textvariable=self.label_msg,bg='green').pack(fill='x',expand=1)
        self.button = Tkinter.Button(self.top,text='空格键触发按钮'.decode('GBK').encode('UTF-8'),bg='violet',command=self.NoCallback)
        self.button.bind_all('<space>',lambda event:self.NoCallback())
        self.button.pack(fill='x',expand=1)
        self.step = 'Login'
        t = threading.Thread(target=self.Sequence)
        #t.setDaemon(True)
        t.start()
        self.top.protocol('WM_DELETE_WINDOW',self.StopThread)
        self.top.mainloop()

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









    
