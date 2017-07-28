# -*- coding: utf-8 -*-
import binascii, base64, re
import struct

#key = 'ji!@p!a'
#print binascii.b2a_hex(key)
#print binascii.b2a_hex(key.decode('gb2312').encode('utf8'))

class EncryptAndDecrypt:
    '''
    class_84 line 259 -->
        class_8.method_31 --->
            class_33 method_43
            class_32 method_44
    '''    
    delta = 2654435769

    def method_166_response_array2str(self, array):
        string = ''
        for i in array:
            string = string + hex(i)[2:10]
        return string
    
    def method_167_response_str2array(self, string):
        d = {'data':[],'length':len(string)}
        #u32le = struct.pack('<I', u32)
        for i in re.findall(r'.{8}',binascii.b2a_hex(base64.standard_b64decode(string))):
            d['data'].append(int(i,16))
        #print d
        return d

    def method_44(self, response_str, key):
        loc3 = self.method_167_response_str2array(response_str)
        print loc3['data']
        loc4 = self.method_167_response_str2array('!@p!a'.decode('gb2312').encode('utf-8'))
        print loc4['data']
        if loc4['length'] < 4:
            loc4['length'] = 4
        loc5 = loc3['length'] - 1
        loc6 = loc3[loc5 - 1]
        loc7 = loc3[0]
        loc11 = 6 + 52/loc3['length']
        loc12 = loc11 * EncryptAndDecrypt.delta
        while loc12 != 0:
            loc9 = loc12 >> 2 & 3
            loc10 = loc5
            while loc10 > 0:
                loc6 = loc3[loc10-1]
                loc8 = (loc6 >> 4 ^ loc7 << 2) + (loc7 >> 3 ^ loc6 << 6) ^ (loc12 ^ loc7) + (loc4[loc10 & 3 ^ loc9] ^ loc6)
                loc3[loc10] = loc3[loc10] - loc8
                loc7 = loc3[loc10]
                loc10 -= 1
            loc6 = loc3[loc5]
            loc8 = (loc6 >> 4 ^ loc7 << 2) + (loc7 >> 3 ^ loc6 << 6) ^ (loc12 ^ loc7) + (loc4[loc10 & 3 ^ loc9] ^ loc6)
            loc3[0] = loc3[0] - loc8
            loc7 = loc3[0]
            loc12 = loc12 - EncryptAndDecrypt.delta
        return self.method_166_response_array2str(loc3)
    

s = 'zozyK/jiyc5uk1GXYKI7ljr5nS8FXhp3Q/FynIqrdpdWroGMkGozYLJWqNXyfwKkhhVnA+SKdJ7A6CAyUhkeMQUmWcxojWc/WPHECLeVEKAPyq7zXYlIFGqDFCqvRe/XogKNmohY4qia1brYaYSQQFU8AklUjOjOqwLf4r85X35R7hHImP+HlaCs0mqeJ2V48//DGWUhhiQeykzVmgco2cTfeB5102qmhfcgMBM5K6neCwOUYffNnrTksWNndndpPwUixWSfGRKG3ADHfWp2npp0H0/F5z4EZYpONjPDSC4V5aXi2lGT0w=='
#s = "ji!@p!a"
s = '7a6f7a794b2f6a69796335756b314758594b49376c6a72356e53384658687033512f46796e49717264706457726f474d6b476f7a594c4a57714e587966774b6b6868566e412b534b644a37413643417955686b654d51556d5763786f6a57632f57504845434c6556454b41507971377a58596c49464771444643717652652f586f674b4e6d6f685934716961316272596159535151465538416b6c556a4f6a4f71774c663472383558333552376848496d502b486c614373306d71654a325634382f2f444757556868695165796b7a566d67636f32635466654235313032716d686663674d424d354b366e6543774f555966664e6e72546b73574e6e646e6470507755697857536647524b4733414448665770326e70703048302f46357a34455a59704f4e6a50445343345635615869326c475430773d3d'
#print binascii.b2a_hex(s)
#for i in re.findall(r'.{8}',binascii.b2a_hex(s)):
#    print i
                    
#print base64.standard_b64decode(s)
#print base64.b64decode(s)
#print s[2:7]
test = EncryptAndDecrypt().method_167_response_str2array(s)
#test = EncryptAndDecrypt().method_44(s,"")
print test
