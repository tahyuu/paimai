package package_15
{
   import package_1.class_13;
   import package_1.class_29;
   import package_1.class_36;
   import package_1.class_44;
   import package_2.class_5;
   import package_3.class_4;
   
   public class class_38
   {
       
      
      public var logappliction:class_5;
      
      public function class_38()
      {
         this.logappliction = new class_5();
         super();
      }
      
      public static function parse(param1:String, param2:int = 0) : *
      {
         param1 = method_174(param1);
         switch(param2)
         {
            case 0:
               class_44(class_4.method_7.method_8(class_44)).method_176(method_175(param1));
               break;
            case 1:
               method_177(param1);
               break;
            case 2:
               method_178(param1);
               break;
            case 3:
               method_179(param1);
         }
      }
      
      private static function method_175(param1:String) : *
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc2_:Object = new Object();
         _loc2_ = JSON.parse(param1);
         var _loc3_:String = _loc2_.response.responsecode;
         if(_loc3_ == "0" && _loc2_.response.data.results != null && _loc2_.response.data.results[0] != null)
         {
            _loc4_ = _loc2_.response.data.results[0].bidcount;
            _loc5_ = _loc2_.response.data.results[0].type;
            _loc6_ = "您第" + _loc4_ + "次出价\n";
            _loc6_ = _loc6_ + ("出价金额:" + _loc2_.response.data.results[0].bidamount + "\n");
            _loc6_ = _loc6_ + ("出价时间:" + method_180(_loc2_.response.data.results[0].dealtime) + "\n");
            if(_loc5_ == "1")
            {
               _loc6_ = _loc6_ + "出价方式:网络出价";
            }
            else
            {
               _loc6_ = _loc6_ + "出价方式:电话出价";
            }
            return _loc6_;
         }
         return "";
      }
      
      private static function method_177(param1:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = null;
         var _loc10_:* = undefined;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:String = _loc2_.response.responsecode;
         if(_loc3_ != "0")
         {
            if(_loc3_ == "2101")
            {
               _loc4_ = _loc2_.response.responsemsg;
               class_13.method_12(new class_36(_loc4_,true));
            }
         }
         else if(_loc2_.response.data != null)
         {
            if(_loc2_.response.data[0] != null)
            {
               _loc5_ = _loc2_.response.data[0].bidamount;
               _loc6_ = _loc2_.response.data[0].bidcount;
               _loc7_ = _loc2_.response.data[0].dealtime;
               _loc8_ = _loc2_.response.data[0].type;
               _loc9_ = _loc2_.response.data[0].msg;
               _loc10_ = "您第" + _loc6_ + "次出价\n";
               _loc10_ = _loc10_ + ("出价金额:" + _loc5_ + "\n");
               _loc10_ = _loc10_ + ("出价时间:" + _loc7_ + "\n");
               if(_loc8_ == "1")
               {
                  _loc10_ = _loc10_ + "出价方式:网络出价";
               }
               else
               {
                  _loc10_ = _loc10_ + "出价方式:电话出价";
               }
               class_44(class_4.method_7.method_8(class_44)).method_176(_loc10_);
            }
         }
      }
      
      private static function method_179(param1:String) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = null;
         var _loc12_:* = undefined;
         var _loc2_:Date = new Date();
         var _loc3_:String = String(_loc2_.getHours()) + ":" + String(_loc2_.getMinutes()) + ":" + String(_loc2_.getSeconds());
         class_29(class_4.method_7.method_8(class_29)).info("投标板块,2-3http最新出价情况,当前时间" + _loc3_ + ",数据：" + param1);
         var _loc4_:Object = JSON.parse(param1);
         var _loc5_:String = _loc4_.response.responsecode;
         if(_loc5_ != "0")
         {
            if(_loc5_ == "2101")
            {
               _loc6_ = _loc4_.response.responsemsg;
               class_13.method_12(new class_36(_loc6_,true));
            }
            else
            {
               class_13.method_62();
            }
         }
         else if(_loc4_.response.data[0] != null)
         {
            _loc7_ = _loc4_.response.data[0].bidamount;
            _loc8_ = _loc4_.response.data[0].bidcount;
            _loc9_ = _loc4_.response.data[0].dealtime;
            _loc10_ = _loc4_.response.data[0].type;
            _loc11_ = _loc4_.response.data[0].msg;
            _loc12_ = "您第" + _loc8_ + "次出价\n";
            _loc12_ = _loc12_ + ("出价金额:" + _loc7_ + "\n");
            _loc12_ = _loc12_ + ("出价时间:" + _loc9_ + "\n");
            if(_loc10_ == "1")
            {
               _loc12_ = _loc12_ + "出价方式:网络出价";
            }
            else
            {
               _loc12_ = _loc12_ + "出价方式:电话出价";
            }
            class_44(class_4.method_7.method_8(class_44)).method_176(_loc12_);
            class_13.method_12(new class_36(_loc11_));
         }
         else
         {
            class_13.method_62();
         }
      }
      
      private static function method_178(param1:String) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc2_:Object = JSON.parse(param1);
         var _loc3_:String = _loc2_.response.responsecode;
         if(_loc3_ == "0")
         {
            _loc4_ = _loc2_.response.data.bidamount;
            _loc5_ = _loc2_.response.data.bidcount;
            _loc6_ = _loc2_.response.data.bidtime;
            _loc7_ = _loc2_.response.data.type;
            _loc8_ = _loc2_.response.data.msg;
            _loc9_ = _loc2_.servertime;
            _loc10_ = _loc2_.response.data.dealtime;
            _loc11_ = _loc10_.substring(0,_loc10_.length - 4);
            _loc12_ = _loc8_;
            if(_loc5_ != "0")
            {
               _loc15_ = "您第" + _loc5_ + "次出价\n";
               _loc15_ = _loc15_ + ("出价金额:" + _loc4_ + "\n");
               _loc15_ = _loc15_ + ("出价时间:" + _loc11_ + "\n");
               if(_loc7_ == "1")
               {
                  _loc15_ = _loc15_ + "出价方式: 网络出价";
               }
               else
               {
                  _loc15_ = _loc15_ + "出价方式: 电话出价";
               }
               class_44(class_4.method_7.method_8(class_44)).method_176(_loc15_);
               class_13.method_12(new class_36(_loc12_));
            }
            else
            {
               _loc15_ = "您第" + _loc5_ + "次出价\n";
               _loc15_ = _loc15_ + ("出价金额:" + _loc4_ + "\n");
               _loc15_ = _loc15_ + ("出价时间:" + _loc11_ + "\n");
               if(_loc7_ == "1")
               {
                  _loc15_ = _loc15_ + "出价方式:网络出价";
               }
               else
               {
                  _loc15_ = _loc15_ + "出价方式:电话出价";
               }
               class_44(class_4.method_7.method_8(class_44)).method_176(_loc15_);
               class_13.method_12(new class_36(_loc12_));
            }
            _loc13_ = new Date();
            _loc14_ = String(_loc13_.getHours()) + ":" + String(_loc13_.getMinutes()) + ":" + String(_loc13_.getSeconds());
            class_29(class_4.method_7.method_8(class_29)).info("投标板块,接收出价情况2-3,当前时间:" + _loc14_ + ",server time:" + _loc9_);
         }
         else
         {
            _loc16_ = _loc2_.response.data.bidamount;
            _loc17_ = _loc2_.response.data.bidtime;
            _loc18_ = _loc2_.response.data.msg;
            _loc19_ = _loc2_.servertime;
            _loc20_ = _loc2_.response.data.dealtime;
            _loc21_ = "";
            if(_loc3_ != "4019")
            {
               _loc21_ = _loc20_.substring(0,_loc20_.length - 4);
            }
            else
            {
               _loc21_ = _loc20_;
            }
            _loc22_ = _loc18_ + "\n" + "出价金额:" + _loc16_ + "元" + "\n" + "系统处理时间:" + _loc21_;
            class_13.method_12(new class_36(_loc22_));
         }
      }
      
      private static function method_181(param1:String) : String
      {
         var _loc2_:* = null;
         if(class_44(class_4.method_7.method_8(class_44)).bidcode != 4)
         {
            if(param1.indexOf("000") != -1)
            {
               _loc2_ = param1.substring(0,param1.length - 4);
            }
         }
         else
         {
            _loc2_ = param1;
         }
         return _loc2_;
      }
      
      private static function method_180(param1:String) : String
      {
         var _loc2_:String = param1;
         if(param1.indexOf("000") != -1)
         {
            _loc2_ = param1.substring(0,param1.length - 4);
         }
         return _loc2_;
      }
      
      public static function method_174(param1:String) : String
      {
         var _loc2_:String = param1;
         _loc2_ = _loc2_.replace(/>/g,"").replace(/</g,"").replace(/&/g,"");
         return _loc2_;
      }
   }
}
