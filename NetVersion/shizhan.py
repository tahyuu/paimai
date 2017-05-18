import httplib, urllib, time, uuid

#style="display: true;"
conn = httplib.HTTPSConnection("paimai.alltobid.com")
#params = "%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492228427942%22%2C%22bidnumber%22%3A%2254155387%22%2C%22requestid%22%3A%221492228427948%22%2C%22checkcode%22%3A%222f9bb97db8fcf0cf3434dd356bc8a697%22%2C%22request%22%3A%7B%22info%22%3A%22Win10%3Bfirefox%3A%3B25%22%2C%22uniqueid%22%3A%2209257752-5771-4fb0-bead-c43bdf8928f7%22%2C%22bidnumber%22%3A%2254155387%22%2C%22bidpassword%22%3A%224958104d5167dba77794b590c131f6aa%22%2C%22imagenumber%22%3A%22439103%22%2C%22idcard%22%3A%22%22%2C%22clientId%22%3A%22%22%2C%22idtype%22%3A%220%22%7D%7D"
params = "%7B%22version%22%3A%221.0%22%2C%22timestamp%22%3A%221492226314374%22%2C%22requestid%22%3A%221492226314374%22%2C%22request%22%3A%7B%7D%2C%22checkcode%22%3A%22fe4728397f1541e581bbd887332776df%22%7D"
print urllib.unquote(params)
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
