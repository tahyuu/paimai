package package_30
{
   public class class_166 extends class_164
   {
       
      
      private var var_457:Vector.<class_175>;
      
      public function class_166(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super(param1,param2);
         this.var_457 = new Vector.<class_175>();
         for each(_loc3_ in var_423.factory.variable)
         {
            _loc4_ = new class_175();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.value = var_424[_loc4_.key];
            _loc4_.type = _loc3_.@type.toString();
            this.var_457.push(_loc4_);
            _names.push(_loc4_.key);
         }
      }
      
      public function get method_648() : Vector.<class_175>
      {
         return this.var_457;
      }
      
      public function method_646(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_457)
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
         for each(_loc2_ in this.var_457)
         {
            if(_loc2_.key == param1)
            {
               return _loc2_.value;
            }
         }
      }
   }
}
