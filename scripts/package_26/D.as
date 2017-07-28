package package_26
{
   import package_29.class_116;
   import package_29.class_117;
   import package_29.class_118;
   import r1.deval.parser.class_114;
   
   public class D
   {
      
      private static var var_299:int = 512;
      
      private static var var_300:Object = {};
      
      private static var var_298:Boolean = true;
      
      public static const const_27:int = 3;
      
      public static const const_25:int = 1;
      
      public static const const_26:int = 2;
      
      public static const const_24:int = 0;
       
      
      public function D()
      {
         super();
      }
      
      public static function method_424(param1:String) : void
      {
         class_118.method_424(param1);
      }
      
      public static function method_425(param1:Function) : void
      {
         class_118.var_301 = param1;
      }
      
      public static function method_426(param1:Object) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = {};
         for each(_loc3_ in param1)
         {
            _loc4_ = param1[_loc4_];
            if(_loc4_ is class_116)
            {
               _loc2_[_loc3_] = _loc4_;
            }
         }
         return _loc2_;
      }
      
      public static function method_427(param1:Boolean = true, param2:int = -1) : void
      {
         var_298 = param1;
         if(param2 > 0)
         {
            var_299 = param2;
         }
      }
      
      public static function method_428(param1:Object, param2:String = "text", param3:int = 2048) : void
      {
         var var_302:Object = param1;
         var prop:String = param2;
         var var_303:int = param3;
         method_425(function(param1:String):void
         {
            var _loc2_:String = var_302[prop];
            if(_loc2_ == "")
            {
               _loc2_ = param1;
            }
            else
            {
               if(_loc2_.length >= var_303)
               {
                  _loc2_ = _loc2_.substring(_loc2_.length - var_303);
               }
               _loc2_ = _loc2_ + "\n" + param1;
            }
            var_302[prop] = _loc2_;
         });
      }
      
      public static function method_429(param1:String) : Object
      {
         return new class_114().method_429(param1);
      }
      
      public static function method_430(param1:Class) : void
      {
         class_118.method_430(param1);
      }
      
      public static function eval(param1:*, param2:Object = null, param3:Object = null) : Object
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null || param1 == "")
         {
            return null;
         }
         if(param1 is String)
         {
            _loc4_ = String(param1);
            if(var_298 && _loc4_.length <= var_299)
            {
               param1 = var_300[_loc4_];
               if(param1 == null)
               {
                  var_300[_loc4_] = param1 = method_429(_loc4_);
               }
            }
            else
            {
               param1 = method_429(_loc4_);
            }
         }
         if(param1 is Array)
         {
            if(param2 == null)
            {
               param2 = {};
            }
            for each(_loc5_ in param1[1])
            {
               param2[_loc5_.name] = _loc5_;
            }
            param1 = param1[0];
         }
         return class_118.method_431(param1 as class_117,param3,param2);
      }
      
      public static function importFunction(param1:String, param2:Function) : void
      {
         class_118.importFunction(param1,param2);
      }
      
      public static function method_432(param1:*, param2:Object = null, param3:Object = null) : Number
      {
         return Number(eval(param1,param2,param3));
      }
      
      public static function method_433(param1:int) : void
      {
         class_118.method_433(param1);
      }
      
      public static function method_434(param1:String) : Object
      {
         var _loc4_:* = null;
         var _loc2_:* = {};
         var _loc3_:Object = method_429(param1);
         if(_loc3_ is Array)
         {
            for each(_loc4_ in _loc3_[1])
            {
               _loc2_[_loc4_.name] = _loc4_;
            }
         }
         return _loc2_;
      }
      
      public static function method_435(param1:*, param2:Object = null, param3:Object = null) : String
      {
         return eval(param1,param2,param3) as String;
      }
      
      public static function method_436(param1:*, param2:Object = null, param3:Object = null) : Boolean
      {
         return Boolean(eval(param1,param2,param3));
      }
      
      public static function method_437(param1:*, param2:Object = null, param3:Object = null) : int
      {
         return int(eval(param1,param2,param3));
      }
      
      public static function importStaticMethods(param1:Class, param2:* = null) : void
      {
         class_118.importStaticMethods(param1,param2);
      }
   }
}
