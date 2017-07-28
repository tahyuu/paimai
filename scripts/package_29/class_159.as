package package_29
{
   class class_159 implements class_115
   {
       
      
      private var var_447:class_115;
      
      private var cond:class_115;
      
      private var var_448:class_115;
      
      function class_159(param1:class_115, param2:class_115, param3:class_115)
      {
         super();
         this.cond = param1;
         this.var_447 = param2;
         this.var_448 = param3;
      }
      
      public function getNumber() : Number
      {
         return !!cond.getBoolean()?Number(var_447.getNumber()):Number(var_448.getNumber());
      }
      
      public function method_452() : String
      {
         return !!cond.getBoolean()?var_447.method_452():var_448.method_452();
      }
      
      public function getBoolean() : Boolean
      {
         return !!cond.getBoolean()?Boolean(var_447.getBoolean()):Boolean(var_448.getBoolean());
      }
      
      public function getAny() : Object
      {
         return !!cond.getBoolean()?var_447.getAny():var_448.getAny();
      }
   }
}
