package package_1
{
   import flash.display.Sprite;
   import flash.utils.getTimer;
   import package_13.class_27;
   import package_13.class_45;
   import package_14.class_37;
   import package_15.class_43;
   import package_17.class_80;
   import package_17.class_81;
   import package_2.class_10;
   import package_2.class_46;
   import package_2.class_5;
   import package_2.class_77;
   import package_2.class_8;
   import package_3.class_4;
   import package_5.class_40;
   
   public class class_34 extends Sprite
   {
       
      
      public var var_53:class_79;
      
      public var socketControl:class_43;
      
      public var logappliction:class_5;
      
      public var var_32:class_8;
      
      public function class_34()
      {
         this.var_53 = new class_79();
         this.logappliction = new class_5();
         this.var_32 = new class_8(Main.var_5);
         super();
         class_4.method_7.method_26(this);
         var _loc1_:class_77 = class_77(class_4.method_7.method_76(class_77));
         var _loc2_:class_10 = class_10(class_4.method_7.method_76(class_10));
         var _loc3_:class_13 = class_13(class_4.method_7.method_8(class_13));
         var _loc4_:class_27 = class_15(class_4.method_7.method_8(class_15)).socketControl.socket;
         _loc4_.receive("3-1",this.method_168);
         this.var_53.method_78(2);
         addChild(this.var_53);
         class_4.method_18.method_82(new class_80(),1000);
      }
      
      private function Reader1to1Handler(param1:class_45) : void
      {
         var _loc2_:class_40 = param1.var_56.clone();
         var _loc3_:String = _loc2_.readString();
         var _loc4_:String = this.var_32.method_31(_loc3_);
         var _loc5_:String = _loc4_;
         this.var_53.info.htmlText = class_37.info(_loc5_);
         var _loc6_:class_81 = new class_81();
         _loc6_.execute();
         class_4.method_1.method_2();
      }
      
      private function method_168(param1:class_45) : void
      {
         if(class_4.method_1.method_3)
         {
            class_44(class_4.method_7.method_8(class_44)).bidstage.ver.text = Main.clientui_version + " 帧频：" + String(this["@doswf__s"].frameRate);
         }
         Main.isReconnectBy31 = false;
         class_80.var_101 = getTimer();
         this.var_53.method_78(2);
         var _loc4_:class_40 = param1.var_56.clone();
         var _loc5_:String = _loc4_.readString();
         var _loc6_:String = this.var_32.method_45(_loc5_);
         var _loc7_:String = _loc6_;
         if(class_37.method_169(_loc7_))
         {
            this.var_53.info.htmlText = class_37.info(_loc7_);
         }
         var _loc8_:class_46 = class_46(class_4.method_7.method_76(class_46));
         if(_loc8_ != null)
         {
            if(class_42(class_4.method_7.method_8(class_42)))
            {
               class_42(class_4.method_7.method_8(class_42)).method_80(_loc8_.method_170());
            }
         }
      }
   }
}
