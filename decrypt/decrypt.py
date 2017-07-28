class decrypt: 
    def __init__(self):
        pass
    #public function method_31(param1:String) : String
    def method_31(self,param1):
         # need to check what type is bytearray in python
         #var _loc2_= self.method_43(param1);
         #_loc2_= self.method_43(param1);
         _loc2_= binascii.b2a_hex(base64.standard_b64decode(param1))
         print _loc2_
         #need to find what is this.key
         _loc3_= self.method_44(_loc2_,this.key);
         _loc4_= _loc3_.toString();
         #need add name3 into this class
         _loc5_= self.name_3(_loc4_);
         return _loc5_;

    #param1: string; return ByteArray
    def method_43(self,param1): 
         _loc6_= 0;
         _loc7_ = 0;
         #var _loc2_:ByteArray = new ByteArray();
         #var _loc3_:Array = new Array(4);
         _loc3_= [0,0,0,0];
         #var _loc4_:Array = new Array(3);
         _loc4_= [0,0,0];
         #var _loc5_:* = 0;
         _loc5_ = 0;
         while(_loc5_ < len(param1)):
            _loc6_ = 0;
            while(_loc6_ < 4 and _loc5_ + _loc6_ < len(param1)):
               #_loc3_[_loc6_] = const_3.indexOf(param1.charAt(_loc5_ + _loc6_));
               _loc3_[_loc6_] = const_3.indexOf(param1.charAt(_loc5_ + _loc6_));
               _loc6_=loc6_+1
            _loc4_[0] = (_loc3_[0] << 2) + ((_loc3_[1] & 48) >> 4);
            _loc4_[1] = ((_loc3_[1] & 15) << 4) + ((_loc3_[2] & 60) >> 2);
            _loc4_[2] = ((_loc3_[2] & 3) << 6) + _loc3_[3];
            _loc7_ = 0;
            while(_loc7_ < len(_loc4_)):
               if(_loc3_[_loc7_ + 1] == 64):
                  break;
               _loc2_.writeByte(_loc4_[_loc7_]);
               _loc7_=_loc7_+1
            _loc5_ = uint(_loc5_ + 4);
         _loc2_.position = 0;
         return _loc2_;
    #public static function method_44(param1:ByteArray, param2:ByteArray) : ByteArray
    def method_44(self,param1, param2):
         #var _loc8_:* = 0;
         #var _loc9_:* = 0;
         #var _loc10_:* = 0;
         #if(param1.length == 0)
         #   return new ByteArray();
         #var _loc3_:Array = self.method_167(param1,false);
         #var _loc4_:Array = self.method_167(param2,false);
         #if(_loc4_.length < 4)
         #   _loc4_.length = 4;
         #var _loc5_:uint = _loc3_.length - 1;
         #var _loc6_:uint = _loc3_[_loc5_ - 1];
         #var _loc7_:uint = _loc3_[0];
         #var _loc11_:uint = uint(6 + 52 / (_loc5_ + 1));
         #var _loc12_:uint = _loc11_ * delta;
         _loc8_ = 0;
         _loc9_ = 0;
         _loc10_ = 0;
         if len(param1)== 0:
            return new ByteArray();
         _loc3_= self.method_167(param1,false);
         _loc4_= self.method_167(param2,false);
         if(_loc4_.length < 4)
            _loc4_.length = 4;
         var _loc5_:uint = _loc3_.length - 1;
         var _loc6_:uint = _loc3_[_loc5_ - 1];
         var _loc7_:uint = _loc3_[0];
         var _loc11_:uint = uint(6 + 52 / (_loc5_ + 1));
         while(_loc12_ != 0)
            _loc9_ = uint(_loc12_ >>> 2 & 3);
            _loc10_ = uint(_loc5_);
            while(_loc10_ > 0)
               _loc6_ = _loc3_[_loc10_ - 1];
               #need to replace >>> to python method.
               _loc8_ = uint((_loc6_ >>> 4 ^ _loc7_ << 2) + (_loc7_ >>> 3 ^ _loc6_ << 6) ^ (_loc12_ ^ _loc7_) + (_loc4_[_loc10_ & 3 ^ _loc9_] ^ _loc6_));
               _loc7_ = _loc3_[_loc10_] = _loc3_[_loc10_] - _loc8_;
               _loc10_--;
            _loc6_ = _loc3_[_loc5_];
            _loc8_ = uint((_loc6_ >>> 4 ^ _loc7_ << 2) + (_loc7_ >>> 3 ^ _loc6_ << 6) ^ (_loc12_ ^ _loc7_) + (_loc4_[_loc10_ & 3 ^ _loc9_] ^ _loc6_));
            _loc7_ = _loc3_[0] = _loc3_[0] - _loc8_;
            _loc12_ = _loc12_ - delta;
         return self.method_166(_loc3_,true);

    #def method_166(param1:Array, param2:Boolean) : ByteArray
    def method_166(self,param1, param2): 
         var _loc7_:* = 0;
         var _loc3_:uint = param1.length;
         var _loc4_:uint = _loc3_ - 1 << 2;
         if(param2)
         {
            _loc7_ = uint(param1[_loc3_ - 1]);
            if(_loc7_ < _loc4_ - 3 || _loc7_ > _loc4_)
            {
               return null;
            }
            _loc4_ = _loc7_;
         }
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.endian = Endian.LITTLE_ENDIAN;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc5_.writeUnsignedInt(param1[_loc6_]);
            _loc6_++;
         }
         if(param2)
         {
            _loc5_.length = _loc4_;
            return _loc5_;
         }
         return _loc5_;
    #def method_167(param1:ByteArray, param2:Boolean) : Array
    def method_167(self,param1, param2):
         _loc3_ = len(param1)&0xffffffff;
         _loc4_= _loc3_ >> 2;
         if(_loc3_ % 4 > 0)
         {
            _loc4_++;
            len(param1)= len(param1)+ (4 - _loc3_ % 4);
         }
         param1.endian = Endian.LITTLE_ENDIAN;
         param1.position = 0;
         var _loc5_:* = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_[_loc6_] = param1.readUnsignedInt();
            _loc6_++;
         }
         if(param2)
         {
            _loc5_[_loc4_] = _loc3_;
         }
         param1.length = _loc3_;
         return _loc5_;



if __name__=="__main__":
    print "aaaaa
