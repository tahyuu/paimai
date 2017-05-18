import urllib
import urllib2
import cookielib
import random
import json
import time

class HP:
    def __init__(self,configFile):
        self.dict = {}
        self.step="Init the HP class and Read config file"
        lines = file(configFile).readlines()
        self.cookieid=0
        for i in lines:
            if i.strip() != '' and i[0] != '#':
                tmp = i.split()
                self.dict[tmp[0]] = tmp[1]
        for (k,v) in self.dict.items():
            print k,v
    def InitCooike(self):
        'init cookie and and access the frount page'
	filename = 'cookie.txt'
	self.cookie = cookielib.MozillaCookieJar(filename)
	self.opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(self.cookie))
#    def OpenFrountPage(self):
	self.MainUrl = 'http://www.guahao.com/'
	result = self.opener.open(self.MainUrl)
        for cook in self.cookie:
            if "_sh_ssid_" in cook.name:
                print type(cook.value)
                self.cookieid=int(cook.value)
        self.step="GetPassCode"
    def GetLoginPassCode(self):
        'to access the url and get passcode'
	self.passcodeUrl= 'http://www.guahao.com/validcode/genimage/1'
	buff= self.opener.open(self.passcodeUrl)
	path = "C:\\Users\\shdyotan\\Desktop\\abc.jpg"  
	f = file(path,"wb")  
	f.write(buff.read())  
	f.close()
	passcode=raw_input("please input the passcode:")
        self.step="Login"
        self.passcode=passcode
        return passcode
    def Login(self):
        'post the password and username and login'
	loginUrl= 'http://www.guahao.com/user/login?target=%2F'
	post_data = urllib.urlencode({'loginId':self.dict["username"],
	                                          'method':'dologin',
	                                          'password':self.dict["password"],
	                                          'target':'/',
	                                          'validCode':self.passcode})
	buff= self.opener.open(loginUrl,post_data)
        self.step="GetCurrentSystemInformation"
	path = "C:\\Users\\shdyotan\\Desktop\\login.html"  
	f = file(path,"wb")  
	result=f.write(buff.read())  
	f.close()
    def GetCurrentSystemInformation(self):
        'to current system information'
	#expert_url = 'http://www.guahao.com/expert/51bb7b17-51a6-48f1-8eae-8df5ed70ff0e000'
	#buff= opener.open(expert_url)
	#path = "C:\\Users\\shdyotan\\Desktop\\expert.html"  
	#f = file(path,"wb")  
	#result=f.write(buff.read())  
	#f.close()
	shiftCaseUrl = 'http://www.guahao.com/expert/new/shiftcase/?expertId=%s&hospDeptId=%s&hospId=%s' %(self.dict["expertId"],self.dict["hospDeptId"],self.dict["hospId"])
	buff= self.opener.open(shiftCaseUrl)
	#telcodeUrl= 'http://www.guahao.com/json/black/checkfocusexpert?visitType=0&encodePatientId=ACA4368CA4C39A36&expertId=51bb7b17-51a6-48f1-8eae-8df5ed70ff0e000&shiftCaseId=ad46234a-b7dd-49cd-ac66-19bd55fe20f4&signdata=9787BEF12333497CA038677C6F3D6ADA666703CAAE248D06&hospitalId=ef30a81d-f12a-43de-8876-48e9292474f5000&1_require_0cardType=1&1_require_0cardValue=&_=1484231468894'
	#buff= opener.open(telcodeUrl)
	hjson = json.loads(buff.read())
        shiftcaseid=''
	for jurl in hjson["data"]["shiftSchedule"]:
	        shiftcaseid=jurl["url"].split('/')[4].split('?')[0]
                if shiftcaseid:
                    #self.step="GetTelCode"
                    continue
	#shiftcaseid='ad46234a-b7dd-49cd-ac66-19bd55fe20f4'
        CurrentSystemTime=time.time()
        LatestLowPrice=70000
        LatestLowPriceTime=time.time()
        DataBaseAcceptPriceRange=[0,100000]
        self.shiftcaseid=shiftcaseid
        if CurrentSystemTime>"11:29":
            self.step="GetSubmitPassCode"
        return shiftcaseid
    def GetSubmitPassCode(self):
        'to access the url and get passcode'
	self.passcodeUrl= 'http://www.guahao.com/validcode/genimage/1'
	buff= self.opener.open(self.passcodeUrl)
	path = "C:\\Users\\shdyotan\\Desktop\\abc.jpg"  
	f = file(path,"wb")  
	f.write(buff.read())  
	f.close()
	passcode=raw_input("please input the passcode:")
        self.step="Login"
        self.passcode=passcode
        return passcode
    def CheckSubmitPassCode(self):
        self.cookieid=self.cookieid+random.randrange(1000,2000)
        checktelcodeurl='http://www.guahao.com/my/reservation/checkcode/%s/%s/%s/%s/%s?_=%s' %(self.telcode,self.dict['pid'],self.shiftcaseid,self.telcode,self.dict['hde'],self.cookieid)
	buff= self.opener.open(checktelcodeurl)
        self.step="SubmitPrice"
	path = "C:\\Users\\shdyotan\\Desktop\\checktel.txt"  
	f = file(path,"wb")  
	result=f.write(buff.read())  
	f.close()
    def SubmitPrice(self):
        'Submit price'
	loginUrl= 'http://www.guahao.com/user/login?target=%2F'
	post_data = urllib.urlencode({'loginId':self.dict["username"],
	                                          'method':'dologin',
	                                          'password':self.dict["password"],
	                                          'target':'/',
	                                          'validCode':self.passcode})
	buff= self.opener.open(loginUrl,post_data)
        if suceess:
            self.step="GetCurrentSystemInformation"
        else:
            self.step="GetSubmitPassCode"
	path = "C:\\Users\\shdyotan\\Desktop\\login.html"  
	f = file(path,"wb")  
	result=f.write(buff.read())  
	f.close()

if __name__=="__main__":
    hp=HP("18321631629.txt")
    while True:
        if self.step=="InitCooike":
            hp.InitCooike()
        elif self.step=="GetLoginPassCode":
            hp.GetLoginPassCode()
        elif self.step=="Login":
            hp.Login()
        elif self.step=="GetCurrentSystemInformation":
            hp.GetCurrentSystemInformation()
        elif self.step=="GetSubmitPassCode":
            hp.GetSubmitPassCode()
        elif self.step=="CheckSubmitPassCode":
            hp.CheckSubmitPassCode()
        elif self.step=="SubmitPrice":
            hp.SubmitPrice()
        else:
            time.sleep(0.1)
