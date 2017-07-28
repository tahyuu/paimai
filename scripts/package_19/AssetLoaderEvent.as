package package_19
{
   import flash.events.Event;
   import package_20.class_57;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const PROGRESS:String = "progress";
      
      public static const COMPLETE:String = "complete";
      
      public static const const_28:String = "error";
      
      public static const CHILDCOMPLETE:String = "childcomplete";
       
      
      public var var_304:class_57;
      
      public function AssetLoaderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("AssetLoaderEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}
