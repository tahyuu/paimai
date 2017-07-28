package zebra.debug
{
   import package_30.class_144;
   
   public class Debug
   {
       
      
      public function Debug()
      {
         super();
      }
      
      public static function method_446(param1:String, param2:int = 0, param3:String = "0x000000", param4:String = "0xFFFFFF") : void
      {
         var _loc5_:* = "[Tab:" + param2 + "],{" + param1 + "},{" + param3 + "},{" + param4 + "}";
      }
      
      public static function method_586(param1:*, param2:int = 0, param3:String = "0x0000FF", param4:String = "0xFFFFFF") : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         method_446(param1.toString(),param2,param3,param4);
         method_446("{",param2,param3,param4);
         var _loc5_:class_144 = new class_144(param1);
         for each(_loc6_ in _loc5_.variable.names)
         {
            method_446("  " + _loc6_ + ":" + _loc5_.variable.method_89(_loc6_),param2,param3,param4);
         }
         for each(_loc7_ in _loc5_.accessor.names)
         {
            method_446("  " + _loc7_ + ":" + _loc5_.accessor.method_89(_loc7_),param2,param3,param4);
         }
         method_446("}",param2,param3,param4);
      }
      
      public static function method_515(param1:*) : void
      {
         var _loc2_:* = undefined;
         if(!param1)
         {
            return;
         }
         for(_loc2_ in param1)
         {
         }
      }
   }
}
