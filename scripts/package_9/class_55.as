package package_9
{
   import flash.utils.Dictionary;
   import package_20.class_57;
   
   class class_55
   {
       
      
      private var var_128:Dictionary;
      
      private var var_22:class_20;
      
      function class_55(param1:class_20)
      {
         this.var_128 = new Dictionary();
         super();
         this.var_22 = param1;
      }
      
      public function add(param1:*, param2:class_57) : void
      {
         if(this.var_128[param1] == null)
         {
            this.var_128[param1] = param2;
         }
      }
      
      public function method_89(param1:*) : class_57
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
