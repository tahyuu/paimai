package package_9
{
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   class class_56 extends class_53
   {
       
      
      function class_56(param1:class_20)
      {
         super();
         var_22 = param1;
      }
      
      public function add(param1:*) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = getQualifiedClassName(param1).split("::").join(".");
         if(var_128[_loc2_] == null)
         {
            _loc3_ = getDefinitionByName(_loc2_) as Class;
            var_128[_loc2_] = new _loc3_();
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
