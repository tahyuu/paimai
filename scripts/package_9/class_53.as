package package_9
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   class class_53
   {
       
      
      protected var var_128:Dictionary;
      
      protected var var_22:class_20;
      
      function class_53()
      {
         this.var_128 = new Dictionary();
         super();
      }
      
      protected function method_219(param1:*) : String
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = getQualifiedClassName(param1).split("::").join(".");
         }
         else
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
   }
}
