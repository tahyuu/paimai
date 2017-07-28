package package_22
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import package_21.class_67;
   import package_21.class_98;
   import package_23.class_69;
   import package_25.ComponentEvent;
   
   public class class_70 extends class_68 implements class_69
   {
      
      private static var var_154:Object = {
         "icon":null,
         "upIcon":null,
         "downIcon":null,
         "overIcon":null,
         "disabledIcon":null,
         "selectedDisabledIcon":null,
         "selectedUpIcon":null,
         "selectedDownIcon":null,
         "selectedOverIcon":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":5,
         "embedFonts":false
      };
      
      public static var var_157:Function;
       
      
      public var var_192:TextField;
      
      protected var var_193:String = "right";
      
      protected var var_194:Boolean = false;
      
      protected var icon:DisplayObject;
      
      protected var var_195:String;
      
      protected var var_196:String = "class_125";
      
      protected var var_197:String = "center";
      
      public function class_70()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return mergeStyles(var_154,class_68.getStyleDefinition());
      }
      
      public function get label() : String
      {
         return this.var_196;
      }
      
      public function set label(param1:String) : void
      {
         this.var_196 = param1;
         if(this.var_192.text != this.var_196)
         {
            this.var_192.text = this.var_196;
            dispatchEvent(new ComponentEvent(ComponentEvent.const_11));
         }
         invalidate(class_98.SIZE);
         invalidate(class_98.STYLES);
      }
      
      public function get labelPlacement() : String
      {
         return this.var_193;
      }
      
      public function set labelPlacement(param1:String) : void
      {
         this.var_193 = param1;
         invalidate(class_98.SIZE);
      }
      
      public function get toggle() : Boolean
      {
         return this.var_194;
      }
      
      public function set toggle(param1:Boolean) : void
      {
         if(!param1 && super.selected)
         {
            this.selected = false;
         }
         this.var_194 = param1;
         if(this.var_194)
         {
            addEventListener(MouseEvent.CLICK,this.method_295,false,0,true);
         }
         else
         {
            removeEventListener(MouseEvent.CLICK,this.method_295);
         }
         invalidate(class_98.STATE);
      }
      
      protected function method_295(param1:MouseEvent) : void
      {
         this.selected = !this.selected;
         dispatchEvent(new Event(Event.CHANGE,true));
      }
      
      override public function get selected() : Boolean
      {
         return !!this.var_194?Boolean(var_188):false;
      }
      
      override public function set selected(param1:Boolean) : void
      {
         var_188 = param1;
         if(this.var_194)
         {
            invalidate(class_98.STATE);
         }
      }
      
      override protected function configUI() : void
      {
         super.configUI();
         this.var_192 = new TextField();
         this.var_192.type = TextFieldType.DYNAMIC;
         this.var_192.selectable = false;
         addChild(this.var_192);
      }
      
      override protected function draw() : void
      {
         if(this.var_192.text != this.var_196)
         {
            this.label = this.var_196;
         }
         if(method_278(class_98.STYLES,class_98.STATE))
         {
            method_293();
            this.method_296();
            this.method_297();
            invalidate(class_98.SIZE,false);
         }
         if(method_278(class_98.SIZE))
         {
            this.method_294();
         }
         if(method_278(class_98.SIZE,class_98.STYLES))
         {
            if(var_167 && method_271.method_280)
            {
               drawFocus(true);
            }
         }
         method_279();
      }
      
      protected function method_296() : void
      {
         var _loc1_:DisplayObject = this.icon;
         var _loc2_:* = !!enabled?var_187:"disabled";
         if(this.selected)
         {
            _loc2_ = "selected" + _loc2_.substr(0,1).toUpperCase() + _loc2_.substr(1);
         }
         _loc2_ = _loc2_ + "Icon";
         var _loc3_:Object = method_272(_loc2_);
         if(_loc3_ == null)
         {
            _loc3_ = method_272("icon");
         }
         if(_loc3_ != null)
         {
            this.icon = method_273(_loc3_);
         }
         if(this.icon != null)
         {
            addChildAt(this.icon,1);
         }
         if(_loc1_ != null && _loc1_ != this.icon)
         {
            removeChild(_loc1_);
         }
      }
      
      protected function method_297() : void
      {
         var _loc1_:Object = class_67.getStyleDefinition();
         var _loc2_:TextFormat = !!enabled?_loc1_.defaultTextFormat as TextFormat:_loc1_.defaultDisabledTextFormat as TextFormat;
         this.var_192.setTextFormat(_loc2_);
         var _loc3_:TextFormat = method_272(!!enabled?"textFormat":"disabledTextFormat") as TextFormat;
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
      }
      
      protected function method_298() : *
      {
         var _loc1_:Object = method_272("embedFonts");
         if(_loc1_ != null)
         {
            this.var_192.embedFonts = _loc1_;
         }
      }
      
      override protected function method_294() : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:Number = Number(method_272("textPadding"));
         var _loc2_:String = this.icon == null && this.var_197 == "center"?class_99.TOP:this.var_193;
         this.var_192.height = this.var_192.textHeight + 4;
         var _loc3_:Number = this.var_192.textWidth + 4;
         var _loc4_:Number = this.var_192.textHeight + 4;
         var _loc5_:Number = this.icon == null?0:Number(this.icon.width + _loc1_);
         var _loc6_:Number = this.icon == null?0:Number(this.icon.height + _loc1_);
         this.var_192.visible = this.label.length > 0;
         if(this.icon != null)
         {
            this.icon.x = Math.round((width - this.icon.width) / 2);
            this.icon.y = Math.round((height - this.icon.height) / 2);
         }
         if(this.var_192.visible == false)
         {
            this.var_192.width = 0;
            this.var_192.height = 0;
         }
         else if(_loc2_ == class_99.BOTTOM || _loc2_ == class_99.TOP)
         {
            _loc7_ = Math.max(0,Math.min(_loc3_,width - 2 * _loc1_));
            if(height - 2 > _loc4_)
            {
               _loc8_ = _loc4_;
            }
            else
            {
               _loc8_ = height - 2;
            }
            this.var_192.width = _loc3_ = _loc7_;
            this.var_192.height = _loc4_ = _loc8_;
            this.var_192.x = Math.round((width - _loc3_) / 2);
            this.var_192.y = Math.round((height - this.var_192.height - _loc6_) / 2 + (_loc2_ == class_99.BOTTOM?_loc6_:0));
            if(this.icon != null)
            {
               this.icon.y = Math.round(_loc2_ == class_99.BOTTOM?Number(this.var_192.y - _loc6_):Number(this.var_192.y + this.var_192.height + _loc1_));
            }
         }
         else
         {
            _loc7_ = Math.max(0,Math.min(_loc3_,width - _loc5_ - 2 * _loc1_));
            this.var_192.width = _loc3_ = _loc7_;
            this.var_192.x = Math.round((width - _loc3_ - _loc5_) / 2 + (_loc2_ != class_99.LEFT?_loc5_:0));
            this.var_192.y = Math.round((height - this.var_192.height) / 2);
            if(this.icon != null)
            {
               this.icon.x = Math.round(_loc2_ != class_99.LEFT?Number(this.var_192.x - _loc5_):Number(this.var_192.x + _loc3_ + _loc1_));
            }
         }
         super.method_294();
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         if(param1.keyCode == Keyboard.SPACE)
         {
            if(this.var_195 == null)
            {
               this.var_195 = var_187;
            }
            method_288("down");
            method_291();
         }
      }
      
      override protected function keyUpHandler(param1:KeyboardEvent) : void
      {
         if(!enabled)
         {
            return;
         }
         if(param1.keyCode == Keyboard.SPACE)
         {
            method_288(this.var_195);
            this.var_195 = null;
            method_292();
            dispatchEvent(new MouseEvent(MouseEvent.CLICK));
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(class_70.var_157 != null)
         {
            class_70.var_157(this);
         }
      }
   }
}
