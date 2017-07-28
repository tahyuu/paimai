package package_25
{
   import flash.events.Event;
   
   public class ScrollEvent extends Event
   {
      
      public static const SCROLL:String = "scroll";
       
      
      private var var_206:String;
      
      private var var_296:Number;
      
      private var var_109:Number;
      
      public function ScrollEvent(param1:String, param2:Number, param3:Number)
      {
         super(ScrollEvent.SCROLL,false,false);
         this.var_206 = param1;
         this.var_296 = param2;
         this.var_109 = param3;
      }
      
      public function get direction() : String
      {
         return this.var_206;
      }
      
      public function get delta() : Number
      {
         return this.var_296;
      }
      
      public function get position() : Number
      {
         return this.var_109;
      }
      
      override public function toString() : String
      {
         return formatToString("ScrollEvent","type","bubbles","cancelable","direction","delta","position");
      }
      
      override public function clone() : Event
      {
         return new ScrollEvent(this.var_206,this.var_296,this.var_109);
      }
   }
}
