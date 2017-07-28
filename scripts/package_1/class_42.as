package package_1
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import package_15.class_38;
   import package_2.class_46;
   import package_2.class_5;
   import package_2.class_9;
   import package_3.class_4;
   import package_7.class_41;
   
   public class class_42 extends class_41
   {
      
      public static var var_57:Boolean = false;
       
      
      private var var_113:URLLoader;
      
      public var var_114:uint;
      
      public var logappliction:class_5;
      
      private var var_115:int = 0;
      
      private var var_116:int = 0;
      
      public function class_42()
      {
         this.var_113 = new URLLoader();
         this.logappliction = new class_5();
         super();
         class_4.method_7.method_26(this);
         this.loader.gotoAndStop(1);
         retryBut.visible = false;
         class_15(class_4.method_7.method_8(class_15)).socketControl.socket.receive("2-3",this.method_193);
         this.visible = !class_42.var_57;
      }
      
      private function closeHandler(param1:MouseEvent) : void
      {
         this.parent.removeChild(this);
      }
      
      private function method_193(param1:*) : void
      {
         this.method_194();
      }
      
      public function method_194() : void
      {
         clearTimeout(this.var_114);
         this.logappliction.WriteLog2("行情板块","2-3http请求","100%倒计时结束");
      }
      
      public function method_80(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1 > this.var_116)
         {
            this.var_115 = param1;
            this.var_116 = param1;
            _loc2_ = class_46(class_4.method_7.method_76(class_46));
            if(this.var_115 == 100)
            {
               this.var_115 = 99;
            }
            this.loader.gotoAndStop(this.var_115);
            this.myPriceResult.text = this.var_115 + "%";
            if(param1 == 100)
            {
               if(!var_57)
               {
                  this.var_114 = setTimeout(this.method_195,7000);
                  this.logappliction.WriteLog2("行情板块","2-3http请求","100%倒计时开始");
               }
            }
         }
      }
      
      private function method_195() : void
      {
         var _loc1_:String = class_15(class_4.method_7.method_8(class_15)).requestid;
         var _loc2_:class_9 = class_9(class_4.method_7.method_76(class_9));
         var _loc3_:String = "http://" + _loc2_.var_11 + "/bid/query.ashx?bidnumber=" + _loc2_.uid + "&requestid=" + _loc1_;
         this.logappliction.method_25("投标板块","100%后7秒后请求出价情况",_loc3_);
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc4_.method = URLRequestMethod.GET;
         _loc4_.contentType = "application/json";
         this.var_113.load(_loc4_);
         this.var_113.addEventListener(Event.COMPLETE,this.getHttpContentHandler);
      }
      
      private function getHttpContentHandler(param1:*) : void
      {
         var _loc2_:String = String(this.var_113.data);
         class_38.parse(_loc2_,3);
         var_57 = true;
      }
   }
}
