package package_14
{
   import flash.utils.ByteArray;
   
   public class class_33
   {
      
      private static const const_3:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
      
      public static const name_1:String = "1.0.0";
       
      
      public function class_33()
      {
         super();
         throw new Error("Base64 class is static container only");
      }
      
      public static function name_2(param1:String) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTFBytes(param1);
         return method_42(_loc2_);
      }
      
      public static function method_42(param1:ByteArray) : String
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc2_:String = "";
         var _loc4_:Array = new Array(4);
         param1.position = 0;
         while(param1.bytesAvailable > 0)
         {
            _loc3_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < 3 && param1.bytesAvailable > 0)
            {
               _loc3_[_loc5_] = param1.readUnsignedByte();
               _loc5_++;
            }
            _loc4_[0] = (_loc3_[0] & 252) >> 2;
            _loc4_[1] = (_loc3_[0] & 3) << 4 | _loc3_[1] >> 4;
            _loc4_[2] = (_loc3_[1] & 15) << 2 | _loc3_[2] >> 6;
            _loc4_[3] = _loc3_[2] & 63;
            _loc6_ = uint(_loc3_.length);
            while(_loc6_ < 3)
            {
               _loc4_[_loc6_ + 1] = 64;
               _loc6_++;
            }
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               _loc2_ = _loc2_ + const_3.charAt(_loc4_[_loc7_]);
               _loc7_++;
            }
         }
         return _loc2_;
      }
      
      public static function name_3(param1:String) : String
      {
         var _loc2_:ByteArray = method_43(param1);
         return _loc2_.readUTFBytes(_loc2_.length);
      }
      
      public static function method_43(param1:String) : ByteArray
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = new Array(4);
         var _loc4_:Array = new Array(3);
         var _loc5_:* = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = 0;
            while(_loc6_ < 4 && _loc5_ + _loc6_ < param1.length)
            {
               _loc3_[_loc6_] = const_3.indexOf(param1.charAt(_loc5_ + _loc6_));
               _loc6_++;
            }
            _loc4_[0] = (_loc3_[0] << 2) + ((_loc3_[1] & 48) >> 4);
            _loc4_[1] = ((_loc3_[1] & 15) << 4) + ((_loc3_[2] & 60) >> 2);
            _loc4_[2] = ((_loc3_[2] & 3) << 6) + _loc3_[3];
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               if(_loc3_[_loc7_ + 1] == 64)
               {
                  break;
               }
               _loc2_.writeByte(_loc4_[_loc7_]);
               _loc7_++;
            }
            _loc5_ = uint(_loc5_ + 4);
         }
         _loc2_.position = 0;
         return _loc2_;
      }
   }
}
