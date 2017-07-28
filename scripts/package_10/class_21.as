package package_10
{
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.display.StageDisplayState;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import zebra.graphics.animation.class_61;
   
   public class class_21 extends EventDispatcher
   {
       
      
      private var var_73:Stage;
      
      private var var_74:class_61;
      
      public function class_21(param1:Stage)
      {
         super();
         this.var_73 = param1;
         this.var_74 = new class_61();
      }
      
      public function get method_110() : int
      {
         return this.var_73.frameRate;
      }
      
      public function get stage() : Stage
      {
         return this.var_73;
      }
      
      public function get method_111() : Boolean
      {
         return false;
      }
      
      public function get method_112() : Boolean
      {
         return this.var_73.displayState == StageDisplayState.FULL_SCREEN;
      }
      
      public function get method_113() : class_61
      {
         return this.var_74;
      }
      
      public function method_114(param1:DisplayObject) : Point
      {
         return param1.parent.localToGlobal(new Point(param1.x,param1.y));
      }
      
      public function method_115(param1:DisplayObject) : Point
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1["@doswf__s"])
         {
            _loc2_ = new Point(param1["@doswf__s"].mouseX,param1["@doswf__s"].mouseY);
            _loc3_ = this.method_114(param1);
            return new Point(_loc3_.x - _loc2_.x,_loc3_.y - _loc2_.y);
         }
         return null;
      }
   }
}
