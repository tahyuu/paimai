package package_22
{
   import flash.display.DisplayObject;
   import package_21.class_67;
   import package_21.class_98;
   import package_23.class_69;
   
   public class class_71 extends class_70 implements class_69
   {
      
      private static var var_154:Object = {
         "emphasizedSkin":"Button_emphasizedSkin",
         "emphasizedPadding":2
      };
      
      public static var var_157:Function;
       
      
      protected var var_198:Boolean = false;
      
      protected var var_199:DisplayObject;
      
      public function class_71()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return class_67.mergeStyles(class_70.getStyleDefinition(),var_154);
      }
      
      public function get method_142() : Boolean
      {
         return this.var_198;
      }
      
      public function set method_142(param1:Boolean) : void
      {
         this.var_198 = param1;
         invalidate(class_98.STYLES);
      }
      
      override protected function draw() : void
      {
         if(method_278(class_98.STYLES) || method_278(class_98.SIZE))
         {
            this.method_299();
         }
         super.draw();
         if(this.var_199 != null)
         {
            setChildIndex(this.var_199,numChildren - 1);
         }
      }
      
      protected function method_299() : void
      {
         var _loc2_:Number = NaN;
         if(this.var_199 != null)
         {
            removeChild(this.var_199);
         }
         this.var_199 = null;
         if(!this.var_198)
         {
            return;
         }
         var _loc1_:Object = method_272("emphasizedSkin");
         if(_loc1_ != null)
         {
            this.var_199 = method_273(_loc1_);
         }
         if(this.var_199 != null)
         {
            addChildAt(this.var_199,0);
            _loc2_ = Number(method_272("emphasizedPadding"));
            this.var_199.x = this.var_199.y = -_loc2_;
            this.var_199.width = width + _loc2_ * 2;
            this.var_199.height = height + _loc2_ * 2;
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:* = NaN;
         var _loc3_:* = undefined;
         super.drawFocus(param1);
         if(param1)
         {
            _loc2_ = Number(Number(method_272("emphasizedPadding")));
            if(_loc2_ < 0 || !this.var_198)
            {
               _loc2_ = 0;
            }
            _loc3_ = method_272("focusRectPadding");
            _loc3_ = _loc3_ == null?2:_loc3_;
            _loc3_ = _loc3_ + _loc2_;
            var_166.x = -_loc3_;
            var_166.y = -_loc3_;
            var_166.width = width + _loc3_ * 2;
            var_166.height = height + _loc3_ * 2;
         }
      }
      
      override protected function initializeAccessibility() : void
      {
         if(class_71.var_157 != null)
         {
            class_71.var_157(this);
         }
      }
   }
}
