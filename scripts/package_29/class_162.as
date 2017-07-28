package package_29
{
   class class_162 extends class_146
   {
       
      
      function class_162(param1:class_115, param2:Array, param3:Array)
      {
         super(param1,param2,param3);
      }
      
      override public function getNumber() : Number
      {
         return Number(getAny());
      }
      
      override public function method_452() : String
      {
         return getAny().toString();
      }
      
      override public function getBoolean() : Boolean
      {
         return Boolean(getAny());
      }
      
      override public function getAny() : Object
      {
         var _loc3_:* = NaN;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc1_:Boolean = true;
         var _loc2_:int = var_437.length - 1;
         while(_loc2_ >= 0)
         {
            if(!var_437[_loc2_])
            {
               _loc1_ = false;
               break;
            }
            _loc2_--;
         }
         if(_loc1_)
         {
            _loc4_ = var_435.getAny();
            _loc5_ = _loc4_ is Number?1:0;
            _loc6_ = _loc4_ is XML?1:0;
            _loc7_ = [_loc4_];
            _loc2_ = 0;
            while(_loc2_ < var_436.length)
            {
               _loc4_ = (var_436[_loc2_] as class_115).getAny();
               if(_loc4_ is Number)
               {
                  _loc5_++;
               }
               else if(_loc4_ is XML || _loc4_ is XMLList)
               {
                  _loc6_++;
               }
               _loc7_.push(_loc4_);
               _loc2_++;
            }
            if(_loc6_ == var_436.length + 1)
            {
               _loc9_ = new XMLList("");
               for each(_loc4_ in _loc7_)
               {
                  _loc9_ = _loc9_ + _loc4_;
               }
               return _loc9_;
            }
            if(_loc5_ == var_436.length + 1)
            {
               _loc3_ = 0;
               for each(_loc4_ in _loc7_)
               {
                  _loc3_ = Number(_loc3_ + Number(_loc4_));
               }
               return _loc3_;
            }
            _loc8_ = "";
            for each(_loc4_ in _loc7_)
            {
               _loc8_ = _loc8_ + _loc4_;
            }
            return _loc8_;
         }
         _loc3_ = Number(var_435.getNumber());
         _loc2_ = 0;
         while(_loc2_ < var_436.length)
         {
            if(var_437[_loc2_])
            {
               _loc3_ = Number(_loc3_ + var_436[_loc2_].getNumber());
            }
            else
            {
               _loc3_ = Number(_loc3_ - var_436[_loc2_].getNumber());
            }
            _loc2_++;
         }
         return _loc3_;
      }
   }
}
