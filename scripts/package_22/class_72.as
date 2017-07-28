package package_22
{
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import package_21.class_67;
   import package_21.class_98;
   import package_25.ComponentEvent;
   import package_25.ScrollEvent;
   
   public class class_72 extends class_67
   {
      
      public static const const_12:Number = 15;
      
      private static var var_154:Object = {
         "downArrowDisabledSkin":"ScrollArrowDown_disabledSkin",
         "downArrowDownSkin":"ScrollArrowDown_downSkin",
         "downArrowOverSkin":"ScrollArrowDown_overSkin",
         "downArrowUpSkin":"ScrollArrowDown_upSkin",
         "thumbDisabledSkin":"ScrollThumb_upSkin",
         "thumbDownSkin":"ScrollThumb_downSkin",
         "thumbOverSkin":"ScrollThumb_overSkin",
         "thumbUpSkin":"ScrollThumb_upSkin",
         "trackDisabledSkin":"ScrollTrack_skin",
         "trackDownSkin":"ScrollTrack_skin",
         "trackOverSkin":"ScrollTrack_skin",
         "trackUpSkin":"ScrollTrack_skin",
         "upArrowDisabledSkin":"ScrollArrowUp_disabledSkin",
         "upArrowDownSkin":"ScrollArrowUp_downSkin",
         "upArrowOverSkin":"ScrollArrowUp_overSkin",
         "upArrowUpSkin":"ScrollArrowUp_upSkin",
         "thumbIcon":"ScrollBar_thumbIcon",
         "repeatDelay":500,
         "repeatInterval":35
      };
      
      protected static const const_13:Object = {
         "disabledSkin":"downArrowDisabledSkin",
         "downSkin":"downArrowDownSkin",
         "overSkin":"downArrowOverSkin",
         "upSkin":"downArrowUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      protected static const const_14:Object = {
         "disabledSkin":"thumbDisabledSkin",
         "downSkin":"thumbDownSkin",
         "overSkin":"thumbOverSkin",
         "upSkin":"thumbUpSkin",
         "icon":"thumbIcon",
         "textPadding":0
      };
      
      protected static const const_15:Object = {
         "disabledSkin":"trackDisabledSkin",
         "downSkin":"trackDownSkin",
         "overSkin":"trackOverSkin",
         "upSkin":"trackUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      protected static const const_16:Object = {
         "disabledSkin":"upArrowDisabledSkin",
         "downSkin":"upArrowDownSkin",
         "overSkin":"upArrowOverSkin",
         "upSkin":"upArrowUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
       
      
      private var var_200:Number = 10;
      
      private var var_201:Number = 0;
      
      private var var_202:Number = 1;
      
      private var var_203:Number = 0;
      
      private var var_204:Number = 0;
      
      private var var_205:Number = 0;
      
      private var var_206:String = "vertical";
      
      private var var_207:Number;
      
      protected var var_208:Boolean = false;
      
      protected var var_209:class_68;
      
      protected var var_210:class_68;
      
      protected var var_211:class_70;
      
      protected var var_212:class_68;
      
      public function class_72()
      {
         super();
         this.method_300();
         focusEnabled = false;
      }
      
      public static function getStyleDefinition() : Object
      {
         return var_154;
      }
      
      override public function setSize(param1:Number, param2:Number) : void
      {
         if(this.var_206 == class_100.HORIZONTAL)
         {
            super.setSize(param2,param1);
         }
         else
         {
            super.setSize(param1,param2);
         }
      }
      
      override public function get width() : Number
      {
         return this.var_206 == class_100.HORIZONTAL?Number(super.height):Number(super.width);
      }
      
      override public function get height() : Number
      {
         return this.var_206 == class_100.HORIZONTAL?Number(super.width):Number(super.height);
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this.var_210.enabled = this.var_212.enabled = this.var_211.enabled = this.var_209.enabled = this.enabled && this.var_204 > this.var_203;
         this.method_301();
      }
      
      public function method_302(param1:Number, param2:Number, param3:Number, param4:Number = 0) : void
      {
         this.name_11 = param1;
         this.var_203 = param2;
         this.var_204 = param3;
         if(param4 >= 0)
         {
            this.var_201 = param4;
         }
         this.enabled = this.var_204 > this.var_203;
         this.method_303(this.var_205,false);
         this.method_301();
      }
      
      public function get scrollPosition() : Number
      {
         return this.var_205;
      }
      
      public function set scrollPosition(param1:Number) : void
      {
         this.method_303(param1,true);
      }
      
      public function get method_304() : Number
      {
         return this.var_203;
      }
      
      public function set method_304(param1:Number) : void
      {
         this.method_302(this.var_200,param1,this.var_204);
      }
      
      public function get method_305() : Number
      {
         return this.var_204;
      }
      
      public function set method_305(param1:Number) : void
      {
         this.method_302(this.var_200,this.var_203,param1);
      }
      
      public function get name_11() : Number
      {
         return this.var_200;
      }
      
      public function set name_11(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.var_200 = param1;
         }
      }
      
      public function get method_306() : Number
      {
         return this.var_201 == 0?Number(this.var_200):Number(this.var_201);
      }
      
      public function set method_306(param1:Number) : void
      {
         if(param1 >= 0)
         {
            this.var_201 = param1;
         }
      }
      
      public function get lineScrollSize() : Number
      {
         return this.var_202;
      }
      
      public function set lineScrollSize(param1:Number) : void
      {
         if(param1 > 0)
         {
            this.var_202 = param1;
         }
      }
      
      public function get direction() : String
      {
         return this.var_206;
      }
      
      public function set direction(param1:String) : void
      {
         if(this.var_206 == param1)
         {
            return;
         }
         this.var_206 = param1;
         if(var_163)
         {
            return;
         }
         method_264(1);
         var _loc2_:* = this.var_206 == class_100.HORIZONTAL;
         if(_loc2_ && componentInspectorSetting)
         {
            if(rotation == 90)
            {
               return;
            }
            method_266(-1);
            rotation = -90;
         }
         if(!componentInspectorSetting)
         {
            if(_loc2_ && rotation == 0)
            {
               rotation = -90;
               method_266(-1);
            }
            else if(!_loc2_ && rotation == -90)
            {
               rotation = 0;
               method_266(1);
            }
         }
         invalidate(class_98.SIZE);
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         this.var_212 = new class_68();
         this.var_212.move(0,14);
         this.var_212.useHandCursor = false;
         this.var_212.method_289 = true;
         this.var_212.focusEnabled = false;
         addChild(this.var_212);
         this.var_211 = new class_70();
         this.var_211.label = "";
         this.var_211.setSize(const_12,15);
         this.var_211.move(0,15);
         this.var_211.focusEnabled = false;
         addChild(this.var_211);
         this.var_210 = new class_68();
         this.var_210.setSize(const_12,14);
         this.var_210.method_289 = true;
         this.var_210.focusEnabled = false;
         addChild(this.var_210);
         this.var_209 = new class_68();
         this.var_209.setSize(const_12,14);
         this.var_209.move(0,0);
         this.var_209.method_289 = true;
         this.var_209.focusEnabled = false;
         addChild(this.var_209);
         this.var_209.addEventListener(ComponentEvent.const_10,this.method_307,false,0,true);
         this.var_210.addEventListener(ComponentEvent.const_10,this.method_307,false,0,true);
         this.var_212.addEventListener(ComponentEvent.const_10,this.method_307,false,0,true);
         this.var_211.addEventListener(MouseEvent.MOUSE_DOWN,this.method_308,false,0,true);
         this.enabled = false;
      }
      
      override protected function draw() : void
      {
         var _loc1_:Number = NaN;
         if(method_278(class_98.SIZE))
         {
            _loc1_ = super.height;
            this.var_210.move(0,Math.max(this.var_209.height,_loc1_ - this.var_210.height));
            this.var_212.setSize(const_12,Math.max(0,_loc1_ - (this.var_210.height + this.var_209.height)));
            this.method_301();
         }
         if(method_278(class_98.STYLES,class_98.STATE))
         {
            this.method_300();
         }
         this.var_210.drawNow();
         this.var_209.drawNow();
         this.var_212.drawNow();
         this.var_211.drawNow();
         method_279();
      }
      
      protected function method_307(param1:ComponentEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         param1.stopImmediatePropagation();
         if(param1.currentTarget == this.var_209)
         {
            this.method_303(this.var_205 - this.var_202);
         }
         else if(param1.currentTarget == this.var_210)
         {
            this.method_303(this.var_205 + this.var_202);
         }
         else
         {
            _loc2_ = this.var_212.mouseY / this.var_212.height * (this.var_204 - this.var_203) + this.var_203;
            _loc3_ = this.method_306 == 0?Number(this.name_11):Number(this.method_306);
            if(this.var_205 < _loc2_)
            {
               this.method_303(Math.min(_loc2_,this.var_205 + _loc3_));
            }
            else if(this.var_205 > _loc2_)
            {
               this.method_303(Math.max(_loc2_,this.var_205 - _loc3_));
            }
         }
      }
      
      protected function method_308(param1:MouseEvent) : void
      {
         this.var_208 = true;
         this.var_207 = mouseY - this.var_211.y;
         this.var_211.mouseStateLocked = true;
         mouseChildren = false;
         var _loc2_:DisplayObjectContainer = method_271.form;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.method_309,false,0,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.method_310,false,0,true);
      }
      
      protected function method_309(param1:MouseEvent) : void
      {
         var _loc2_:Number = Math.max(0,Math.min(this.var_212.height - this.var_211.height,mouseY - this.var_212.y - this.var_207));
         this.method_303(_loc2_ / (this.var_212.height - this.var_211.height) * (this.var_204 - this.var_203) + this.var_203);
      }
      
      protected function method_310(param1:MouseEvent) : void
      {
         this.var_208 = false;
         mouseChildren = true;
         this.var_211.mouseStateLocked = false;
         var _loc2_:DisplayObjectContainer = method_271.form;
         _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_309);
         _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this.method_310);
      }
      
      public function method_303(param1:Number, param2:Boolean = true) : void
      {
         var _loc3_:Number = this.scrollPosition;
         this.var_205 = Math.max(this.var_203,Math.min(this.var_204,param1));
         if(_loc3_ == this.var_205)
         {
            return;
         }
         if(param2)
         {
            dispatchEvent(new ScrollEvent(this.var_206,this.scrollPosition - _loc3_,this.scrollPosition));
         }
         this.method_301();
      }
      
      protected function method_300() : void
      {
         method_281(this.var_210,const_13);
         method_281(this.var_211,const_14);
         method_281(this.var_212,const_15);
         method_281(this.var_209,const_16);
      }
      
      protected function method_301() : void
      {
         var _loc1_:Number = this.var_204 - this.var_203 + this.var_200;
         if(this.var_212.height <= 12 || this.var_204 <= this.var_203 || (_loc1_ == 0 || isNaN(_loc1_)))
         {
            this.var_211.height = 12;
            this.var_211.visible = false;
         }
         else
         {
            this.var_211.height = Math.max(13,this.var_200 / _loc1_ * this.var_212.height);
            this.var_211.y = this.var_212.y + (this.var_212.height - this.var_211.height) * ((this.var_205 - this.var_203) / (this.var_204 - this.var_203));
            this.var_211.visible = this.enabled;
         }
      }
   }
}
