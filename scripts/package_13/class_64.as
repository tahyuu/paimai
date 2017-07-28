package package_13
{
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   import package_5.class_40;
   
   public interface class_64 extends IEventDispatcher
   {
       
      
      function connect(param1:String, param2:int) : void;
      
      function get bufferList() : Vector.<class_40>;
      
      function send(param1:ByteArray) : void;
   }
}
