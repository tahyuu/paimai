import win32gui
from sys import argv

class GetPoint:
    def __init__(self):
        pass
if __name__=="__main__":
    dic = {} 
    lines = file("positions.txt").readlines()
    for i in lines:
        if i.strip() != '' and i[0] != '#':
            tmp = i.split(":")
            dic[tmp[0]] = eval(tmp[1])

    print len(argv)
    if len(argv)==1:
	    input_str=raw_input("please move to  enterPrice")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        print po
	        dic["enterPrice"]=po
	        #p_str=p_str+"enterPrice:%s\n" %str(po)
	    else:
	        print dic["enterPrice"]
	
	    input_str=raw_input("please move to Add Price")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        dic["addPrice"]=po
	        print po
	        #p_str=p_str+"addPrice:%s\n" %str(po)
	    else:
	        print dic["addPrice"]
	    input_str=raw_input("please move to Input Price(self input)")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        dic["inputPrice"]=po
	        print po
	        #p_str=p_str+"addPrice:%s\n" %str(po)
	    else:
	        print dic["inputPrice"]
	
	    input_str=raw_input("please move to offer Price")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        print po
	        dic["offerPrice"]=po
	        #p_str=p_str+"offerPrice:%s\n" %str(po)
	    else:
	        print dic["offerPrice"]
	
	    input_str=raw_input("please move to flashPasscode")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        print po
	        dic["flashPasscode"]=po
	        #p_str=p_str+"flashPasscode:%s\n" %str(po)
	    else:
	        print dic["flashPasscode"]

	    input_str=raw_input("please move to submit")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        print po
	        dic["submit"]=po
	        #p_str=p_str+"submit:%s\n" %str(po)
	    else:
	        print dic["submit"]
	
	    input_str=raw_input("please move to canncel submit")
	    if  not input_str:
	        po=win32gui.GetCursorPos()
	        print po
	        dic["cancelSubmit"]=po
	        #p_str=p_str+"submit:%s\n" %str(po)
	    else:
	        print dic["cancelSubmit"]
	    #raw_input("please move to read pass code")
	    #po=win32gui.GetCursorPos()
	    #print po
	    #p_str=p_str+"readPasscode:%s\n" %str(po)
	
    input_str=raw_input("please move to read Time")
    if  not input_str:
        po=win32gui.GetCursorPos()
        print po
        dic["readTime"]=po
        #p_str=p_str+"readTime:%s\n" %str(po)
    else:
        print dic["readTime"]
	
    input_str=raw_input("please move to read Price")
    if  not input_str:
        po=win32gui.GetCursorPos()
        print po
        dic["readPrice"]=po
        #p_str=p_str+"readPrice:%s\n" %str(po)
    else:
        print dic["readPrice"]
	
    input_str=raw_input("please move to read My price")
    if  not input_str:
        po=win32gui.GetCursorPos()
        print po
        dic["readMyPrice"]=po
        #p_str=p_str+"readMyPrice:%s\n" %str(po)
    else:
        print dic["readMyPrice"]
	
	
    input_str=raw_input("please move to getInputpasscode")
    if  not input_str:
        po=win32gui.GetCursorPos()
        print po
        dic["getInputpasscode"]=po
    else:
        print dic["getInputpasscode"]
        #p_str=p_str+"getInputpasscode:%s\n" %str(po)
    p_str=""
    for (key,value) in dic.items():
        p_str=p_str+ "%s:%s\n" %(key,str(value))
	        #print value
	
    f=open("positions.txt","r+")
    f.write(p_str)
