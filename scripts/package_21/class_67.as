package package_21
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.system.IME;
   import flash.system.IMEConversionMode;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import package_23.class_69;
   import package_23.class_95;
   import package_23.class_96;
   import package_23.class_97;
   import package_25.ComponentEvent;
   
   public class class_67 extends Sprite
   {
      
      public static var var_153:Boolean = false;
      
      private static var var_154:Object = {
         "focusRectSkin":"focusRectSkin",
         "focusRectPadding":2,
         "textFormat":new TextFormat("_sans",11,0,false,false,false,"","",TextFormatAlign.LEFT,0,0,0,0),
         "disabledTextFormat":new TextFormat("_sans",11,10066329,false,false,false,"","",TextFormatAlign.LEFT,0,0,0,0),
         "defaultTextFormat":new TextFormat("_sans",11,0,false,false,false,"","",TextFormatAlign.LEFT,0,0,0,0),
         "defaultDisabledTextFormat":new TextFormat("_sans",11,10066329,false,false,false,"","",TextFormatAlign.LEFT,0,0,0,0)
      };
      
      private static var var_155:Dictionary = new Dictionary(true);
      
      private static var var_156:Dictionary = new Dictionary(true);
      
      public static var var_157:Function;
       
      
      public const name_1:String = "3.0.4.1";
      
      public var var_162:class_69;
      
      protected var var_163:Boolean = false;
      
      private var var_164:TextField;
      
      protected var var_158:Object;
      
      protected var var_159:Object;
      
      protected var var_161:Dictionary;
      
      protected var var_165:Boolean = false;
      
      protected var var_61:Boolean = true;
      
      protected var var_160:Object;
      
      protected var var_166:DisplayObject;
      
      protected var var_167:Boolean = false;
      
      private var var_168:Boolean = true;
      
      private var var_169:Boolean = true;
      
      protected var var_170:Number;
      
      protected var var_171:Number;
      
      protected var var_172:Number;
      
      protected var var_173:Number;
      
      protected var var_174:Number;
      
      protected var var_175:Number;
      
      protected var var_176:String = null;
      
      protected var var_177:String = null;
      
      protected var var_178:Boolean = false;
      
      protected var var_179:Boolean = false;
      
      public function class_67()
      {
         super();
         this.var_158 = {};
         this.var_159 = {};
         this.var_160 = {};
         this.var_161 = new Dictionary();
         class_97.method_253(this);
         this.configUI();
         this.invalidate(class_98.ALL);
         tabEnabled = this is class_69;
         focusRect = false;
         if(tabEnabled)
         {
            addEventListener(FocusEvent.FOCUS_IN,this.method_254);
            addEventListener(FocusEvent.FOCUS_OUT,this.method_255);
            addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler);
            addEventListener(KeyboardEvent.KEY_UP,this.keyUpHandler);
         }
         this.method_256();
         addEventListener(Event.ENTER_FRAME,this.method_257,false,0,true);
      }
      
      public static function getStyleDefinition() : Object
      {
         return var_154;
      }
      
      public static function mergeStyles(... rest) : Object
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:* = {};
         var _loc3_:uint = rest.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = rest[_loc4_];
            for(_loc6_ in _loc5_)
            {
               if(_loc2_[_loc6_] == null)
               {
                  _loc2_[_loc6_] = rest[_loc4_][_loc6_];
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function get componentInspectorSetting() : Boolean
      {
         return this.var_179;
      }
      
      public function set componentInspectorSetting(param1:Boolean) : void
      {
         this.var_179 = param1;
         if(this.var_179)
         {
            this.method_258();
         }
         else
         {
            this.method_259();
         }
      }
      
      protected function method_258() : void
      {
      }
      
      protected function method_259() : void
      {
      }
      
      public function get enabled() : Boolean
      {
         return this.var_61;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(param1 == this.var_61)
         {
            return;
         }
         this.var_61 = param1;
         this.invalidate(class_98.STATE);
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         this.var_170 = param1;
         this.var_171 = param2;
         this.invalidate(class_98.SIZE);
         dispatchEvent(new ComponentEvent(ComponentEvent.RESIZE,false));
      }
      
      override public function get width() : Number
      {
         return this.var_170;
      }
      
      override public function set width(param1:Number) : void
      {
         if(this.var_170 == param1)
         {
            return;
         }
         this.setSize(param1,this.height);
      }
      
      override public function get height() : Number
      {
         return this.var_171;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this.var_171 == param1)
         {
            return;
         }
         this.setSize(this.width,param1);
      }
      
      public function method_260(param1:String, param2:Object) : void
      {
         if(this.var_158[param1] === param2 && !(param2 is TextFormat))
         {
            return;
         }
         this.var_158[param1] = param2;
         this.invalidate(class_98.STYLES);
      }
      
      public function method_261(param1:String) : void
      {
         this.method_260(param1,null);
      }
      
      public function method_262(param1:String) : Object
      {
         return this.var_158[param1];
      }
      
      public function move(param1:Number, param2:Number) : void
      {
         this.var_172 = param1;
         this.var_173 = param2;
         super.x = Math.round(param1);
         super.y = Math.round(param2);
         dispatchEvent(new ComponentEvent(ComponentEvent.MOVE));
      }
      
      override public function get x() : Number
      {
         return !!isNaN(this.var_172)?Number(super.x):Number(this.var_172);
      }
      
      override public function set x(param1:Number) : void
      {
         this.move(param1,this.var_173);
      }
      
      override public function get y() : Number
      {
         return !!isNaN(this.var_173)?Number(super.y):Number(this.var_173);
      }
      
      override public function set y(param1:Number) : void
      {
         this.move(this.var_172,param1);
      }
      
      override public function get scaleX() : Number
      {
         return this.width / this.var_174;
      }
      
      override public function set scaleX(param1:Number) : void
      {
         this.setSize(this.var_174 * param1,this.height);
      }
      
      override public function get scaleY() : Number
      {
         return this.height / this.var_175;
      }
      
      override public function set scaleY(param1:Number) : void
      {
         this.setSize(this.width,this.var_175 * param1);
      }
      
      protected function method_263() : Number
      {
         return super.scaleY;
      }
      
      protected function method_264(param1:Number) : void
      {
         super.scaleY = param1;
      }
      
      protected function method_265() : Number
      {
         return super.scaleX;
      }
      
      protected function method_266(param1:Number) : void
      {
         super.scaleX = param1;
      }
      
      override public function get visible() : Boolean
      {
         return super.visible;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(super.visible == param1)
         {
            return;
         }
         super.visible = param1;
         var _loc2_:String = !!param1?ComponentEvent.SHOW:ComponentEvent.HIDE;
         dispatchEvent(new ComponentEvent(_loc2_,true));
      }
      
      public function method_267() : void
      {
         this.invalidate(class_98.ALL,false);
         this.draw();
      }
      
      public function invalidate(param1:String = "all", param2:Boolean = true) : void
      {
         this.var_160[param1] = true;
         if(param2)
         {
            this.method_268(this.draw);
         }
      }
      
      public function method_269(param1:String, param2:Object) : void
      {
         if(this.var_159[param1] === param2 && !(param2 is TextFormat))
         {
            return;
         }
         this.var_159[param1] = param2;
         if(this.var_158[param1] == null)
         {
            this.invalidate(class_98.STYLES);
         }
      }
      
      public function get focusEnabled() : Boolean
      {
         return this.var_168;
      }
      
      public function set focusEnabled(param1:Boolean) : void
      {
         this.var_168 = param1;
      }
      
      public function get method_270() : Boolean
      {
         return this.var_169;
      }
      
      public function set method_270(param1:Boolean) : void
      {
         this.var_169 = param1;
      }
      
      public function get method_271() : class_95
      {
         var o:DisplayObject = {};
         while(o)
         {
            if(class_67.var_155[o] != null)
            {
               return class_95(class_67.var_155[o]);
            }
            try
            {
               o = o.parent;
            }
            catch(se:SecurityError)
            {
               return null;
            }
         }
         return null;
      }
      
      public function set method_271(param1:class_95) : void
      {
         class_67.var_155["[object class_67]"] = param1;
      }
      
      public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         this.var_167 = param1;
         if(this.var_166 != null && contains(this.var_166))
         {
            removeChild(this.var_166);
            this.var_166 = null;
         }
         if(param1)
         {
            this.var_166 = this.method_273(this.method_272("focusRectSkin")) as Sprite;
            if(this.var_166 == null)
            {
               return;
            }
            _loc2_ = Number(this.method_272("focusRectPadding"));
            this.var_166.x = -_loc2_;
            this.var_166.y = -_loc2_;
            this.var_166.width = this.width + _loc2_ * 2;
            this.var_166.height = this.height + _loc2_ * 2;
            addChildAt(this.var_166,0);
         }
      }
      
      public function method_274() : void
      {
         if(this["@doswf__s"])
         {
            this["@doswf__s"].focus = this;
         }
      }
      
      public function method_275() : InteractiveObject
      {
         if(this["@doswf__s"])
         {
            return this["@doswf__s"].focus;
         }
         return null;
      }
      
      protected function method_276(param1:Boolean) : *
      {
         var enabled:Boolean = param1;
         if(this.var_176 != null)
         {
            if(enabled)
            {
               IME.enabled = true;
               this.var_177 = IME.conversionMode;
               try
               {
                  if(!this.var_178 && IME.conversionMode != IMEConversionMode.UNKNOWN)
                  {
                     IME.conversionMode = this.var_176;
                  }
                  this.var_178 = false;
                  return;
               }
               catch(e:Error)
               {
                  var_178 = true;
                  throw new Error("IME mode not supported: " + var_176);
               }
            }
            else
            {
               if(IME.conversionMode != IMEConversionMode.UNKNOWN && this.var_177 != IMEConversionMode.UNKNOWN)
               {
                  IME.conversionMode = this.var_177;
               }
               IME.enabled = false;
            }
         }
      }
      
      public function drawNow() : void
      {
         this.draw();
      }
      
      protected function configUI() : void
      {
         this.var_163 = this.method_277();
         var _loc1_:Number = rotation;
         rotation = 0;
         var _loc2_:Number = super.width;
         var _loc3_:Number = super.height;
         super.scaleY = 1;
         super.scaleX = 1;
         this.setSize(_loc2_,_loc3_);
         this.move(super.x,super.y);
         rotation = _loc1_;
         this.var_174 = _loc2_;
         this.var_175 = _loc3_;
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
      
      protected function method_277() : Boolean
      {
         var _loc1_:* = null;
         if(parent == null)
         {
            return false;
         }
         try
         {
            _loc1_ = getQualifiedClassName(parent);
         }
         catch(e:Error)
         {
         }
         return _loc1_ == "fl.livepreview::LivePreviewParent";
      }
      
      protected function method_278(param1:String, ... rest) : Boolean
      {
         if(this.var_160[param1] || this.var_160[class_98.ALL])
         {
            return true;
         }
         while(rest.length > 0)
         {
            if(this.var_160[rest.pop()])
            {
               return true;
            }
         }
         return false;
      }
      
      protected function method_279() : void
      {
         this.var_160 = {};
      }
      
      protected function draw() : void
      {
         if(this.method_278(class_98.SIZE,class_98.STYLES))
         {
            if(this.var_167 && this.method_271.method_280)
            {
               this.drawFocus(true);
            }
         }
         this.method_279();
      }
      
      protected function method_273(param1:Object) : DisplayObject
      {
         var skin:Object = param1;
         var var_180:Object = null;
         var var_181:Object = null;
         if(skin is Class)
         {
            var_180 = new skin();
            if(var_180 is BitmapData)
            {
               return new Bitmap(var_180 as BitmapData);
            }
            return var_180 as DisplayObject;
         }
         if(skin is DisplayObject)
         {
            (skin as DisplayObject).x = 0;
            (skin as DisplayObject).y = 0;
            return skin as DisplayObject;
         }
         if(skin is BitmapData)
         {
            return skin as BitmapData;
            §§push();
         }
         else
         {
            var_181 = getDefinitionByName(skin.toString());
            if(var_181 == null)
            {
               return null;
            }
            var_180 = new var_181();
            if(var_180 is BitmapData)
            {
               return new Bitmap(var_180 as BitmapData);
            }
            return var_180 as DisplayObject;
         }
      }
      
      protected function method_272(param1:String) : Object
      {
         return this.var_158[param1] == null?this.var_159[param1]:this.var_158[param1];
      }
      
      protected function method_281(param1:class_67, param2:Object) : void
      {
         var _loc3_:* = null;
         for(_loc3_ in param2)
         {
            param1.method_260(_loc3_,this.method_272(param2[_loc3_]));
         }
      }
      
      protected function method_268(param1:Function) : void
      {
         var var_182:Function = param1;
         if(var_153)
         {
            return;
         }
         this.var_161[var_182] = true;
         if(this["@doswf__s"] != null)
         {
            try
            {
               this["@doswf__s"].addEventListener(Event.RENDER,this.method_282,false,0,true);
               this["@doswf__s"].invalidate();
               return;
            }
            catch(se:SecurityError)
            {
               addEventListener(Event.ENTER_FRAME,method_282,false,0,true);
               return;
            }
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.method_282,false,0,true);
         }
      }
      
      private function method_282(param1:Event) : void
      {
         var method:Object = null;
         var package_24:Event = param1;
         if(package_24.type == Event.ADDED_TO_STAGE)
         {
            try
            {
               removeEventListener(Event.ADDED_TO_STAGE,this.method_282);
               this["@doswf__s"].addEventListener(Event.RENDER,this.method_282,false,0,true);
               this["@doswf__s"].invalidate();
               return;
            }
            catch(se1:SecurityError)
            {
               addEventListener(Event.ENTER_FRAME,method_282,false,0,true);
            }
            var_153 = true;
            var var_183:Dictionary = this.var_161;
            for(method in var_183)
            {
               method();
               delete var_183[method];
            }
            var_153 = false;
            return;
         }
         package_24.target.removeEventListener(Event.RENDER,this.method_282);
         package_24.target.removeEventListener(Event.ENTER_FRAME,this.method_282);
         try
         {
            if(this["@doswf__s"] == null)
            {
               addEventListener(Event.ADDED_TO_STAGE,this.method_282,false,0,true);
               return;
            }
         }
         catch(se2:SecurityError)
         {
         }
         var_153 = true;
         var_183 = this.var_161;
         addr142:
         for(method in var_183)
         {
            method();
            delete var_183[method];
            §§goto(addr142);
         }
         var_153 = false;
      }
      
      private function method_256() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this["@doswf__s"] == null)
         {
            addEventListener(Event.ADDED_TO_STAGE,this.method_283,false,0,true);
         }
         else
         {
            this.method_284();
            _loc1_ = this.method_271;
            if(_loc1_ != null)
            {
               _loc2_ = var_156[_loc1_];
               if(_loc2_ == null)
               {
                  _loc2_ = new Dictionary(true);
                  var_156[_loc1_] = _loc2_;
               }
               _loc2_["[object class_67]"] = true;
            }
         }
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_285);
      }
      
      private function method_283(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_283);
         this.method_256();
      }
      
      private function method_285(param1:Event) : void
      {
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = null;
         removeEventListener(Event.REMOVED_FROM_STAGE,this.method_285);
         addEventListener(Event.ADDED_TO_STAGE,this.method_283);
         var _loc2_:class_95 = this.method_271;
         if(_loc2_ != null)
         {
            _loc3_ = var_156[_loc2_];
            if(_loc3_ != null)
            {
               delete _loc3_["[object class_67]"];
               _loc4_ = true;
               for(_loc5_ in _loc3_)
               {
                  _loc4_ = false;
               }
               if(_loc4_)
               {
                  delete var_156[_loc2_];
                  _loc3_ = null;
               }
            }
            if(_loc3_ == null)
            {
               _loc2_.deactivate();
               for(_loc6_ in var_155)
               {
                  _loc7_ = var_155[_loc6_];
                  if(_loc2_ == _loc7_)
                  {
                     delete var_155[_loc6_];
                  }
               }
            }
         }
      }
      
      protected function method_284() : void
      {
         var var_184:Boolean = true;
         try
         {
            this["@doswf__s"].getChildAt(0);
         }
         catch(se:SecurityError)
         {
            var_184 = false;
         }
         var var_185:DisplayObjectContainer = null;
         if(var_184)
         {
            var_185 = this["@doswf__s"];
         }
         else
         {
            var_185 = {};
            try
            {
               while(var_185.parent != null)
               {
                  var_185 = var_185.parent;
               }
            }
            catch(se:SecurityError)
            {
            }
         }
         if(var_155[var_185] == null)
         {
            var_155[var_185] = new class_96(var_185);
         }
      }
      
      protected function method_286(param1:DisplayObject) : Boolean
      {
         return param1 == this;
      }
      
      protected function method_254(param1:FocusEvent) : void
      {
         var _loc2_:* = null;
         if(this.method_286(param1.target as DisplayObject))
         {
            _loc2_ = this.method_271;
            if(_loc2_ && _loc2_.method_280)
            {
               this.drawFocus(true);
               this.var_167 = true;
            }
         }
      }
      
      protected function method_255(param1:FocusEvent) : void
      {
         if(this.method_286(param1.target as DisplayObject))
         {
            this.drawFocus(false);
            this.var_167 = false;
         }
      }
      
      protected function keyDownHandler(param1:KeyboardEvent) : void
      {
      }
      
      protected function keyUpHandler(param1:KeyboardEvent) : void
      {
      }
      
      protected function method_257(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.method_257);
         this.initializeAccessibility();
      }
      
      protected function initializeAccessibility() : void
      {
         if(class_67.var_157 != null)
         {
            class_67.var_157(this);
         }
      }
   }
}
