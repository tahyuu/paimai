package package_11
{
   import flash.media.Sound;
   import flash.net.LocalConnection;
   import flash.net.URLRequest;
   
   public class class_23
   {
       
      
      public function class_23()
      {
         super();
      }
      
      public function method_2() : void
      {
         var _loc1_:Sound = new Sound(new URLRequest(""));
         _loc1_.play();
         _loc1_.close();
      }
      
      public function method_120() : void
      {
         try
         {
            new LocalConnection().connect("Zebra-b090fd9c-9f1a-4c08-a4ed-ce74efa80551");
            new LocalConnection().connect("Zebra-b090fd9c-9f1a-4c08-a4ed-ce74efa80551");
            return;
         }
         catch(e:*)
         {
            return;
         }
      }
      
      public function get method_3() : Boolean
      {
         try
         {
         }
         catch(e:Error)
         {
            return true;
         }
         return false;
      }
   }
}
