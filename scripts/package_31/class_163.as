package package_31
{
   import flash.utils.ByteArray;
   
   public class class_163
   {
       
      
      private var var_453:ByteArray;
      
      public function class_163(param1:String = null)
      {
         super();
         var_453 = new ByteArray();
         if(param1 != null)
         {
            method_618(param1);
         }
      }
      
      public function substr(param1:int = 0, param2:int = 2147483647) : String
      {
         return toString().substr(param1,param2);
      }
      
      public function method_618(param1:*) : class_163
      {
         if(param1 != null)
         {
            var_453.writeUTFBytes(param1.toString());
         }
         return this;
      }
      
      public function get length() : int
      {
         return var_453.length;
      }
      
      public function substring(param1:int = 0, param2:int = 2147483647) : String
      {
         return toString().substring(param1,param2);
      }
      
      public function toString() : String
      {
         var_453.position = 0;
         return var_453.readUTFBytes(var_453.bytesAvailable);
      }
      
      public function clear() : void
      {
         var_453.length = 0;
      }
      
      public function method_643(param1:* = null) : void
      {
         if(param1 != null)
         {
            method_618(param1);
         }
         method_618("\n");
      }
   }
}
