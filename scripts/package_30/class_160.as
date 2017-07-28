package package_30
{
   public class class_160 extends class_164
   {
       
      
      private var var_456:Vector.<class_174>;
      
      public function class_160(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super(param1,param2);
         this.var_456 = new Vector.<class_174>();
         for each(_loc3_ in var_423.factory.accessor)
         {
            _loc4_ = new class_174();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.value = var_424[_loc4_.key];
            _loc4_.access = _loc3_.@access.toString();
            _loc4_.type = _loc3_.@type.toString();
            this.var_456.push(_loc4_);
            this._names.push(_loc4_.key);
         }
      }
      
      public function method_646(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_456)
         {
            if(_loc3_.key == param1)
            {
               var_424[_loc3_.key] = param2;
               _loc3_.value = param2;
               break;
            }
         }
      }
      
      public function method_89(param1:String) : *
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_456)
         {
            if(_loc2_.key == param1)
            {
               return _loc2_.value;
            }
         }
      }
      
      public function get method_647() : Vector.<class_174>
      {
         return this.var_456;
      }
   }
}
