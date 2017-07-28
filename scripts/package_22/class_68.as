package package_22
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import package_21.class_67;
   import package_21.class_98;
   import package_25.ComponentEvent;
   
   public class class_68 extends class_67
   {
      
      private static var var_154:Object = {
         "upSkin":"Button_upSkin",
         "downSkin":"Button_downSkin",
         "overSkin":"Button_overSkin",
         "disabledSkin":"Button_disabledSkin",
         "selectedDisabledSkin":"Button_selectedDisabledSkin",
         "selectedUpSkin":"Button_selectedUpSkin",
         "selectedDownSkin":"Button_selectedDownSkin",
         "selectedOverSkin":"Button_selectedOverSkin",
         "focusRectSkin":null,
         "focusRectPadding":null,
         "repeatDelay":500,
         "repeatInterval":35
      };
       
      
      protected var background:DisplayObject;
      
      protected var var_187:String;
      
      protected var var_188:Boolean = false;
      
      protected var var_189:Boolean = false;
      
      protected var var_186:Timer;
      
      private var var_190:Boolean = false;
      
      private var var_191:String;
      
      public function class_68()
      {
         super();
         buttonMode = true;
         mouseChildren = false;
         useHandCursor = false;
         this.method_287();
         this.method_288("up");
         this.var_186 = new Timer(1,0);
         this.var_186.addEventListener(TimerEvent.TIMER,this.buttonDown,false,0,true);
      }
      
      public static function getStyleDefinition() : Object
      {
         return var_154;
      }
      
      override public function get enabled() : Boolean
      {
         return super.enabled;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         mouseEnabled = param1;
      }
      
      public function get selected() : Boolean
      {
         return this.var_188;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this.var_188 == param1)
         {
            return;
         }
         this.var_188 = param1;
         invalidate(class_98.STATE);
      }
      
      public function get method_289() : Boolean
      {
         return this.var_189;
      }
      
      public function set method_289(param1:Boolean) : void
      {
         this.var_189 = param1;
      }
      
      public function set mouseStateLocked(param1:Boolean) : void
      {
         this.var_190 = param1;
         if(param1 == false)
         {
            this.method_288(this.var_191);
         }
         else
         {
            this.var_191 = this.var_187;
         }
      }
      
      public function method_288(param1:String) : void
      {
         if(this.var_190)
         {
            this.var_191 = param1;
            return;
         }
         if(this.var_187 == param1)
         {
            return;
         }
         this.var_187 = param1;
         invalidate(class_98.STATE);
      }
      
      protected function method_287() : void
      {
         addEventListener(MouseEvent.ROLL_OVER,this.method_290,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_290,false,0,true);
         addEventListener(MouseEvent.MOUSE_UP,this.method_290,false,0,true);
         addEventListener(MouseEvent.ROLL_OUT,this.method_290,false,0,true);
      }
      
      protected function method_290(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.MOUSE_DOWN)
         {
            this.method_288("down");
            this.method_291();
         }
         else if(param1.type == MouseEvent.ROLL_OVER || param1.type == MouseEvent.MOUSE_UP)
         {
            this.method_288("over");
            this.method_292();
         }
         else if(param1.type == MouseEvent.ROLL_OUT)
         {
            this.method_288("up");
            this.method_292();
         }
      }
      
      protected function method_291() : void
      {
         if(this.var_189)
         {
            this.var_186.delay = Number(method_272("repeatDelay"));
            this.var_186.start();
         }
         dispatchEvent(new ComponentEvent(ComponentEvent.const_10,true));
      }
      
      protected function buttonDown(param1:TimerEvent) : void
      {
         if(!this.var_189)
         {
            this.method_292();
            return;
         }
         if(this.var_186.currentCount == 1)
         {
            this.var_186.delay = Number(method_272("repeatInterval"));
         }
         dispatchEvent(new ComponentEvent(ComponentEvent.const_10,true));
      }
      
      protected function method_292() : void
      {
         this.var_186.reset();
      }
      
      override protected function draw() : void
      {
         if(method_278(class_98.STYLES,class_98.STATE))
         {
            this.method_293();
            invalidate(class_98.SIZE,false);
         }
         if(method_278(class_98.SIZE))
         {
            this.method_294();
         }
         super.draw();
      }
      
      protected function method_293() : void
      {
         var _loc1_:* = !!this.enabled?this.var_187:"disabled";
         if(this.selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ = _loc1_ + "Skin";
         var _loc2_:DisplayObject = this.background;
         this.background = method_273(method_272(_loc1_));
         addChildAt(this.background,0);
         if(_loc2_ != null && _loc2_ != this.background)
         {
            removeChild(_loc2_);
         }
      }
      
      protected function method_294() : void
      {
         this.background.width = width;
         this.background.height = height;
      }
   }
}
