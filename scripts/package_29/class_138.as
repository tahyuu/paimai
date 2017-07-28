package package_29
{
   public class class_138 extends class_134
   {
       
      
      var var_418:Boolean;
      
      var var_416:String;
      
      var var_414:String;
      
      var var_415:String;
      
      var var_417:class_115;
      
      public function class_138(param1:int, param2:String, param3:class_115, param4:Boolean, param5:int)
      {
         super(param5);
         this.var_416 = param2;
         this.var_417 = param3;
         this.var_418 = param4;
         this.var_414 = "_tmp_arr_" + param1;
         this.var_415 = "_tmp_idx_" + param1;
      }
      
      override public function method_567() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = undefined;
         var _loc1_:Object = var_417.getAny();
         if(var_418)
         {
            if(_loc1_ is Array)
            {
               _loc2_ = _loc1_ as Array;
            }
            else
            {
               _loc2_ = [];
               for each(_loc3_ in _loc1_)
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         else
         {
            _loc2_ = [];
            for(_loc3_ in _loc1_)
            {
               _loc2_.push(_loc3_);
            }
         }
         class_118.method_576(var_414,_loc2_);
         class_118.method_576(var_415,0);
      }
   }
}
