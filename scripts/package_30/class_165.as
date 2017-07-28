package package_30
{
   public class class_165 extends class_164
   {
       
      
      private var var_454:Vector.<class_172>;
      
      public function class_165(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super(param1,param2);
         this.var_454 = new Vector.<class_172>();
         for each(_loc3_ in var_423.method)
         {
            _loc4_ = new class_172();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.declaredBy = _loc3_.@declaredBy.toString();
            _loc4_.returnType = _loc3_.@returnType.toString();
            for each(_loc5_ in _loc3_.parameter)
            {
               _loc6_ = new class_173();
               _loc6_.index = int(_loc5_.@index);
               _loc6_.type = _loc5_.@type.toString();
               _loc6_.optional = Boolean(_loc5_.@optional);
               _loc4_.var_455.push(_loc6_);
            }
            this.var_454.push(_loc4_);
            _names.push(_loc4_.key);
         }
      }
      
      public function method_644(param1:String, param2:Array = null) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_454)
         {
            if(_loc3_.key == param1)
            {
               if(_loc3_.var_455.length == 0)
               {
                  this._class[_loc3_.key]();
                  break;
               }
               this._class[_loc3_.key](param2);
               break;
            }
         }
      }
      
      public function get method_645() : Vector.<class_172>
      {
         return this.var_454;
      }
   }
}
