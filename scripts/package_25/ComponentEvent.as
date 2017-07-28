package package_25
{
   import flash.events.Event;
   
   public class ComponentEvent extends Event
   {
      
      public static const const_10:String = "buttonDown";
      
      public static const const_11:String = "labelChange";
      
      public static const HIDE:String = "hide";
      
      public static const SHOW:String = "show";
      
      public static const RESIZE:String = "resize";
      
      public static const MOVE:String = "move";
      
      public static const ENTER:String = "enter";
       
      
      public function ComponentEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function toString() : String
      {
         return formatToString("ComponentEvent","type","bubbles","cancelable");
      }
      
      override public function clone() : Event
      {
         return new ComponentEvent(type,bubbles,cancelable);
      }
   }
}
