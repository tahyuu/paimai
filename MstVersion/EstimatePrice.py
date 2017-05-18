#!/usr/bin/env python
# -*- coding:utf-8 -*-
printStr=""
strategy_time_price={
                36:1200,
                37:1100,
                38:1100,
                39:1100,
                40:1100,
                41:1100,
                42:1100,
                43:1100,
                44:1000,
                45:1000,
                46:900,
                47:800,
                48:800,
                49:700,
                50:700,
                51:600,
                52:600,
                53:500,
                54:500,
                55:500,
                56:300,
                57:300,
                58:300,
                59:300,
                60:300}
f=file("2017.txt")
P_List=[[],[],[],[],[]]
lines=f.readlines()
for line in lines:
    prices=line.split(",")
    P_List[0].append(prices[1])
    P_List[1].append(prices[2])
    P_List[2].append(prices[3])
    P_List[3].append(prices[4])
    P_List[4].append(prices[5].replace('\n',''))
i=0
printStr=" "
for (key,value) in strategy_time_price.items():
    if value<1000:
        printStr+="+%s " %value
    else:
        printStr+="%s " %value
print printStr 
for li in P_List:
    i=0
    printStr=""
    for (key,value) in strategy_time_price.items():
        #print key,value
        #continue
        #printStr+=str(int(li[int(key)])+int(value))
        if not (int(key)==50):
           continue 

        if int(li[int(key)])+int(value)<int(li[-1])+300:
            printStr +=" PASS"
        else:
            if int(li[int(key)])+int(value)-int(li[-1])+300<0:
                printStr +=" %s" %str(int(li[int(key)])+int(value)-int(li[-1])+300)
            else:
                printStr +=" +%s" %str(int(li[int(key)])+int(value)-int(li[-1])+300)
    print printStr
