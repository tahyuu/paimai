package package_15
{
   import flash.utils.setTimeout;
   import package_1.class_29;
   import package_13.class_27;
   import package_2.class_2;
   import package_2.class_5;
   import package_3.class_4;
   
   public class class_43
   {
       
      
      private var var_118;
      
      private var var_117:String;
      
      public var socket:class_27;
      
      public var logappliction:class_5;
      
      public var var_52:Function;
      
      public var closeHandler:Function;
      
      public var ioErrorHandler:Function;
      
      public var securityErrorHandler:Function;
      
      public function class_43(param1:String, param2:*)
      {
         this.logappliction = new class_5();
         super();
         this.var_117 = param1;
         this.var_118 = param2;
         class_4.method_7.method_98("socketControl");
         class_4.method_7.method_97("socketControl",this);
         this.method_196();
      }
      
      private function method_196() : void
      {
         this.socket = new class_27();
         this.socket.connect(this.var_118.ip,this.var_118.port);
         var _loc1_:String = this.var_118.ip;
         var _loc2_:String = this.var_118.port;
         var _loc3_:Date = new Date();
         var _loc4_:String = String(_loc3_.getHours()) + ":" + String(_loc3_.getMinutes()) + ":" + String(_loc3_.getSeconds()) + "." + String(_loc3_.getMilliseconds());
         class_29(class_4.method_7.method_8(class_29)).info(_loc4_ + "," + "建立socket连接" + "," + "socket" + "," + "IP:" + _loc1_ + "port:" + _loc2_);
         this.socket.connectHandler = this.method_126;
         this.socket.closeHandler = this.method_129;
         this.socket.ioErrorHandler = this.method_127;
         this.socket.securityErrorHandler = this.method_128;
      }
      
      public function reconnect(param1:class_2, param2:int = 1000) : void
      {
         var var_118:class_2 = param1;
         var timer:int = param2;
         setTimeout(function():*
         {
            var _loc1_:* = null;
            var _loc2_:* = null;
            if(!Main.var_1)
            {
               var_118.method_11();
               socket.connect(var_118.ip,var_118.port);
               _loc1_ = var_118.ip;
               _loc2_ = String(var_118.port);
               logappliction.WriteLogWithIpAndPort("投标板块","断线重连",_loc1_,_loc2_);
            }
         },timer);
      }
      
      private function method_128(param1:class_27) : void
      {
         if(this.securityErrorHandler != null)
         {
            this.securityErrorHandler();
         }
      }
      
      private function method_127(param1:class_27) : void
      {
         if(this.ioErrorHandler != null)
         {
            this.ioErrorHandler();
         }
      }
      
      private function method_129(param1:class_27) : void
      {
         if(this.closeHandler != null)
         {
            this.closeHandler();
         }
      }
      
      private function method_126(param1:class_27) : void
      {
         if(this.var_52 != null)
         {
            this.var_52();
         }
      }
      
      public function close() : void
      {
         this.socket.close();
      }
   }
}
