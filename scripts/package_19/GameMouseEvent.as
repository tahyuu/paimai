package package_19
{
   import flash.events.Event;
   import flash.geom.Point;
   
   public class GameMouseEvent extends Event
   {
      
      public static const const_4:String = "bitmapClick";
      
      public static const const_5:String = "bitmapMove";
      
      public static const const_6:String = "bitmapHover";
      
      public static const const_7:String = "bitmapOut";
      
      public static const const_8:String = "bitmapDown";
      
      public static const const_9:String = "bitmapUp";
      
      public static const const_1:String = "updateMousePosition";
       
      
      public var var_64:Point;
      
      public var var_65:Point;
      
      public function GameMouseEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_64 = new Point(0,0);
         this.var_65 = new Point(0,0);
         super(param1,param2,param3);
      }
      
      public function get method_86() : Point
      {
         return new Point(this.var_65.x - this.var_64.x,this.var_65.y - this.var_64.y);
      }
      
      override public function clone() : Event
      {
         return new GameMouseEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("GameMouseEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}
