package package_18
{
   import flash.utils.ByteArray;
   import package_5.class_31;
   
   public class class_94
   {
       
      
      public function class_94()
      {
         super();
      }
      
      public static function method_382(param1:ByteArray) : ByteArray
      {
         param1.position = 0;
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeBytes(param1,3);
         return _loc2_;
      }
      
      public static function method_242(param1:String, param2:ByteArray) : ByteArray
      {
         param2.position = 0;
         var _loc3_:Array = param1.split("-");
         var _loc4_:class_31 = new class_31();
         _loc4_.method_158(param2.length + 4 + 1 + 1);
         _loc4_.method_156(_loc3_[0]);
         _loc4_.method_156(_loc3_[1]);
         _loc4_.writeBytes(param2);
         return _loc4_;
      }
   }
}
