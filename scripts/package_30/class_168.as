package package_30
{
   public class class_168 extends class_164
   {
       
      
      private var var_460:Vector.<class_179>;
      
      public function class_168(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super(param1,param2);
         this.var_460 = new Vector.<class_179>();
         for each(_loc3_ in var_423.factory.method)
         {
            _loc4_ = new class_179();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.declaredBy = _loc3_.@declaredBy.toString();
            _loc4_.returnType = _loc3_.@returnType.toString();
            for each(_loc5_ in _loc3_.parameter)
            {
               _loc6_ = new class_178();
               _loc6_.index = int(_loc5_.@index);
               _loc6_.type = _loc5_.@type.toString();
               _loc6_.optional = Boolean(_loc5_.@optional);
               _loc4_.var_455.push(_loc6_);
            }
            this.var_460.push(_loc4_);
            _names.push(_loc4_.key);
         }
      }
      
      public function method_644(param1:String, param2:Array = null) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_460)
         {
            if(_loc3_.key == param1)
            {
               if(_loc3_.var_455.length == 0)
               {
                  var_424[_loc3_.key]();
                  break;
               }
               var_424[_loc3_.key](param2);
               break;
            }
         }
      }
      
      public function get method_651() : Vector.<class_179>
      {
         return this.var_460;
      }
   }
}
