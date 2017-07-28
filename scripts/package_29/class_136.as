package package_29
{
   public class class_136 extends class_130
   {
       
      
      private var var_413:class_138;
      
      public function class_136(param1:class_138)
      {
         super();
         this.var_413 = param1;
      }
      
      override public function getBoolean() : Boolean
      {
         var _loc1_:Array = class_118.method_568(var_413.var_414) as Array;
         var _loc2_:int = class_118.method_568(var_413.var_415) as int;
         if(_loc2_ >= _loc1_.length)
         {
            return false;
         }
         class_118.method_576(var_413.var_416,_loc1_[_loc2_]);
         class_118.method_576(var_413.var_415,_loc2_ + 1);
         return true;
      }
   }
}
