package package_19
{
   import flash.events.Event;
   
   public class BitmapBatchEvent extends Event
   {
      
      public static const DISPOSE:String = "dispose";
      
      public static const BITMAPCLICK:String = "bitmapClick";
      
      public static const BITMAPDOWN:String = "bitmapDown";
      
      public static const BITMAPHOVER:String = "bitmapHover";
      
      public static const BITMAPOUT:String = "bitmapOut";
       
      
      public function BitmapBatchEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new BitmapBatchEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("BitmapBatchEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}
