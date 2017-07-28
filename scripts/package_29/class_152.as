package package_29
{
   class class_152 extends class_145
   {
       
      
      private var var_440:Boolean;
      
      private var var_441:Boolean;
      
      private var var_442:Boolean;
      
      function class_152(param1:class_115, param2:*, param3:Boolean, param4:Boolean, param5:Boolean)
      {
         super(param1,param2);
         this.var_440 = param3;
         this.var_441 = param4;
         this.var_442 = param5;
      }
      
      override public function method_452() : String
      {
         return getBoolean().toString();
      }
      
      override public function getBoolean() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = var_436.length;
         var _loc4_:Boolean = var_435.getBoolean();
         if(var_442)
         {
            _loc5_ = !!_loc4_?1:0;
            _loc6_ = !!_loc4_?0:1;
            _loc1_ = 0;
            while(_loc1_ < _loc3_)
            {
               if(class_115(var_436[_loc1_]).getBoolean())
               {
                  _loc5_++;
               }
               else
               {
                  _loc6_++;
               }
               _loc1_++;
            }
            return _loc5_ != ++_loc3_ && _loc6_ != _loc3_;
         }
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _loc2_ = class_115(var_436[_loc1_]).getBoolean();
            if(var_442)
            {
               _loc5_ = _loc5_ + (!!_loc2_?1:0);
            }
            else if(var_440)
            {
               _loc4_ = _loc4_ && _loc2_;
            }
            else
            {
               _loc4_ = _loc4_ || _loc2_;
            }
            _loc1_++;
         }
         return !!var_441?!_loc4_:Boolean(_loc4_);
      }
      
      override public function getAny() : Object
      {
         return getBoolean();
      }
      
      public function method_587(param1:Boolean, param2:Boolean, param3:Boolean) : Boolean
      {
         if(param3)
         {
            return this.var_442;
         }
         return param1 == this.var_440 && param2 == this.var_441;
      }
      
      override public function getNumber() : Number
      {
         return Number(getBoolean());
      }
   }
}
