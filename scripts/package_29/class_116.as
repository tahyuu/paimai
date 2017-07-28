package package_29
{
   public class class_116 implements class_115
   {
       
      
      private var var_346:class_117;
      
      private var var_345:Array;
      
      public var name:String;
      
      private var var_347:class_140;
      
      public function class_116(param1:String, param2:Array, param3:class_117, param4:class_140)
      {
         super();
         this.name = param1 == null?"_anonymous_":param1;
         this.var_345 = param2;
         this.var_346 = param3;
         this.var_347 = param4;
      }
      
      public function method_549() : void
      {
         if(var_346 != null)
         {
            var_346.method_549();
         }
      }
      
      public function method_452() : String
      {
         throw new class_141("msg.rt.eval.function.to.value");
      }
      
      public function getBoolean() : Boolean
      {
         throw new class_141("msg.rt.eval.function.to.value");
      }
      
      public function method_431(param1:Array) : Object
      {
         var var_350:Array = param1;
         var var_352:int = var_345 == null?0:int(var_345.length);
         var var_349:int = var_350 == null?0:int(var_350.length);
         if(var_349 > var_352)
         {
            var_349 = var_352;
         }
         var var_351:Object = {};
         var var_348:int = 0;
         while(var_348 < var_349)
         {
            var_351[var_345[var_348]] = var_350[var_348];
            var_348++;
         }
         class_118.method_558(var_351);
         class_118.method_559(null);
         var_346.method_431(var_347);
         var _loc3_:* = class_118.method_560();
         class_118.method_561();
         switch(0)
         {
            case 0:
               throw _loc3_;
            case 1:
               throw undefined;
         }
      }
      
      public function method_515(param1:Object) : void
      {
         var _loc2_:* = "\n<Function name=\"" + name + "\" params=\"";
         var _loc3_:int = var_345 == null?0:int(var_345.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc4_ > 0)
            {
               _loc2_ = _loc2_ + ",";
            }
            _loc2_ = _loc2_ + var_345[_loc4_];
            _loc4_++;
         }
         trace(_loc2_ + "\">");
         var_346.method_515(param1,1);
         trace("\n</Function>");
      }
      
      public function getAny() : Object
      {
         return this;
      }
      
      public function getNumber() : Number
      {
         throw new class_141("msg.rt.eval.function.to.value");
      }
   }
}
