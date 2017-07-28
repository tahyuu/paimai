package package_2
{
   import flash.display.MovieClip;
   import package_1.class_29;
   import package_3.class_4;
   
   public class class_5
   {
       
      
      public function class_5()
      {
         super();
      }
      
      public function method_23(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(class_4.method_1.method_3)
         {
            _loc4_ = new Date();
            _loc5_ = String(_loc4_.getHours()) + ":" + String(_loc4_.getMinutes()) + ":" + String(_loc4_.getSeconds()) + "." + String(_loc4_.getMilliseconds());
            class_29(class_4.method_7.method_8(class_29)).info(_loc5_ + "," + param1 + "," + param2 + ",requestid=" + param3);
         }
      }
      
      public function WriteLog2(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(class_4.method_1.method_3)
         {
            _loc4_ = new Date();
            _loc5_ = String(_loc4_.getHours()) + ":" + String(_loc4_.getMinutes()) + ":" + String(_loc4_.getSeconds()) + "." + String(_loc4_.getMilliseconds());
            class_29(class_4.method_7.method_8(class_29)).info(_loc5_ + "," + param1 + "," + param2 + "," + param3);
         }
      }
      
      public function method_24(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(class_4.method_1.method_3)
         {
            _loc4_ = new Date();
            _loc5_ = String(_loc4_.getHours()) + ":" + String(_loc4_.getMinutes()) + ":" + String(_loc4_.getSeconds()) + "." + String(_loc4_.getMilliseconds());
            class_29(class_4.method_7.method_8(class_29)).info(_loc5_ + "," + param1 + "," + param2 + "," + param3);
         }
      }
      
      public function WriteLogWithIpAndPort(param1:String, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(class_4.method_1.method_3)
         {
            §§push();
            if(!new MovieClip()["@doswf__s"])
            {
               return;
            }
            _loc5_ = new §§pop().Date();
            _loc6_ = String(_loc5_.getHours()) + ":" + String(_loc5_.getMinutes()) + ":" + String(_loc5_.getSeconds()) + "." + String(_loc5_.getMilliseconds());
            class_29(class_4.method_7.method_8(class_29)).info(_loc6_ + "," + param1 + "," + param2 + ",ip=" + param3 + ":" + param4);
         }
      }
      
      public function method_25(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(class_4.method_1.method_3)
         {
            §§push();
            if(!new MovieClip()["@doswf__s"])
            {
               return;
            }
            _loc4_ = new §§pop().Date();
            _loc5_ = String(_loc4_.getHours()) + ":" + String(_loc4_.getMinutes()) + ":" + String(_loc4_.getSeconds()) + "." + String(_loc4_.getMilliseconds());
            class_29(class_4.method_7.method_8(class_29)).info(_loc5_ + "," + param1 + "," + param2 + "," + "url:" + param3);
         }
      }
   }
}
