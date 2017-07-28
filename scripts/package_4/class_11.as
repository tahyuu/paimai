package package_4
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   class class_11 extends Sprite
   {
       
      
      private var var_42:Boolean;
      
      private var var_43:Boolean;
      
      public var var_44:Function;
      
      public var var_45:Function;
      
      function class_11()
      {
         super();
         this.method_48();
         this.method_49();
         this.addEventListener(Event.ADDED_TO_STAGE,this.method_50);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.method_51);
      }
      
      protected function method_48() : void
      {
      }
      
      protected function method_49() : void
      {
      }
      
      protected function method_52() : void
      {
      }
      
      protected function method_53() : void
      {
      }
      
      private function method_50(param1:Event) : void
      {
         this.method_52();
         if(this.var_44 != null)
         {
            this.var_44(this);
         }
         this.var_43 = true;
      }
      
      private function method_51(param1:Event) : void
      {
         this.method_52();
         this.var_43 = false;
         if(this.var_45 != null)
         {
            this.var_45(this);
         }
      }
      
      public function get method_54() : Boolean
      {
         return this.var_43;
      }
      
      public function get method_55() : Boolean
      {
         return this.var_42;
      }
      
      protected function method_56(param1:Boolean = false) : void
      {
         if(this.method_55)
         {
            return;
         }
         if(!this.var_42)
         {
            this.var_42 = true;
            this.var_44 = null;
            this.var_45 = null;
            this.dispose();
            if(!param1 && this.parent)
            {
               this.parent.removeChild(this);
            }
         }
      }
      
      public function dispose() : void
      {
      }
      
      public function method_57() : Boolean
      {
         if(!visible || !this.mouseEnabled || this["@doswf__s"] == null)
         {
            return false;
         }
         var _loc1_:Point = this.method_58();
         var _loc2_:Rectangle = new Rectangle(_loc1_.x,_loc1_.y,this.width,this.height);
         return _loc2_.containsPoint(new Point(this["@doswf__s"].mouseX,this["@doswf__s"].mouseY));
      }
      
      public function method_58() : Point
      {
         return this.method_59(this);
      }
      
      public function method_60() : Rectangle
      {
         var _loc1_:Point = this.method_58();
         return new Rectangle(_loc1_.x,_loc1_.y,width,height);
      }
      
      protected function method_59(param1:DisplayObject) : Point
      {
         var _loc2_:Point = new Point();
         while(param1 != null)
         {
            _loc2_.x = _loc2_.x + param1.x;
            _loc2_.y = _loc2_.y + param1.y;
            param1 = param1.parent;
         }
         return _loc2_;
      }
   }
}
