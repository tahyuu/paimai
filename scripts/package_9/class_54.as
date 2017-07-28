package package_9
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   class class_54 extends class_53
   {
       
      
      function class_54(param1:class_20)
      {
         super();
         var_22 = param1;
      }
      
      public function add(param1:*) : void
      {
         var _loc2_:String = getQualifiedClassName(param1).split("::").join(".");
         if(var_128[_loc2_] == null)
         {
            var_128[_loc2_] = param1;
         }
      }
      
      public function method_89(param1:*) : *
      {
         return var_128[method_219(param1)];
      }
      
      public function method_93(param1:*) : Boolean
      {
         return this.method_89(param1) != null;
      }
      
      public function method_91(param1:*) : void
      {
         delete var_128[method_219(param1)];
      }
      
      public function clear() : void
      {
         var_128 = new Dictionary();
      }
   }
}
