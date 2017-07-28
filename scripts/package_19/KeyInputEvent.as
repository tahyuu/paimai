package package_19
{
   import flash.events.Event;
   import package_8.class_62;
   
   public class KeyInputEvent extends Event
   {
      
      public static const RELEASEKEYGROUP:String = "releaseKeyGroup";
      
      public static const ACTIVEKEYGROUP:String = "activeKeyGroup";
       
      
      public var var_135:Vector.<class_62>;
      
      public var var_77:Vector.<int>;
      
      public function KeyInputEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
         this.var_135 = new Vector.<class_62>();
      }
      
      override public function clone() : Event
      {
         return new KeyInputEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("KeyInputEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}
