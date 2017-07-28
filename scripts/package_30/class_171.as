package package_30
{
   import flash.utils.Dictionary;
   
   class class_171
   {
      
      private static var var_463:Dictionary = new Dictionary();
       
      
      function class_171()
      {
         super();
      }
      
      public static function add(param1:String, param2:XML) : void
      {
         if(var_463[param1] == null)
         {
            var_463[param1] = param2;
         }
      }
      
      public static function method_624(param1:String) : Boolean
      {
         return var_463[param1] != null;
      }
      
      public static function method_89(param1:String) : XML
      {
         return XML(var_463[param1]);
      }
   }
}
