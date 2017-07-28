package package_29
{
   import r1.deval.parser.class_112;
   
   class class_149 extends class_146
   {
       
      
      function class_149(param1:class_115, param2:Array, param3:Array)
      {
         super(param1,param2,param3);
      }
      
      override public function getNumber() : Number
      {
         var _loc3_:Number = NaN;
         var _loc1_:Number = var_435.getNumber();
         var _loc2_:int = 0;
         while(_loc2_ < var_436.length)
         {
            _loc3_ = (var_436[_loc2_] as class_115).getNumber();
            switch(var_437[_loc2_])
            {
               case class_112.MUL:
                  _loc1_ = _loc1_ * _loc3_;
                  break;
               case class_112.DIV:
                  _loc1_ = _loc1_ / _loc3_;
                  break;
               case class_112.MOD:
                  _loc1_ = _loc1_ % _loc3_;
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
