package package_30
{
   public class class_167 extends class_164
   {
       
      
      private var var_458:Vector.<class_176>;
      
      public function class_167(param1:*, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         super(param1,param2);
         this.var_458 = new Vector.<class_176>();
         for each(_loc3_ in var_423.accessor)
         {
            _loc4_ = new class_176();
            _loc4_.key = _loc3_.@name.toString();
            _loc4_.value = this._class[_loc4_.key];
            _loc4_.access = _loc3_.@access.toString();
            _loc4_.type = _loc3_.@type.toString();
            this.var_458.push(_loc4_);
            _names.push(_loc4_.key);
         }
      }
      
      public function method_646(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in this.var_458)
         {
            if(_loc3_.key == param1)
            {
               this._class[_loc3_.key] = param2;
               _loc3_.value = param2;
               break;
            }
         }
      }
      
      public function method_89(param1:String) : *
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_458)
         {
            if(_loc2_.key == param1)
            {
               return _loc2_.value;
            }
         }
      }
      
      public function get method_649() : Vector.<class_176>
      {
         return this.var_458;
      }
   }
}
