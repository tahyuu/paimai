package package_30
{
   public class class_127 extends class_164
   {
       
      
      private var var_459:Vector.<class_177>;
      
      public function class_127(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super(param1,param2);
         this.var_459 = new Vector.<class_177>();
         for each(_loc3_ in var_423.factory.constant)
         {
            _loc4_ = new class_177();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.value = var_424[_loc4_.key];
            _loc4_.type = _loc3_.@type.toString();
            this.var_459.push(_loc4_);
            _names.push(_loc4_.key);
         }
      }
      
      public function method_89(param1:String) : *
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_459)
         {
            if(_loc2_.key == param1)
            {
               return _loc2_.value;
            }
         }
      }
      
      public function get method_650() : Vector.<class_177>
      {
         return this.var_459;
      }
   }
}
