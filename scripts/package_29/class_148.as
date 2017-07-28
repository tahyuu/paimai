package package_29
{
   class class_148 extends class_130
   {
       
      
      var var_439:Array;
      
      var var_438:Object;
      
      function class_148(param1:Object, param2:Array)
      {
         super();
         var_438 = param1;
         this.var_439 = param2;
      }
      
      override public function getAny() : Object
      {
         var _loc1_:* = undefined;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_438 is Array)
         {
            _loc4_ = [];
            for each(_loc1_ in var_438 as Array)
            {
               if(_loc1_ is class_115)
               {
                  _loc1_ = (_loc1_ as class_115).getAny();
               }
               _loc4_.push(_loc1_);
            }
            return _loc4_;
         }
         var _loc2_:* = {};
         for each(_loc3_ in var_439)
         {
            _loc1_ = var_438[_loc3_];
            if(_loc1_ is class_115)
            {
               _loc1_ = (_loc1_ as class_115).getAny();
            }
            _loc2_[_loc3_] = _loc1_;
         }
         return _loc2_;
      }
   }
}
