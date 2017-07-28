package package_29
{
   public class class_143
   {
       
      
      public function class_143()
      {
         super();
      }
      
      public static function method_592(param1:String, param2:String) : Boolean
      {
         return param2 == param1.substring(0,param2.length);
      }
      
      public static function method_579(param1:String, ... rest) : String
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return "";
         }
         var _loc3_:uint = rest.length;
         if(_loc3_ == 1 && rest[0] is Array)
         {
            _loc4_ = rest[0] as Array;
            _loc3_ = _loc4_.length;
         }
         else
         {
            _loc4_ = rest;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc5_ + "\\}","g"),_loc4_[_loc5_]);
            _loc5_++;
         }
         return param1;
      }
      
      public static function method_621(param1:String, param2:String) : Boolean
      {
         return param2 == param1.substring(param1.length - param2.length);
      }
   }
}
