package package_1
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.ui.Mouse;
   import flash.utils.setTimeout;
   import package_13.class_27;
   import package_13.class_45;
   import package_14.class_30;
   import package_15.class_38;
   import package_2.class_5;
   import package_2.class_7;
   import package_2.class_8;
   import package_2.class_9;
   import package_20.class_57;
   import package_26.D;
   import package_3.class_4;
   import package_5.class_31;
   import package_5.class_40;
   import package_7.class_83;
   import package_9.class_102;
   
   public class class_84 extends class_83
   {
       
      
      public var var_240:Boolean = false;
      
      private var var_239:int = 0;
      
      private var var_241:String;
      
      public var otTimer:uint;
      
      public var priceCode:String;
      
      private var var_238:URLLoader;
      
      public var var_32:class_8;
      
      public var logappliction:class_5;
      
      private var c:DisplayObject;
      
      private var thisWinClose:Boolean = false;
      
      public var var_4:String;
      
      private var imageurl:String;
      
      public function class_84(param1:int)
      {
         this.var_238 = new URLLoader();
         this.var_32 = new class_8(Main.var_5);
         this.logappliction = new class_5();
         this.var_4 = class_30.method_29(Main.var_4);
         super();
         this.imageurl = "";
         this.thisWinClose = false;
         yzcode.restrict = "0-9";
         this.var_239 = param1;
         this.mypricetxt.text = "您的出价为: " + param1 + "元";
         cancelBut.addEventListener(MouseEvent.CLICK,this.closeHandler);
         okBut.addEventListener(MouseEvent.CLICK,this.method_343);
         setTimeout(this.method_344,3000);
         addEventListener(Event.ADDED_TO_STAGE,this.method_345);
         addEventListener(IOErrorEvent.IO_ERROR,this.ioerrorhandler);
         class_15(class_4.method_7.method_8(class_15)).socketControl.socket.receive("2-2",this.method_346);
      }
      
      private function ioerrorhandler(param1:IOErrorEvent) : void
      {
      }
      
      private function method_344() : void
      {
         var var_242:Sprite = null;
         var var_243:int = 0;
         if(this.imageurl != null)
         {
            var_242 = this.method_347();
            addChild(var_242);
            var_243 = this.numChildren - 3;
            this.setChildIndex(var_242,var_243);
            var_242.buttonMode = true;
            var_242.addEventListener(MouseEvent.CLICK,this.method_348);
         }
         else
         {
            setTimeout(function():*
            {
               if(!thisWinClose)
               {
                  class_13.method_62();
               }
            },7000);
         }
      }
      
      private function method_347() : Sprite
      {
         var var_246:Function = null;
         var var_247:Function = null;
         var_246 = function(param1:MouseEvent):*
         {
            Mouse.cursor = "button";
         };
         var_247 = function(param1:MouseEvent):*
         {
            Mouse.cursor = "auto";
         };
         var var_244:Sprite = new Sprite();
         var background:Shape = this.method_349(2589655);
         var var_192:TextField = new TextField();
         var_192.text = "刷新校验码";
         var_192.x = 96;
         var_192.y = 249;
         var_192.textColor = 16777215;
         var var_245:TextFormat = new TextFormat();
         var_245.size = 23;
         var_192.defaultTextFormat = var_245;
         var_192.height = 20;
         var_192.width = 67;
         var_192.selectable = false;
         var_192.addEventListener(MouseEvent.MOUSE_OVER,var_246);
         var_192.addEventListener(MouseEvent.MOUSE_OUT,var_247);
         var_244.addChild(background);
         var_244.addChild(var_192);
         return var_244;
      }
      
      private function method_349(param1:uint) : Shape
      {
         var _loc2_:Shape = new Shape();
         _loc2_.graphics.lineStyle(1,2779313);
         _loc2_.graphics.beginFill(param1);
         _loc2_.graphics.drawRoundRect(72,247,110,25,7);
         _loc2_.graphics.endFill();
         return _loc2_;
      }
      
      private function method_348(param1:MouseEvent) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:* = null;
         if(this.imageurl != null)
         {
            _loc2_ = this.imageurl + "&random=" + Math.random();
            _loc3_ = new TextField();
            _loc3_.htmlText = " <img src=\'" + _loc2_ + "\' id=\'image\'>";
            addChild(_loc3_);
            this.c = _loc3_.getImageReference("image");
            this.c.x = 70;
            this.c.y = 243;
            addChild(this.c);
         }
      }
      
      private function method_350() : void
      {
         var _loc1_:Number = int((Math.random() * 39 + 293) * 100) / 100;
         cancelBut.y = _loc1_;
         okBut.y = _loc1_;
      }
      
      private function method_346(param1:*) : void
      {
         this.method_194();
      }
      
      private function method_343(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         this.thisWinClose = true;
         if(param1.target.name == "okBut")
         {
            class_42.var_57 = false;
            if(yzcode.text.length == 0)
            {
               class_13.method_12(new class_36(4));
            }
            else if(yzcode.text == " ")
            {
               class_13.method_12(new class_36(4));
            }
            else
            {
               class_13.method_12(new class_36(6,false));
               _loc2_ = class_7(class_4.method_7.method_76(class_7));
               class_15(class_4.method_7.method_8(class_15)).socketControl.socket.send("2-2",_loc2_.method_35(String(this.var_239),yzcode.text,this.priceCode));
            }
         }
         this.closeHandler(param1);
      }
      
      private function method_351() : void
      {
         var _loc1_:String = class_7(class_4.method_7.method_8(class_7)).var_33;
         var _loc2_:class_9 = class_9(class_4.method_7.method_76(class_9));
         var _loc3_:String = "http://" + _loc2_.var_11 + "/bid/query.ashx?bidnumber=" + _loc2_.uid + "&requestid=" + _loc1_;
         var _loc4_:URLRequest = new URLRequest(_loc3_);
         _loc4_.method = URLRequestMethod.GET;
         _loc4_.contentType = "application/json";
         this.var_238.load(_loc4_);
         this.logappliction.method_25("投标板块","2-2发出15秒后请求出价情况",_loc3_);
         this.var_238.addEventListener(Event.COMPLETE,this.getHttpContentHandler);
      }
      
      private function getHttpContentHandler(param1:*) : void
      {
         var _loc2_:String = String(this.var_238.data);
         class_38.parse(_loc2_,3);
      }
      
      public function method_194() : void
      {
      }
      
      private function method_345(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_345);
         var _loc2_:class_31 = new class_31();
         var _loc3_:class_7 = class_7(class_4.method_7.method_76(class_7));
         var _loc4_:class_27 = class_15(class_4.method_7.method_8(class_15)).socketControl.socket;
         _loc4_.receive("2-1",this.method_352);
         _loc4_.send("2-1",_loc3_.method_34(String(this.var_239)));
         this["@doswf__s"].focus = yzcode;
      }
      
      private function method_352(param1:class_45) : void
      {
         var _loc13_:* = null;
         var _loc14_:* = undefined;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         var _loc3_:class_9 = class_9(class_4.method_7.method_76(class_9));
         var _loc4_:Date = new Date();
         var _loc5_:String = String(_loc4_.getHours()) + ":" + String(_loc4_.getMinutes()) + ":" + String(_loc4_.getSeconds()) + "." + String(_loc4_.getMilliseconds());
         var _loc6_:class_40 = param1.var_56.clone();
         var _loc7_:String = _loc6_.readString();
         var _loc8_:String = this.var_32.method_31(_loc7_);
         var _loc9_:Object = JSON.parse(_loc8_);
         var _loc10_:String = _loc9_.response.responsecode;
         var _loc11_:String = _loc9_.servertime;
         if(_loc10_ == "0")
         {
            _loc13_ = _loc9_.response.data.imageurl;
            _loc14_ = _loc13_.split("?")[0];
            _loc15_ = this.method_353("i",_loc13_);
            _loc16_ = this.method_353("id",_loc13_);
            _loc17_ = this.method_353("ep",_loc13_);
            this.imageurl = _loc14_ + "?i=" + _loc15_;
            if(_loc16_ != "")
            {
               this.imageurl = this.imageurl + ("&id=" + _loc16_);
            }
            if(_loc17_ != "")
            {
               this.logappliction.WriteLog2("投标板块","得到的数据","type:" + _loc9_.response.data.type + ",字符串" + _loc17_);
               if(_loc9_.response.data.type == 1)
               {
                  this.logappliction.WriteLog2("投标板块","eval计算结果",String(D.eval(_loc17_)));
                  this.priceCode = String(D.eval(_loc17_));
               }
               else
               {
                  this.priceCode = _loc17_;
               }
               this.logappliction.WriteLog2("投标板块","priceCode",this.priceCode);
            }
            else
            {
               this.priceCode = "";
            }
            _loc18_ = _loc9_.response.data.prompt;
            this.yzmsg.text = _loc18_;
            _loc19_ = _loc9_.requestid;
            this.logappliction.method_24("投标板块","接收校验码2-1","requestid:" + _loc19_ + ",server time:" + _loc11_);
            this.logappliction.method_25("投标板块","接收校验码2-1",this.imageurl);
            _loc20_ = new TextField();
            this.imageurl = this.imageurl + "&b=" + _loc3_.pwd;
            _loc20_.htmlText = " <img src=\'" + this.imageurl + "\' id=\'image\' />";
            addChild(_loc20_);
            this.c = _loc20_.getImageReference("image");
            this.c.x = 70;
            this.c.y = 243;
            addChild(this.c);
            _loc21_ = this.numChildren - 1;
            this.setChildIndex(this.c,_loc21_);
         }
         else
         {
            _loc22_ = _loc9_.response.responsemsg;
            _loc23_ = new class_36(_loc22_);
            class_13.method_12(_loc23_);
            this.logappliction.method_24("投标板块","系统提示2-1",_loc22_);
         }
         var _loc12_:class_27 = class_15(class_4.method_7.method_8(class_15)).socketControl.socket;
         _loc12_.method_84("2-1",this.method_352);
      }
      
      private function completeHandler(param1:*) : void
      {
         var _loc2_:Loader = Loader(param1.target.loader);
         var _loc3_:Bitmap = Bitmap(_loc2_.content);
         _loc3_.x = 309;
         _loc3_.y = 218;
         addChild(_loc3_);
         this.logappliction.WriteLog2("投标板块","出价校验码","校验码加载完成");
      }
      
      private function method_354(param1:class_57) : void
      {
         param1.content.x = 309;
         param1.content.y = 218;
         addChild(param1.content);
         this.logappliction.WriteLog2("投标板块","出价校验码","校验码加载完成");
         class_102.method_84(param1.key,this.method_354);
      }
      
      private function closeHandler(param1:MouseEvent) : void
      {
         this.thisWinClose = true;
         try
         {
            this.imageurl = "";
            this.parent.removeChild(this);
            return;
         }
         catch(e:*)
         {
            return;
         }
      }
      
      public function method_353(param1:String, param2:String) : String
      {
         var _loc6_:* = null;
         var _loc3_:* = param1 + "=";
         var _loc4_:String = "";
         var _loc5_:int = param2.indexOf(_loc3_);
         if(_loc5_ != -1)
         {
            _loc6_ = param2.substring(_loc5_,param2.length);
            if(_loc6_.indexOf("&") != -1)
            {
               _loc4_ = _loc6_.substring(_loc3_.length,_loc6_.indexOf("&"));
            }
            else
            {
               _loc4_ = _loc6_.substring(_loc3_.length,_loc6_.length);
            }
         }
         return _loc4_;
      }
   }
}
