package package_14
{
   import package_1.class_13;
   import package_1.class_15;
   import package_1.class_29;
   import package_1.class_34;
   import package_2.class_5;
   import package_24.class_82;
   import package_3.class_4;
   
   public class class_37
   {
      
      public static var logappliction:class_5 = new class_5();
      
      public static var var_60:int = 0;
       
      
      private var var_103:Main;
      
      public var var_104:String;
      
      public function class_37()
      {
         this.var_103 = new Main();
         super();
      }
      
      public static function info(param1:String, param2:Boolean = false) : String
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc3_:String = param1;
         var _loc4_:Array = new Array();
         _loc4_ = _loc3_.split(",",_loc3_.length);
         var _loc5_:* = "";
         var _loc6_:String = _loc4_[1];
         var _loc7_:String = _loc4_[2];
         if(_loc6_ == "A")
         {
            _loc5_ = _loc4_[3] + "\n";
            _loc5_ = _loc5_ + ("投放额度数:" + _loc4_[4] + "\n");
            if(_loc7_ == "1")
            {
               _loc5_ = _loc5_ + ("起拍价:" + _loc4_[6] + "\n");
            }
            if(_loc7_ == "1")
            {
               if(_loc4_[5] == "0")
               {
                  _loc5_ = _loc5_ + "<font color=\'#FF0000\'>本场拍卖会警示价:无警示价</font>\n";
               }
               else
               {
                  _loc5_ = _loc5_ + ("<font color=\'#FF0000\'>本场拍卖会警示价:" + _loc4_[5] + "</font>\n");
               }
            }
            else
            {
               _loc5_ = _loc5_ + ("<font color=\'#FF0000\'>本场拍卖会警示价:" + _loc4_[5] + "</font>\n");
            }
            _loc5_ = _loc5_ + ("拍卖会起止时间:" + _loc4_[7] + "至" + _loc4_[8] + "\n");
            _loc5_ = _loc5_ + ("首次出价时段:" + _loc4_[9] + "至" + _loc4_[10] + "\n");
            _loc5_ = _loc5_ + ("修改出价时段:" + _loc4_[11] + "至" + _loc4_[12] + "\n" + "\n");
            _loc5_ = _loc5_ + "    目前为首次出价时段\n";
            _loc5_ = _loc5_ + ("系统目前时间:<font color=\'#FF0000\'>" + _loc4_[13] + "</font>\n");
            _loc5_ = _loc5_ + ("目前已投标人数:<font color=\'#FF0000\'>" + _loc4_[14] + "</font>\n");
            _loc5_ = _loc5_ + ("目前最低可成交价:<font color=\'#FF0000\'>" + _loc4_[15] + "</font>\n");
            _loc5_ = _loc5_ + ("最低可成交价出价时间:<font color=\'#FF0000\'>" + _loc4_[16] + "</font>\n");
            if(class_4.method_1.method_3)
            {
               _loc5_ = _loc5_ + ("当前处理位置:" + _loc4_[17]);
            }
            var_60 = _loc4_[17];
            _loc9_ = new Date();
            _loc10_ = String(_loc9_.getMinutes()) + "." + String(_loc9_.getSeconds());
            _loc11_ = _loc4_[13].substring(3,_loc4_[11].length);
            _loc11_ = _loc11_.split(":").join(".");
            class_29(class_4.method_7.method_8(class_29)).info(_loc10_ + "-" + _loc11_);
         }
         else if(_loc6_ == "B")
         {
            _loc5_ = "<font color=\'#FF0000\'>";
            _loc5_ = _loc5_ + (_loc4_[3] + "\n");
            _loc5_ = _loc5_ + ("投放额度数:" + _loc4_[4] + "\n");
            if(_loc7_ == "1")
            {
               _loc5_ = _loc5_ + ("起拍价:" + _loc4_[6] + "\n");
            }
            _loc5_ = _loc5_ + ("目前已投标人数:" + _loc4_[5] + "\n");
            _loc5_ = _loc5_ + ("拍卖会起止时间:" + _loc4_[7] + "至" + _loc4_[8] + "\n");
            _loc5_ = _loc5_ + ("首次出价时段:" + _loc4_[9] + "至" + _loc4_[10] + "\n");
            _loc5_ = _loc5_ + ("修改出价时段:" + _loc4_[11] + "至" + _loc4_[12] + "\n" + "\n");
            _loc5_ = _loc5_ + "</font>";
            _loc5_ = _loc5_ + "    目前为修改出价时段\n";
            _loc5_ = _loc5_ + ("系统目前时间:<font color=\'#FF0000\'><b>" + _loc4_[13] + "</b></font>\n");
            _loc5_ = _loc5_ + ("目前最低可成交价:<font color=\'#FF0000\'><b>" + _loc4_[14] + "</b></font>\n");
            _loc5_ = _loc5_ + ("最低可成交价出价时间:<font color=\'#FF0000\'><b>" + _loc4_[15] + "</b></font>\n");
            _loc5_ = _loc5_ + ("目前数据库接受处理价格区间:<font color=\'#FF0000\'><b>" + _loc4_[16] + "至" + _loc4_[17] + "</b></font>\n");
            if(class_4.method_1.method_3)
            {
               _loc5_ = _loc5_ + ("当前处理位置:" + _loc4_[18]);
            }
            var_60 = _loc4_[18];
            _loc9_ = new Date();
            _loc10_ = String(_loc9_.getMinutes()) + "." + String(_loc9_.getSeconds());
            _loc12_ = _loc4_[13].substring(3,_loc4_[13].length);
            class_29(class_4.method_7.method_8(class_29)).info(_loc10_ + "-" + _loc12_);
         }
         else
         {
            _loc13_ = _loc4_[2];
            _loc14_ = new Array();
            _loc14_ = _loc13_.split("\n",_loc13_.length);
            _loc5_ = "";
            _loc15_ = 0;
            while(_loc15_ < _loc14_.length)
            {
               _loc5_ = _loc5_ + (_loc14_[_loc15_] + "\n");
               _loc15_++;
            }
            if(_loc4_[2] != null)
            {
               if(class_4.method_1.method_3)
               {
                  _loc5_ = _loc5_ + ("当前处理位置:" + _loc4_[3]);
               }
            }
            var_60 = _loc4_[3];
         }
         var _loc8_:class_82 = new class_82();
         _loc8_.var_102 = _loc6_;
         if(_loc4_[14])
         {
            _loc8_.value = _loc4_[14];
         }
         class_4.method_17.send(class_82.name,_loc8_);
         return _loc5_;
      }
      
      public static function method_169(param1:String) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:String = param1;
         var _loc4_:Array = new Array();
         _loc4_ = _loc3_.split(",",_loc3_.length);
         var _loc6_:String = _loc4_[1];
         if(_loc6_ == "A" || _loc6_ == "B" || _loc6_ == "C" || _loc6_ == "D" || _loc6_ == "E" || _loc6_ == "G" || _loc6_ == "H")
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      public static function method_173(param1:String) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         var _loc2_:Date = new Date();
         var _loc3_:Array = new Array();
         _loc3_ = param1.split(":");
         var _loc4_:Number = _loc3_[0];
         var _loc5_:Number = _loc3_[1];
         var _loc6_:Number = _loc3_[2];
         var _loc7_:Date = new Date(_loc2_.getFullYear(),_loc2_.getMonth(),_loc2_.getDate(),_loc4_,_loc5_,_loc6_);
         var _loc8_:Number = Math.round((_loc7_.getTime() - _loc2_.getTime()) / 1000);
         if(Main.var_3)
         {
            Main.var_3 = false;
            Main.var_2 = _loc8_;
         }
         else
         {
            _loc9_ = Math.abs(_loc8_ - Main.var_2);
            if(_loc9_ >= 20)
            {
               _loc10_ = param1 + "\n" + _loc2_ + "\n" + "timeDifference:" + _loc8_;
               logappliction.WriteLog2("","",_loc10_);
               Main.var_3 = true;
               class_34(class_4.method_7.method_8(class_34)).var_53.method_78(1);
               class_15(class_4.method_7.method_8(class_15)).socketControl.close();
               class_15(class_4.method_7.method_8(class_15)).reconnect();
               class_13.method_62();
            }
         }
      }
   }
}
