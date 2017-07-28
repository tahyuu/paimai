package package_17
{
   import flash.utils.getTimer;
   import package_1.class_15;
   import package_1.class_44;
   import package_1.class_79;
   import package_14.class_37;
   import package_16.class_48;
   import package_2.class_5;
   import package_20.class_57;
   import package_3.class_4;
   import package_9.class_102;
   
   public class class_80 extends class_48
   {
      
      public static var var_101:int;
      
      public static var var_237:Boolean = false;
       
      
      public var logappliction:class_5;
      
      public function class_80()
      {
         this.logappliction = new class_5();
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.execute();
         var_237 = false;
         if(getTimer() - var_101 > 10000)
         {
            _loc1_ = class_79(class_4.method_7.method_8(class_79));
            _loc2_ = class_15(class_4.method_7.method_8(class_15)).var_51;
            _loc3_ = class_15(class_4.method_7.method_8(class_15));
            var_101 = getTimer();
            _loc1_.method_78(1);
            if(!Main.isReconnectBy31)
            {
               Main.isReconnectBy31 = true;
               _loc3_.reconnect();
            }
         }
      }
      
      private function method_341(param1:class_57) : *
      {
         var_237 = true;
         var _loc2_:class_79 = class_79(class_4.method_7.method_8(class_79));
         _loc2_.info.htmlText = class_37.info(param1.content,true);
         class_102.method_84(param1.key,this.method_341);
      }
   }
}
