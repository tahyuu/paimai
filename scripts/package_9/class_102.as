package package_9
{
   import flash.system.LoaderContext;
   import package_20.class_109;
   import package_20.class_111;
   import package_20.class_57;
   import package_3.class_4;
   
   public class class_102
   {
      
      public static const name_5:String = "GameAssetChannel";
      
      private static var var_297:LoaderContext;
       
      
      public function class_102()
      {
         super();
      }
      
      public static function get method_422() : LoaderContext
      {
         if(var_297 == null)
         {
            var_297 = new LoaderContext(false,class_4.method_15);
         }
         return var_297;
      }
      
      public static function receive(param1:String, param2:*) : void
      {
         class_4.method_17.receive(param1,param2,name_5);
      }
      
      public static function method_84(param1:String, param2:*) : void
      {
         class_4.method_17.method_84(param1,param2,name_5);
      }
      
      public static function load(param1:String, param2:String = "auto", param3:Boolean = false, param4:Object = null) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param2 == "auto")
         {
            param2 = method_423(param1);
         }
         if(!param3)
         {
            _loc5_ = new class_109(param2,param3);
            _loc5_.load(param1,param4);
         }
         else
         {
            _loc6_ = class_4.method_7.method_102(param1);
            if(_loc6_ != null)
            {
               new class_110(_loc6_);
            }
            else
            {
               _loc5_ = new class_109(param2,param3);
               _loc5_.load(param1,param4);
            }
         }
      }
      
      private static function method_423(param1:String) : String
      {
         var _loc2_:String = "";
         if(param1.indexOf(".xml") != -1)
         {
            _loc2_ = class_111.TEXT;
         }
         if(param1.indexOf(".swf") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".jpg") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".png") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".gif") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(_loc2_ == "")
         {
            _loc2_ = class_111.TEXT;
         }
         return _loc2_;
      }
   }
}
