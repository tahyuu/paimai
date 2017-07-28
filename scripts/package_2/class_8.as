package package_2
{
   import flash.utils.ByteArray;
   import package_14.class_32;
   import package_14.class_33;
   
   public class class_8
   {
       
      
      private var var_38:String = "gfheru3";
      
      private var key:ByteArray;
      
      private var var_41:String = "abcd";
      
      var name_2:Object;
      
      var name_3:Object;
      
      var a:Array;
      
      var input:String = "This is a regular string";
      
      var var_40:String;
      
      public function class_8(param1:String)
      {
         this.key = new ByteArray();
         this.name_2 = new Object();
         this.name_3 = new Object();
         this.a = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".split("");
         this.var_40 = this.method_40(this.input);
         super();
         this.key.writeMultiByte(param1.substr(2,5),"utf-8");
      }
      
      public function method_30(param1:String) : String
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(class_33.name_2(param1),"utf-8");
         var _loc3_:ByteArray = class_32.method_41(_loc2_,this.key);
         var _loc4_:String = class_33.method_42(_loc3_);
         return _loc4_;
      }
      
      public function method_31(param1:String) : String
      {
         var _loc2_:ByteArray = class_33.method_43(param1);
         var _loc3_:ByteArray = class_32.method_44(_loc2_,this.key);
         var _loc4_:String = _loc3_.toString();
         var _loc5_:String = class_33.name_3(_loc4_);
         return _loc5_;
      }
      
      public function method_45(param1:String) : String
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:Array = param1.split("");
         _loc4_ = _loc2_.length;
         if((_loc5_ = _loc4_ % 7) != 0)
         {
            _loc4_ = _loc4_ + 7 - _loc5_;
         }
         var _loc9_:Array = new Array(_loc4_);
         _loc8_ = _loc4_ / 7;
         _loc6_ = 0;
         while(_loc6_ < 7)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc8_)
            {
               if(_loc6_ * _loc8_ + _loc7_ < _loc2_.length)
               {
                  _loc9_[_loc6_ + _loc7_ * 7] = _loc2_[_loc6_ * _loc8_ + _loc7_];
               }
               else
               {
                  _loc9_[_loc6_ + 7 * _loc7_] = " ";
               }
               _loc7_++;
            }
            _loc6_++;
         }
         while(_loc9_[_loc4_ - 1] == " ")
         {
            _loc4_--;
         }
         var _loc10_:String = "";
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc10_ = _loc10_ + _loc9_[_loc6_];
            _loc6_++;
         }
         return _loc10_;
      }
      
      function method_40(param1:String) : String
      {
         return this.method_46(param1,this.name_2);
      }
      
      function method_47(param1:String) : String
      {
         return this.method_46(param1,this.name_3);
      }
      
      function method_46(param1:String, param2:Object) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = param1.charAt(_loc4_);
            _loc6_ = param2[_loc5_];
            if(_loc6_)
            {
               _loc3_ = _loc3_ + _loc6_;
            }
            else
            {
               _loc3_ = _loc3_ + _loc5_;
            }
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
