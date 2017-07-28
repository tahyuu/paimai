package package_23
{
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getQualifiedSuperclassName;
   import package_21.class_67;
   
   public class class_97
   {
      
      private static var var_290:class_97;
       
      
      private var styleToClassesHash:Object;
      
      private var classToInstancesDict:Dictionary;
      
      private var classToStylesDict:Dictionary;
      
      private var var_294:Dictionary;
      
      private var globalStyles:Object;
      
      public function class_97()
      {
         super();
         this.styleToClassesHash = {};
         this.classToInstancesDict = new Dictionary(true);
         this.classToStylesDict = new Dictionary(true);
         this.var_294 = new Dictionary(true);
         this.globalStyles = class_67.getStyleDefinition();
      }
      
      private static function method_413() : *
      {
         if(var_290 == null)
         {
            var_290 = new class_97();
         }
         return var_290;
      }
      
      public static function method_253(param1:class_67) : void
      {
         var target:Class = null;
         var var_154:Object = null;
         var var_293:Object = null;
         var n:String = null;
         var var_291:class_67 = param1;
         var var_292:class_97 = method_413();
         var var_181:Class = method_414(var_291);
         if(var_181 == null)
         {
            return;
         }
         if(var_292.classToInstancesDict[var_181] == null)
         {
            var_292.classToInstancesDict[var_181] = new Dictionary(true);
            target = var_181;
            while(var_154 == null)
            {
               if(target["getStyleDefinition"] != null)
               {
                  var_154 = target["getStyleDefinition"]();
                  break;
               }
               try
               {
                  target = var_291.loaderInfo.applicationDomain.getDefinition(getQualifiedSuperclassName(target)) as Class;
               }
               catch(err:Error)
               {
                  try
                  {
                     target = getDefinitionByName(getQualifiedSuperclassName(target)) as Class;
                  }
                  catch(e:Error)
                  {
                     var_154 = class_67.getStyleDefinition();
                     break;
                  }
                  continue;
               }
            }
            var_293 = var_292.styleToClassesHash;
            for(n in var_154)
            {
               if(var_293[n] == null)
               {
                  var_293[n] = new Dictionary(true);
               }
               var_293[n][var_181] = true;
            }
            var_292.var_294[var_181] = var_154;
            if(var_292.classToStylesDict[var_181] == null)
            {
               var_292.classToStylesDict[var_181] = {};
            }
         }
         var_292.classToInstancesDict[var_181][var_291] = true;
         method_415(var_291);
      }
      
      private static function method_415(param1:class_67) : void
      {
         var _loc5_:* = null;
         var _loc2_:class_97 = method_413();
         var _loc3_:Class = method_414(param1);
         var _loc4_:Object = _loc2_.var_294[_loc3_];
         for(_loc5_ in _loc4_)
         {
            param1.method_269(_loc5_,method_416(param1,_loc5_));
         }
      }
      
      private static function method_416(param1:class_67, param2:String) : Object
      {
         var _loc3_:Class = method_414(param1);
         var _loc4_:class_97 = method_413();
         var _loc5_:Object = _loc4_.classToStylesDict[_loc3_][param2];
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         _loc5_ = _loc4_.globalStyles[param2];
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         return _loc4_.var_294[_loc3_][param2];
      }
      
      public static function method_417(param1:Object, param2:String) : Object
      {
         var _loc3_:Class = method_414(param1);
         var _loc4_:Object = method_413().classToStylesDict[_loc3_];
         return _loc4_ == null?null:_loc4_[param2];
      }
      
      public static function method_418(param1:Object, param2:String) : void
      {
         var _loc3_:Class = method_414(param1);
         var _loc4_:Object = method_413().classToStylesDict[_loc3_];
         if(_loc4_ != null && _loc4_[param2] != null)
         {
            delete _loc4_[param2];
            method_419(_loc3_,param2);
         }
      }
      
      public static function method_420(param1:Object, param2:String, param3:Object) : void
      {
         var _loc4_:Class = method_414(param1);
         var _loc5_:Object = method_413().classToStylesDict[_loc4_];
         if(_loc5_ == null)
         {
            _loc5_ = method_413().classToStylesDict[_loc4_] = {};
         }
         if(_loc5_ == param3)
         {
            return;
         }
         _loc5_[param2] = param3;
         method_419(_loc4_,param2);
      }
      
      private static function method_414(param1:Object) : Class
      {
         var var_295:Object = param1;
         if(var_295 is Class)
         {
            return var_295 as Class;
         }
         try
         {
            return getDefinitionByName(getQualifiedClassName(var_295)) as Class;
         }
         catch(e:Error)
         {
            if(var_295 is class_67)
            {
               try
               {
                  return var_295.loaderInfo.applicationDomain.getDefinition(getQualifiedClassName(var_295)) as Class;
               }
               catch(e:Error)
               {
               }
            }
         }
         return null;
      }
      
      private static function method_421(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:Dictionary = method_413().styleToClassesHash[param1];
         if(_loc2_ == null)
         {
            return;
         }
         for(_loc3_ in _loc2_)
         {
            method_419(Class(_loc3_),param1);
         }
      }
      
      private static function method_419(param1:Class, param2:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Dictionary = method_413().classToInstancesDict[param1];
         if(_loc3_ == null)
         {
            return;
         }
         for(_loc4_ in _loc3_)
         {
            _loc5_ = _loc4_ as class_67;
            if(_loc5_ != null)
            {
               _loc5_.method_269(param2,method_416(_loc5_,param2));
            }
         }
      }
      
      public static function method_260(param1:String, param2:Object) : void
      {
         var _loc3_:Object = method_413().globalStyles;
         if(_loc3_[param1] === param2 && !(param2 is TextFormat))
         {
            return;
         }
         _loc3_[param1] = param2;
         method_421(param1);
      }
      
      public static function method_261(param1:String) : void
      {
         method_260(param1,null);
      }
      
      public static function method_262(param1:String) : Object
      {
         return method_413().globalStyles[param1];
      }
   }
}
