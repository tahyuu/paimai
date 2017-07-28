package package_1
{
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.clearTimeout;
   import package_13.class_45;
   import package_14.class_37;
   import package_15.class_38;
   import package_15.class_43;
   import package_17.class_49;
   import package_2.class_3;
   import package_2.class_46;
   import package_2.class_5;
   import package_2.class_7;
   import package_2.class_8;
   import package_3.class_4;
   import package_5.class_40;
   
   public class class_15 extends Sprite
   {
      
      public static var var_50:class_49 = new class_49();
       
      
      public var var_51:class_44;
      
      public var socketControl:class_43;
      
      public var requestid:String;
      
      public var var_32:class_8;
      
      public var logappliction:class_5;
      
      public var serverModel:class_3;
      
      private var var_54:uint = 0;
      
      private var var_55 = false;
      
      public var _IsPut11 = false;
      
      public function class_15()
      {
         var name_4:class_7 = null;
         this.var_51 = new class_44();
         this.var_32 = new class_8(Main.var_5);
         this.logappliction = new class_5();
         this.serverModel = class_3(class_4.method_7.method_76(class_3));
         super();
         class_4.method_7.method_26(this);
         name_4 = class_7(class_4.method_7.method_76(class_7));
         this.socketControl = new class_43("右边操作出价",this.serverModel);
         this.socketControl.var_52 = function():void
         {
            socketControl.socket.receive("1-1",Reader1to1Handler);
            socketControl.socket.send("1-1",name_4.method_28);
            socketControl.socket.receive("2-2",Reader2to2Handler);
            socketControl.socket.receive("2-3",Reader2to3Handler);
            socketControl.socket.receive("3-2",Reader3to2Handler);
            socketControl.socket.receive("1-2",Reader1to2Handler);
            var _loc1_:String = new String("this is a new book");
         };
         this.socketControl.ioErrorHandler = function():void
         {
            _IsPut11 = false;
            class_4.method_18.method_77(class_15.var_50);
            class_34(class_4.method_7.method_8(class_34)).var_53.method_78(1);
            logappliction.WriteLog2("行情板块","ioErrorHandler","亮红灯");
            if(!Main.var_1)
            {
               socketControl.reconnect(serverModel);
               class_13.method_62();
            }
         };
         this.socketControl.securityErrorHandler = function():void
         {
            _IsPut11 = false;
            class_4.method_18.method_77(class_15.var_50);
            class_34(class_4.method_7.method_8(class_34)).var_53.method_78(1);
            logappliction.WriteLog2("行情板块","securityErrorHandler","亮红灯");
            if(!Main.var_1)
            {
               socketControl.reconnect(serverModel);
               class_13.method_62();
            }
         };
         this.socketControl.closeHandler = function():void
         {
            _IsPut11 = false;
            class_4.method_18.method_77(class_15.var_50);
            class_34(class_4.method_7.method_8(class_34)).var_53.method_78(1);
            logappliction.WriteLog2("行情板块","closeHandler","亮红灯");
            if(!Main.var_1)
            {
               socketControl.reconnect(serverModel);
               class_13.method_62();
            }
         };
         addChild(this.var_51);
      }
      
      private function Reader3to2Handler(param1:class_45) : void
      {
         var _loc2_:class_40 = param1.var_56.clone();
         var _loc3_:String = _loc2_.readString();
         var _loc4_:String = this.var_32.method_31(_loc3_);
         var _loc5_:String = _loc4_;
         this.logappliction.method_24("投标板块","开标结果3-2",_loc5_);
         var _loc6_:Object = JSON.parse(_loc5_);
         var _loc7_:String = _loc6_.response.responsecode;
         var _loc8_:String = _loc6_.response.data;
         class_13(class_4.method_7.method_8(class_13)).method_64(_loc8_,true);
      }
      
      private function Reader1to2Handler(param1:class_45) : void
      {
         this.logappliction.WriteLog2("投标板块","1-2","被强制下线");
         Main.var_1 = true;
         ExternalInterface.call("clearbidcookies");
         navigateToURL(new URLRequest("javascript:clearbidcookies()"),"_self");
         var _loc3_:class_17 = new class_17(1);
         class_13.method_12(_loc3_);
      }
      
      private function Reader2to3Handler(param1:class_45) : void
      {
         class_42.var_57 = true;
         var _loc2_:class_40 = param1.var_56.clone();
         var _loc3_:String = _loc2_.readString();
         var _loc4_:String = this.var_32.method_31(_loc3_);
         var _loc5_:String = _loc4_;
         this.logappliction.method_24("投标板块","接收出价情况2-3",_loc5_);
         class_38.parse(_loc5_,2);
      }
      
      private function Reader2to2Handler(param1:class_45) : void
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = undefined;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc3_:String = "this is a new book".concat("a");
         var _loc4_:class_40 = param1.var_56.clone();
         var _loc5_:String = _loc4_.readString();
         var _loc6_:String = this.var_32.method_31(_loc5_);
         this.logappliction.WriteLog2("投标板块","接收队列消息2-2",_loc6_);
         var _loc7_:String = _loc6_;
         var _loc8_:Object = new Object();
         _loc8_ = JSON.parse(_loc7_);
         var _loc9_:String = _loc8_.response.responsecode;
         _loc10_ = _loc8_.servertime;
         if(_loc9_ != "0")
         {
            _loc11_ = _loc8_.response.responsemsg;
            class_13.method_12(new class_36(_loc11_,true));
            this.logappliction.method_24("投标板块","接收系统提示2-2",_loc11_);
            this.logappliction.method_24("投标板块","接收系统提示2-2","servertime is:" + _loc10_);
         }
         else
         {
            if(!class_42.var_57)
            {
               class_13.method_12(new class_42());
            }
            _loc12_ = _loc8_.response.data.bidcount;
            _loc13_ = _loc8_.response.data.bidamount;
            _loc14_ = _loc8_.response.data.bidnumber;
            _loc15_ = _loc8_.response.data.bidtime;
            _loc10_ = _loc8_.servertime;
            this.requestid = _loc8_.response.data.requestid;
            _loc11_ = _loc8_.response.data.msg;
            _loc16_ = _loc11_.split("，");
            if(_loc16_[1] != null)
            {
               _loc17_ = _loc16_[2];
               _loc18_ = String(Number(_loc16_[2]) - Number(_loc16_[3]));
               _loc19_ = "我的序号:" + _loc16_[2] + ",正处理的序号:" + _loc16_[3];
               this.logappliction.WriteLog2("投标板块","接收队列消息2-2",_loc19_ + ",server time:" + _loc10_);
               if(class_46(class_4.method_7.method_76(class_46)) == null)
               {
                  _loc20_ = new class_46();
               }
               else
               {
                  _loc20_ = class_46(class_4.method_7.method_76(class_46));
               }
               _loc20_.var_58 = _loc16_[2];
               _loc20_.var_59 = _loc16_[3];
               _loc20_.method_79();
               if(_loc16_[2] > class_37.var_60)
               {
                  class_42(class_4.method_7.method_8(class_42)).method_80(0);
               }
               this.logappliction.method_23("投标板块","接收队列消息2-2",this.requestid);
            }
         }
      }
      
      private function Reader1to1Handler(param1:class_45) : void
      {
         class_34(class_4.method_7.method_8(class_34)).var_53.method_78(2);
         this.var_55 = true;
         this.method_81();
         class_3(class_4.method_7.method_76(class_3)).resetAllowChangeCount();
         this.logappliction.WriteLog2("投标板块","上线结果1-1","成功连接");
         var _loc2_:class_40 = param1.var_56.clone();
         var _loc3_:String = _loc2_.readString();
         var _loc4_:String = this.var_32.method_31(_loc3_);
         var _loc5_:String = _loc4_;
         class_38.parse(_loc5_,0);
         class_4.method_18.method_82(class_15.var_50,10000);
      }
      
      public function reconnect() : void
      {
         this.socketControl.reconnect(this.serverModel);
      }
      
      public function method_81() : *
      {
         clearTimeout(this.var_54);
      }
   }
}
