package package_29
{
   class class_161 extends class_160
   {
       
      
      var var_446:class_115;
      
      var var_452:int;
      
      var var_451:Boolean;
      
      function class_161(param1:class_115, param2:*, param3:class_115, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param2);
         this.var_451 = param4;
         this.var_446 = param3;
         this.var_452 = 0;
         if(param5)
         {
            var_452 = var_452 | 2;
         }
         if(param6)
         {
            var_452 = var_452 | 1;
         }
      }
      
      override public function method_590(param1:Object) : void
      {
         var _loc2_:Object = method_640();
         if(var_446 != null)
         {
            _loc2_ = new QName(var_446.getAny(),_loc2_);
         }
         var _loc3_:Object = var_302.getAny();
         switch(var_452)
         {
            case 0:
               _loc3_[_loc2_] = param1;
               break;
            case 2:
               _loc3_[_loc2_] = param1;
               break;
            default:
               throw new class_141("msg.unknown.xml.operator");
         }
      }
      
      override public function getAny() : Object
      {
         var _loc1_:* = null;
         if(var_451)
         {
            return method_642();
         }
         var _loc2_:Object = method_640();
         if(var_446 != null)
         {
            _loc2_ = new QName(var_446.getAny(),_loc2_);
         }
         if(var_302 == null)
         {
            _loc1_ = class_118.method_581();
            switch(var_452)
            {
               case 0:
                  return _loc1_[_loc2_];
               case 1:
                  return _loc1_.descendants(_loc2_);
               case 2:
                  return _loc1_[_loc2_];
               case 3:
                  return _loc1_..[_loc2_];
            }
         }
         else
         {
            _loc1_ = var_302.getAny();
            switch(var_452)
            {
               case 0:
                  return _loc1_[_loc2_];
               case 1:
                  return _loc1_.descendants(_loc2_);
               case 2:
                  return _loc1_[_loc2_];
               case 3:
                  return _loc1_..[_loc2_];
            }
         }
         throw new class_141("msg.unknown.xml.operator");
      }
      
      private function method_642() : Object
      {
         var _loc2_:* = null;
         var _loc3_:* = undefined;
         var _loc1_:Object = var_302.getAny();
         if(_loc1_ is XML)
         {
            class_118.method_558(_loc1_);
            if(!method_641())
            {
               return new XMLList("");
            }
            class_118.method_561();
         }
         else
         {
            _loc2_ = <root/>;
            for each(_loc3_ in _loc1_ as XMLList)
            {
               class_118.method_558(_loc3_);
               if(method_641())
               {
                  _loc2_.appendChild(_loc3_);
               }
               class_118.method_561();
            }
            _loc1_ = _loc2_.children();
         }
         return _loc1_;
      }
   }
}
