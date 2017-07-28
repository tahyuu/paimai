package package_22
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.system.IME;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import flash.ui.Keyboard;
   import package_21.class_67;
   import package_21.class_98;
   import package_23.class_69;
   import package_23.class_95;
   import package_25.ComponentEvent;
   import package_25.ScrollEvent;
   
   public class class_74 extends class_67 implements class_69
   {
      
      private static var var_154:Object = {
         "upSkin":"TextArea_upSkin",
         "disabledSkin":"TextArea_disabledSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":3,
         "embedFonts":false
      };
      
      protected static const const_18:Object = {
         "downArrowDisabledSkin":"downArrowDisabledSkin",
         "downArrowDownSkin":"downArrowDownSkin",
         "downArrowOverSkin":"downArrowOverSkin",
         "downArrowUpSkin":"downArrowUpSkin",
         "upArrowDisabledSkin":"upArrowDisabledSkin",
         "upArrowDownSkin":"upArrowDownSkin",
         "upArrowOverSkin":"upArrowOverSkin",
         "upArrowUpSkin":"upArrowUpSkin",
         "thumbDisabledSkin":"thumbDisabledSkin",
         "thumbDownSkin":"thumbDownSkin",
         "thumbOverSkin":"thumbOverSkin",
         "thumbUpSkin":"thumbUpSkin",
         "thumbIcon":"thumbIcon",
         "trackDisabledSkin":"trackDisabledSkin",
         "trackDownSkin":"trackDownSkin",
         "trackOverSkin":"trackOverSkin",
         "trackUpSkin":"trackUpSkin",
         "repeatDelay":"repeatDelay",
         "repeatInterval":"repeatInterval"
      };
      
      public static var var_157:Function;
       
      
      public var var_192:TextField;
      
      protected var var_225:Boolean = true;
      
      protected var var_226:Boolean = true;
      
      protected var var_227:String = "auto";
      
      protected var var_228:String = "auto";
      
      protected var var_229:class_73;
      
      protected var var_230:class_73;
      
      protected var background:DisplayObject;
      
      protected var var_231:Boolean = false;
      
      protected var var_232:String;
      
      protected var var_233:Boolean = false;
      
      public function class_74()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return class_67.mergeStyles(var_154,class_72.getStyleDefinition());
      }
      
      public function get method_318() : class_73
      {
         return this.var_229;
      }
      
      public function get method_319() : class_73
      {
         return this.var_230;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         mouseChildren = this.enabled;
         invalidate(class_98.STATE);
      }
      
      public function get text() : String
      {
         return this.var_192.text;
      }
      
      public function set text(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            return;
         }
         this.var_192.text = param1;
         this.var_231 = false;
         invalidate(class_98.DATA);
         invalidate(class_98.STYLES);
         this.var_233 = true;
      }
      
      public function get htmlText() : String
      {
         return this.var_192.htmlText;
      }
      
      public function set htmlText(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            return;
         }
         if(param1 == "")
         {
            this.text = "";
            return;
         }
         this.var_231 = true;
         this.var_232 = param1;
         this.var_192.htmlText = param1;
         invalidate(class_98.DATA);
         invalidate(class_98.STYLES);
         this.var_233 = true;
      }
      
      public function get condenseWhite() : Boolean
      {
         return this.var_192.condenseWhite;
      }
      
      public function set condenseWhite(param1:Boolean) : void
      {
         this.var_192.condenseWhite = param1;
         invalidate(class_98.DATA);
      }
      
      public function get method_320() : String
      {
         return this.var_227;
      }
      
      public function set method_320(param1:String) : void
      {
         this.var_227 = param1;
         invalidate(class_98.SIZE);
      }
      
      public function get method_321() : String
      {
         return this.var_228;
      }
      
      public function set method_321(param1:String) : void
      {
         this.var_228 = param1;
         invalidate(class_98.SIZE);
      }
      
      public function get method_322() : Number
      {
         return this.var_192.scrollH;
      }
      
      public function set method_322(param1:Number) : void
      {
         drawNow();
         this.var_192.scrollH = param1;
      }
      
      public function get method_323() : Number
      {
         return this.var_192.scrollV;
      }
      
      public function set method_323(param1:Number) : void
      {
         drawNow();
         this.var_192.scrollV = param1;
      }
      
      public function get textWidth() : Number
      {
         drawNow();
         return this.var_192.textWidth;
      }
      
      public function get textHeight() : Number
      {
         drawNow();
         return this.var_192.textHeight;
      }
      
      public function get length() : Number
      {
         return this.var_192.text.length;
      }
      
      public function get restrict() : String
      {
         return this.var_192.restrict;
      }
      
      public function set restrict(param1:String) : void
      {
         if(componentInspectorSetting && param1 == "")
         {
            param1 = null;
         }
         this.var_192.restrict = param1;
      }
      
      public function get maxChars() : int
      {
         return this.var_192.maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         this.var_192.maxChars = param1;
      }
      
      public function get method_324() : int
      {
         return this.var_192.maxScrollH;
      }
      
      public function get method_325() : int
      {
         return this.var_192.maxScrollV;
      }
      
      public function get wordWrap() : Boolean
      {
         return this.var_226;
      }
      
      public function set wordWrap(param1:Boolean) : void
      {
         this.var_226 = param1;
         invalidate(class_98.STATE);
      }
      
      public function get selectionBeginIndex() : int
      {
         return this.var_192.selectionBeginIndex;
      }
      
      public function get selectionEndIndex() : int
      {
         return this.var_192.selectionEndIndex;
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this.var_192.displayAsPassword;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         this.var_192.displayAsPassword = param1;
      }
      
      public function get method_326() : Boolean
      {
         return this.var_225;
      }
      
      public function set method_326(param1:Boolean) : void
      {
         this.var_225 = param1;
         invalidate(class_98.STATE);
      }
      
      public function get method_327() : String
      {
         return IME.conversionMode;
      }
      
      public function set method_327(param1:String) : void
      {
         var_176 = param1;
      }
      
      public function get alwaysShowSelection() : Boolean
      {
         return this.var_192.alwaysShowSelection;
      }
      
      public function set alwaysShowSelection(param1:Boolean) : void
      {
         this.var_192.alwaysShowSelection = param1;
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         if(var_162 != null)
         {
            var_162.drawFocus(param1);
            return;
         }
         super.drawFocus(param1);
      }
      
      public function getLineMetrics(param1:int) : TextLineMetrics
      {
         return this.var_192.getLineMetrics(param1);
      }
      
      public function setSelection(param1:int, param2:int) : void
      {
         this.var_192.setSelection(param1,param2);
      }
      
      public function appendText(param1:String) : void
      {
         this.var_192.appendText(param1);
         invalidate(class_98.DATA);
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         tabChildren = true;
         this.var_192 = new TextField();
         addChild(this.var_192);
         this.method_328();
         this.var_230 = new class_73();
         this.var_230.name = "V";
         this.var_230.visible = false;
         this.var_230.focusEnabled = false;
         method_281(this.var_230,const_18);
         this.var_230.addEventListener(ScrollEvent.SCROLL,this.method_329,false,0,true);
         addChild(this.var_230);
         this.var_229 = new class_73();
         this.var_229.name = "H";
         this.var_229.visible = false;
         this.var_229.focusEnabled = false;
         this.var_229.direction = class_100.HORIZONTAL;
         method_281(this.var_229,const_18);
         this.var_229.addEventListener(ScrollEvent.SCROLL,this.method_329,false,0,true);
         addChild(this.var_229);
         this.var_192.addEventListener(TextEvent.TEXT_INPUT,this.method_330,false,0,true);
         this.var_192.addEventListener(Event.CHANGE,this.method_331,false,0,true);
         this.var_192.addEventListener(KeyboardEvent.KEY_DOWN,this.method_332,false,0,true);
         this.var_229.method_311 = this.var_192;
         this.var_230.method_311 = this.var_192;
         addEventListener(MouseEvent.MOUSE_WHEEL,this.method_333,false,0,true);
      }
      
      protected function method_328() : void
      {
         this.var_192.type = this.enabled && this.var_225?TextFieldType.INPUT:TextFieldType.DYNAMIC;
         this.var_192.selectable = this.enabled;
         this.var_192.wordWrap = this.var_226;
         this.var_192.multiline = true;
      }
      
      protected function method_332(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            dispatchEvent(new ComponentEvent(ComponentEvent.ENTER,true));
         }
      }
      
      protected function method_331(param1:Event) : void
      {
         param1.stopPropagation();
         dispatchEvent(new Event(Event.CHANGE,true));
         invalidate(class_98.DATA);
      }
      
      protected function method_330(param1:TextEvent) : void
      {
         param1.stopPropagation();
         dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT,true,false,param1.text));
      }
      
      protected function method_329(param1:ScrollEvent) : void
      {
         dispatchEvent(param1);
      }
      
      protected function method_333(param1:MouseEvent) : void
      {
         if(!this.enabled || !this.var_230.visible)
         {
            return;
         }
         this.var_230.scrollPosition = this.var_230.scrollPosition - param1.delta * this.var_230.lineScrollSize;
         dispatchEvent(new ScrollEvent(class_100.VERTICAL,param1.delta * this.var_230.lineScrollSize,this.var_230.scrollPosition));
      }
      
      protected function method_298() : *
      {
         var _loc1_:Object = method_272("embedFonts");
         if(_loc1_ != null)
         {
            this.var_192.embedFonts = _loc1_;
         }
      }
      
      override protected function draw() : void
      {
         if(method_278(class_98.STATE))
         {
            this.method_328();
         }
         if(method_278(class_98.STYLES))
         {
            this.method_300();
            this.method_298();
         }
         if(method_278(class_98.STYLES,class_98.STATE))
         {
            this.method_297();
            this.method_293();
            invalidate(class_98.SIZE,false);
         }
         if(method_278(class_98.SIZE,class_98.DATA))
         {
            this.method_294();
         }
         super.draw();
      }
      
      protected function method_300() : void
      {
         method_281(this.var_230,const_18);
         method_281(this.var_229,const_18);
      }
      
      protected function method_297() : void
      {
         var _loc1_:Object = class_67.getStyleDefinition();
         var _loc2_:TextFormat = !!this.enabled?_loc1_.defaultTextFormat as TextFormat:_loc1_.defaultDisabledTextFormat as TextFormat;
         this.var_192.setTextFormat(_loc2_);
         var _loc3_:TextFormat = method_272(!!this.enabled?"textFormat":"disabledTextFormat") as TextFormat;
         if(_loc3_ != null)
         {
            this.var_192.setTextFormat(_loc3_);
         }
         else
         {
            _loc3_ = _loc2_;
         }
         this.var_192.defaultTextFormat = _loc3_;
         this.method_298();
         if(this.var_231)
         {
            this.var_192.htmlText = this.var_232;
         }
      }
      
      protected function method_293() : void
      {
         var _loc1_:DisplayObject = this.background;
         var _loc2_:String = !!this.enabled?"upSkin":"disabledSkin";
         this.background = method_273(method_272(_loc2_));
         if(this.background != null)
         {
            addChildAt(this.background,0);
         }
         if(_loc1_ != null && _loc1_ != this.background && contains(_loc1_))
         {
            removeChild(_loc1_);
         }
      }
      
      protected function method_294() : void
      {
         var _loc1_:Number = Number(method_272("textPadding"));
         this.var_192.x = this.var_192.y = _loc1_;
         this.background.width = width;
         this.background.height = height;
         var _loc2_:Number = height;
         var _loc3_:Boolean = this.method_334();
         var _loc4_:Number = width - (!!_loc3_?this.var_230.width:0);
         var _loc5_:Boolean = this.method_335();
         if(_loc5_)
         {
            _loc2_ = _loc2_ - this.var_229.height;
         }
         this.method_336(_loc4_,_loc2_,_loc1_);
         if(_loc5_ && !_loc3_ && this.method_334())
         {
            _loc3_ = true;
            _loc4_ = _loc4_ - this.var_230.width;
            this.method_336(_loc4_,_loc2_,_loc1_);
         }
         if(_loc3_)
         {
            this.var_230.visible = true;
            this.var_230.x = width - this.var_230.width;
            this.var_230.height = _loc2_;
            this.var_230.visible = true;
            this.var_230.enabled = this.enabled;
         }
         else
         {
            this.var_230.visible = false;
         }
         if(_loc5_)
         {
            this.var_229.visible = true;
            this.var_229.y = height - this.var_229.height;
            this.var_229.width = _loc4_;
            this.var_229.visible = true;
            this.var_229.enabled = this.enabled;
         }
         else
         {
            this.var_229.visible = false;
         }
         this.method_337();
         addEventListener(Event.ENTER_FRAME,this.method_338,false,0,true);
      }
      
      protected function method_338(param1:Event) : void
      {
         if(this.var_233)
         {
            this.var_233 = false;
            this.method_294();
            return;
         }
         removeEventListener(Event.ENTER_FRAME,this.method_338);
      }
      
      protected function method_337() : *
      {
         this.var_229.method_94();
         this.var_230.method_94();
         this.var_230.enabled = this.enabled;
         this.var_229.enabled = this.enabled;
         this.var_229.drawNow();
         this.var_230.drawNow();
      }
      
      protected function method_334() : Boolean
      {
         if(this.var_228 == class_101.OFF)
         {
            return false;
         }
         if(this.var_228 == class_101.ON)
         {
            return true;
         }
         return this.var_192.maxScrollV > 1;
      }
      
      protected function method_335() : Boolean
      {
         if(this.var_227 == class_101.OFF)
         {
            return false;
         }
         if(this.var_227 == class_101.ON)
         {
            return true;
         }
         return this.var_192.maxScrollH > 0;
      }
      
      protected function method_336(param1:Number, param2:Number, param3:Number) : void
      {
         var _loc4_:Number = param1 - param3 * 2;
         var _loc5_:Number = param2 - param3 * 2;
         if(_loc4_ != this.var_192.width)
         {
            this.var_192.width = _loc4_;
         }
         if(_loc5_ != this.var_192.height)
         {
            this.var_192.height = _loc5_;
         }
      }
      
      override protected function method_286(param1:DisplayObject) : Boolean
      {
         return param1 == this.var_192 || super.method_286(param1);
      }
      
      override protected function method_254(param1:FocusEvent) : void
      {
         method_276(true);
         if(param1.target == this)
         {
            this["@doswf__s"].focus = this.var_192;
         }
         var _loc2_:class_95 = method_271;
         if(_loc2_)
         {
            if(this.method_326)
            {
               _loc2_.method_280 = true;
            }
            _loc2_.method_339 = false;
         }
         super.method_254(param1);
         if(this.method_326)
         {
            method_276(true);
         }
      }
      
      override protected function method_255(param1:FocusEvent) : void
      {
         var _loc2_:class_95 = method_271;
         if(_loc2_)
         {
            _loc2_.method_339 = true;
         }
         this.setSelection(0,0);
         super.method_255(param1);
         if(this.method_326)
         {
            method_276(false);
         }
      }
   }
}
