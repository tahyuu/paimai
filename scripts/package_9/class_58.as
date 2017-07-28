package package_9
{
   import flash.utils.Dictionary;
   
   class class_58
   {
       
      
      private var var_128:Dictionary;
      
      private var var_22:class_20;
      
      function class_58(param1:class_20)
      {
         this.var_128 = new Dictionary();
         super();
         this.var_22 = param1;
      }
      
      public function add(param1:*, param2:Object) : void
      {
         if(this.var_128[param1] == null)
         {
            this.var_128[param1] = param2;
         }
      }
      
      public function method_89(param1:*) : Object
      {
         return this.var_128[param1];
      }
      
      public function method_93(param1:*) : Boolean
      {
         return this.var_128[param1] != null;
      }
      
      public function method_91(param1:*) : void
      {
         delete this.var_128[param1];
      }
      
      public function clear() : void
      {
         this.var_128 = new Dictionary();
      }
   }
}
