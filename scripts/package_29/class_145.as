package package_29
{
   class class_145 implements class_115
   {
       
      
      var var_435:class_115;
      
      var var_436:Array;
      
      function class_145(param1:class_115, param2:*)
      {
         super();
         this.var_435 = param1;
         this.var_436 = param2 is Array?param2 as Array:[param2];
      }
      
      public function getNumber() : Number
      {
         throw new Error("UNIMPLEMENTED");
      }
      
      public function method_452() : String
      {
         throw new Error("UNIMPLEMENTED");
      }
      
      public function addOperand(param1:*, param2:* = null) : void
      {
         var _loc3_:* = null;
         if(param1 is class_115)
         {
            var_436.push(param1);
         }
         else if(param1 is Array)
         {
            for each(_loc3_ in param1 as Array)
            {
               var_436.push(_loc3_);
            }
         }
      }
      
      public function getBoolean() : Boolean
      {
         throw new Error("UNIMPLEMENTED");
      }
      
      public function getAny() : Object
      {
         throw new Error("UNIMPLEMENTED");
      }
   }
}
