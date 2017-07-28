package package_1
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.text.TextField;
   import package_15.class_38;
   import package_2.class_5;
   import package_2.class_7;
   import package_2.class_8;
   import package_2.class_9;
   import package_20.class_57;
   import package_3.class_4;
   import package_7.class_86;
   import package_9.class_102;
   
   public class class_87 extends class_86
   {
       
      
      private var imageurl:String;
      
      private var var_249:String;
      
      public var logappliction:class_5;
      
      private var var_248:class_8;
      
      public function class_87()
      {
         this.logappliction = new class_5();
         this.var_248 = new class_8(Main.var_5);
         super();
         yzcode.restrict = "0-9";
         cancelBut.addEventListener(MouseEvent.CLICK,this.method_355);
         okBut.addEventListener(MouseEvent.CLICK,this.method_343);
         addEventListener(Event.ADDED_TO_STAGE,this.method_345);
      }
      
      private function method_345(param1:Event) : void
      {
         var var_95:class_9 = null;
         var var_96:String = null;
         var loader:URLLoader = null;
         var name_7:URLRequest = null;
         var e:Event = param1;
         this["@doswf__s"].focus = yzcode;
         this.logappliction.WriteLog2("投标板块","http查询最新出价情况","");
         var bidcode:Number = class_44(class_4.method_7.method_8(class_44)).bidcode;
         if(bidcode == 3)
         {
            class_13.method_12(new class_36(7));
         }
         else if(bidcode == 4)
         {
            class_13.method_12(new class_36(10));
         }
         else if(bidcode == 5)
         {
            class_13.method_12(new class_36(11));
         }
         else if(bidcode == 6)
         {
            class_13.method_12(new class_36(12));
         }
         else
         {
            var_95 = class_9(class_4.method_7.method_76(class_9));
            var_96 = "http://" + var_95.var_11 + "/webwcf/BidCmd.svc/WebCmd?p=" + Math.random();
            loader = new URLLoader();
            name_7 = new URLRequest(var_96);
            name_7.method = URLRequestMethod.POST;
            name_7.data = class_7(class_4.method_7.method_76(class_7)).method_37();
            name_7.contentType = "application/json";
            loader.addEventListener(Event.COMPLETE,function getHttpContentHandler(param1:Event):void
            {
               var _loc9_:int = 0;
               var _loc10_:int = 0;
               var _loc2_:String = String(loader.data);
               if(_loc2_.indexOf("</string") == -1)
               {
                  _loc2_ = _loc2_.split("\\\"").join("\"");
                  _loc2_ = _loc2_.substr(1,_loc2_.length - 2);
               }
               else
               {
                  _loc9_ = _loc2_.indexOf("/\">");
                  _loc10_ = _loc2_.indexOf("</string>");
                  _loc2_ = _loc2_.substring(_loc9_ + 3,_loc10_);
               }
               var _loc3_:String = _loc2_.split("\\/").join("/");
               var _loc4_:String = _loc3_;
               var _loc5_:Object = JSON.parse(_loc4_);
               var _loc6_:String = _loc5_.response.data;
               var _loc7_:Array = new Array();
               _loc7_ = _loc6_.split(",",_loc6_.length);
               var _loc8_:String = _loc7_[1];
               var_249 = _loc7_[0];
               method_356(_loc8_);
               logappliction.method_25("投标板块","请求最新出价情况校验码",_loc8_);
            });
            loader.load(name_7);
         }
      }
      
      private function method_356(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 != null)
         {
            param1 = " <img src=\'" + param1 + "\' id=\'image2\'>";
            _loc2_ = new TextField();
            _loc2_.htmlText = param1;
            addChild(_loc2_);
            _loc3_ = _loc2_.getImageReference("image2");
            _loc3_.x = 310;
            _loc3_.y = 200;
            addChild(_loc3_);
         }
         else
         {
            this.method_355(null);
         }
      }
      
      private function method_343(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(yzcode.text.length == 0)
         {
            _loc2_ = new class_36(4);
            class_13.method_12(_loc2_);
         }
         else
         {
            this.method_357();
         }
         this.method_355(param1);
      }
      
      private function method_355(param1:MouseEvent) : void
      {
         try
         {
            this.parent.removeChild(this);
            return;
         }
         catch(e:*)
         {
            return;
         }
      }
      
      private function method_358(param1:class_57) : void
      {
         param1.content.x = 310;
         param1.content.y = 200;
         addChild(param1.content);
         class_102.method_84(param1.key,this.method_358);
      }
      
      private function method_357() : void
      {
         var loader:URLLoader = null;
         var var_95:class_9 = class_9(class_4.method_7.method_76(class_9));
         var var_96:String = "http://" + var_95.var_11 + "/webwcf/BidCmd.svc/WebCmd?p=" + Math.random();
         this.logappliction.method_25("投标板块","请求最新出价情况",var_96);
         loader = new URLLoader();
         var name_7:URLRequest = new URLRequest(var_96);
         name_7.method = URLRequestMethod.POST;
         name_7.data = class_7(class_4.method_7.method_76(class_7)).method_38(yzcode.text,this.var_249);
         name_7.contentType = "application/json";
         loader.load(name_7);
         loader.addEventListener(Event.COMPLETE,function getHttpContentHandler(param1:Event):void
         {
            var _loc5_:int = 0;
            var _loc6_:int = 0;
            var _loc2_:String = String(loader.data);
            if(_loc2_.indexOf("</string") == -1)
            {
               _loc2_ = _loc2_.split("\\\"").join("\"");
               _loc2_ = _loc2_.substr(1,_loc2_.length - 2);
            }
            else
            {
               _loc5_ = _loc2_.indexOf("/\">");
               _loc6_ = _loc2_.indexOf("</string>");
               _loc2_ = _loc2_.substring(_loc5_ + 3,_loc6_);
            }
            var _loc3_:String = _loc2_.split("\\/").join("/");
            var _loc4_:String = _loc3_;
            logappliction.method_24("投标板块","接收最新出价情况",_loc4_);
            class_38.parse(_loc4_,1);
         });
      }
   }
}
