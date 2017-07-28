package package_19
{
   import flash.events.Event;
   import package_5.class_40;
   
   public class GameSocketEvent extends Event
   {
      
      public static const CONNECTSUCCESS:String = "connectSuccess";
      
      public static const CLOSE:String = "close";
      
      public static const IOERROR:String = "ioerror";
      
      public static const SECURITYERROR:String = "securityerror";
      
      public static const COMMANDREADER:String = "commandreader";
       
      
      public var var_56:class_40;
      
      public function GameSocketEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new GameSocketEvent(type,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("GameSocketEvent","type","bubbles","cancelable","eventPhase");
      }
   }
}
