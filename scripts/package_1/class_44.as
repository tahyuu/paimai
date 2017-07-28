package package_1
{
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import package_2.class_5;
   import package_24.class_82;
   import package_3.class_4;
   import package_7.class_85;
   
   public class class_44 extends Sprite
   {
       
      
      public var bidstage:class_85;
      
      public var bidcode:Number;
      
      private var lowestValue:int = 0;
      
      private var flag:String = "";
      
      public var var_119:Boolean = true;
      
      public var var_120:Boolean = true;
      
      public var logappliction:class_5;
      
      public function class_44()
      {
         this.logappliction = new class_5();
         super();
         class_4.method_7.method_26(this);
         this.x = 403.45;
         this.bidstage = new class_85();
         this.bidstage.price2.visible = false;
         this.bidstage.price1.visible = false;
         this.bidstage.ver.text = Main.clientui_version;
         if(class_4.method_1.method_3)
         {
            this.bidstage.ver.addEventListener(MouseEvent.CLICK,this.method_197);
         }
         this.bidstage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_198);
         addChild(this.bidstage);
         class_4.method_17.receive(class_82.name,function(param1:class_82):void
         {
            if(param1.var_102 == "B")
            {
               bidstage.price1.visible = true;
               lowestValue = param1.value;
               bidstage.price1.priceInfoTxt.text = "目前最低可成交价 : " + param1.value + "元";
               bidstage.price2.visible = false;
               bidstage.price2.priceInputTxt1.text = "";
               bidstage.price2.priceInputTxt2.text = "";
               bidcode = 2;
            }
            else if(param1.var_102 == "A")
            {
               bidstage.price2.visible = true;
               bidstage.price1.visible = false;
               bidcode = 1;
            }
            else if(param1.var_102 == "E")
            {
               bidstage.price2.visible = true;
               bidstage.price1.visible = false;
               bidcode = 5;
            }
            else if(param1.var_102 == "D" || param1.var_102 == "G")
            {
               bidstage.price2.visible = true;
               bidstage.price1.visible = false;
               bidcode = 4;
            }
            else if(param1.var_102 == "H")
            {
               bidstage.price2.visible = true;
               bidstage.price1.visible = false;
               bidcode = 6;
            }
            else if(param1.var_102 == "C")
            {
               bidstage.price2.visible = true;
               bidstage.price1.visible = false;
               bidcode = 3;
            }
            if(param1.var_102 == "A")
            {
               bidstage.price1.priceInfoTxt.visible = false;
            }
            else
            {
               bidstage.price1.priceInfoTxt.visible = true;
            }
         });
         this.bidstage.price1.i100.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.i200.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.i300.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.s100.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.s200.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.s300.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.priceBut.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.ipriceButOK.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.price1.priceInputTxt.restrict = "0-9";
         this.bidstage.price1.ipriceInputTxt.restrict = "0-9";
         this.bidstage.price2.priceInputTxt1.restrict = "0-9";
         this.bidstage.price2.priceInputTxt2.restrict = "0-9";
         this.bidstage.price2.priceInputTxt1.tabIndex = 1;
         this.bidstage.price2.priceInputTxt2.tabIndex = 2;
         this.bidstage.price2.priceBut2.addEventListener(MouseEvent.CLICK,this.method_199);
         this.bidstage.queryInfoBut.addEventListener(MouseEvent.CLICK,this.method_200);
      }
      
      private function method_198(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 9)
         {
            this["@doswf__s"].stageFocusRect = false;
            this.bidstage.focusRect = false;
            this["@doswf__s"].focus = this.bidstage.info;
         }
      }
      
      public function method_201() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:int = Math.round(Math.random());
         if(_loc3_ == 0)
         {
            _loc1_ = int((Math.random() * 18.15 + 298.8) * 100) / 100;
            _loc2_ = int(Math.random() * 95.2 * 100) / 100;
         }
         else
         {
            _loc1_ = int((Math.random() * 325.25 - 7.3) * 100) / 100;
            _loc2_ = int((Math.random() * 7.15 + 134.2) * 100) / 100;
         }
         this.bidstage.price2.priceBut2.x = _loc1_;
         this.bidstage.price2.priceBut2.y = _loc2_;
      }
      
      public function method_202() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = NaN;
         var _loc3_:int = Math.round(Math.random());
         if(_loc3_ == 0)
         {
            _loc1_ = int((Math.random() * 35 + 294.2) * 100) / 100;
            _loc2_ = 136.6;
         }
         else
         {
            _loc1_ = int((Math.random() * 225.95 + 103.25) * 100) / 100;
            _loc2_ = 181;
         }
         this.bidstage.price1.priceBut.x = _loc1_;
         this.bidstage.price1.priceBut.y = _loc2_;
      }
      
      public function method_197(param1:MouseEvent) : void
      {
         class_29(class_4.method_7.method_8(class_29)).show();
      }
      
      public function method_200(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_120)
         {
            setTimeout(this.method_203,6000);
            _loc2_ = new class_87();
            class_13.method_12(_loc2_);
            this.var_120 = false;
         }
         else
         {
            class_13.method_12(new class_36(9));
         }
      }
      
      private function method_203() : void
      {
         this.var_120 = true;
      }
      
      public function method_199(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         switch(param1.target.name)
         {
            case "s300":
               if(this.lowestValue - 300 < 100)
               {
                  this.bidstage.price1.priceInputTxt.text = "100";
                  break;
               }
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue - 300);
               break;
            case "s200":
               if(this.lowestValue - 200 < 100)
               {
                  this.bidstage.price1.priceInputTxt.text = "100";
                  break;
               }
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue - 200);
               break;
            case "s100":
               if(this.lowestValue - 100 < 100)
               {
                  this.bidstage.price1.priceInputTxt.text = "100";
                  break;
               }
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue - 100);
               break;
            case "i300":
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue + 300);
               break;
            case "i200":
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue + 200);
               break;
            case "i100":
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue + 100);
               break;
            case "ipriceButOK":
               _loc2_ = int(this.bidstage.price1.ipriceInputTxt.text);
               if(_loc2_ % 100 != 0)
               {
                  _loc3_ = new class_36(13);
                  class_13.method_12(_loc3_);
                  break;
               }
               this.bidstage.price1.priceInputTxt.text = String(this.lowestValue + _loc2_);
               break;
            case "priceBut":
               if(this.bidcode == 3)
               {
                  _loc3_ = new class_36(7);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 4)
               {
                  _loc3_ = new class_36(10);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 5)
               {
                  _loc3_ = new class_36(11);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 6)
               {
                  _loc3_ = new class_36(12);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidstage.price1.priceInputTxt.text.length == 0)
               {
                  _loc3_ = new class_36(1);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(int(this.bidstage.price1.priceInputTxt.text) <= 0 || int(this.bidstage.price1.priceInputTxt.text) % 100 != 0)
               {
                  _loc3_ = new class_36(2);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.var_119)
               {
                  setTimeout(this.method_204,6000);
                  class_13.method_12(new class_84(int(this.bidstage.price1.priceInputTxt.text)));
                  this.var_119 = false;
                  break;
               }
               class_13.method_12(new class_36(9));
               break;
            case "priceBut2":
               if(this.bidcode == 3)
               {
                  _loc3_ = new class_36(7);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 4)
               {
                  _loc3_ = new class_36(10);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 5)
               {
                  _loc3_ = new class_36(11);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidcode == 6)
               {
                  _loc3_ = new class_36(12);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidstage.price2.priceInputTxt1.text.length == 0 || this.bidstage.price2.priceInputTxt2.text.length == 0)
               {
                  _loc3_ = new class_36(1);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(int(this.bidstage.price2.priceInputTxt1.text) <= 0 || int(this.bidstage.price2.priceInputTxt1.text) % 100 != 0 || int(this.bidstage.price2.priceInputTxt2.text) % 100 != 0)
               {
                  _loc3_ = new class_36(2);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.bidstage.price2.priceInputTxt1.text != this.bidstage.price2.priceInputTxt2.text)
               {
                  _loc3_ = new class_36(3);
                  class_13.method_12(_loc3_);
                  break;
               }
               if(this.var_119)
               {
                  setTimeout(this.method_204,6000);
                  class_13.method_12(new class_84(int(this.bidstage.price2.priceInputTxt1.text)));
                  this.var_119 = false;
                  break;
               }
               class_13.method_12(new class_36(9));
               break;
         }
      }
      
      private function method_204() : void
      {
         this.var_119 = true;
      }
      
      public function method_176(param1:String) : void
      {
         this.bidstage.info.htmlText = "<font color=\'#FF0000\'>" + param1 + "</font>";
      }
   }
}
