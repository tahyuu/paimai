package package_29
{
   import r1.deval.parser.class_112;
   
   class class_151 extends class_145
   {
       
      
      var var_440:int;
      
      function class_151(param1:class_115, param2:*, param3:int)
      {
         super(param1,param2);
         this.var_440 = param3;
      }
      
      public function method_587(param1:int) : Boolean
      {
         return param1 == this.var_440;
      }
      
      override public function getBoolean() : Boolean
      {
         return Boolean(getNumber());
      }
      
      override public function getAny() : Object
      {
         return getNumber();
      }
      
      override public function method_452() : String
      {
         return getNumber().toString();
      }
      
      override public function getNumber() : Number
      {
         var _loc1_:Number = var_435.getNumber();
         var _loc2_:int = 0;
         while(_loc2_ < var_436.length)
         {
            if(var_440 == class_112.BITAND)
            {
               _loc1_ = _loc1_ & var_436[_loc2_].getNumber();
            }
            else if(var_440 == class_112.BITOR)
            {
               _loc1_ = _loc1_ | var_436[_loc2_].getNumber();
            }
            else
            {
               _loc1_ = _loc1_ ^ var_436[_loc2_].getNumber();
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
