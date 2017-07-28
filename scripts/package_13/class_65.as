package package_13
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import package_18.class_94;
   import package_19.GameSocketEvent;
   import package_3.class_4;
   import package_5.class_40;
   
   class class_65 extends EventDispatcher implements class_64
   {
       
      
      private var var_138:Socket;
      
      private var var_139:ByteArray;
      
      private var var_141:String;
      
      private var var_142:int;
      
      private var var_143:uint = 4;
      
      private var var_140:class_93;
      
      private var var_137:Vector.<class_40>;
      
      public var ioErrorHandler:Function;
      
      public var securityErrorHandler:Function;
      
      public var connectHandler:Function;
      
      public var closeHandler:Function;
      
      public var sendBytesByConnect:Function;
      
      private var var_83:String;
      
      private var var_31:class_27;
      
      function class_65(param1:class_27)
      {
         super();
         this.var_31 = param1;
         this.var_137 = new Vector.<class_40>();
         this.var_138 = new Socket();
         this.var_139 = new ByteArray();
         this.var_140 = new class_93(this.var_137,this.var_31);
         class_4.method_18.method_82(this.var_140);
      }
      
      public function connect(param1:String, param2:int) : void
      {
         this.var_141 = param1;
         this.var_142 = param2;
         this.var_138.addEventListener(Event.CONNECT,this.method_235);
         this.var_138.addEventListener(ProgressEvent.SOCKET_DATA,this.method_236);
         this.var_138.addEventListener(Event.CLOSE,this.method_237);
         this.var_138.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.method_238);
         this.var_138.addEventListener(IOErrorEvent.IO_ERROR,this.method_239);
         this.var_138.connect(param1,param2);
         this.var_138.timeout = 5000;
      }
      
      public function close() : void
      {
         try
         {
            this.var_138.close();
            return;
         }
         catch(e:*)
         {
            return;
         }
      }
      
      private function method_239(param1:IOErrorEvent) : void
      {
         if(this.ioErrorHandler != null)
         {
            this.ioErrorHandler();
         }
         dispatchEvent(new GameSocketEvent(GameSocketEvent.IOERROR));
      }
      
      private function method_238(param1:SecurityErrorEvent) : void
      {
         if(this.securityErrorHandler != null)
         {
            this.securityErrorHandler();
         }
         dispatchEvent(new GameSocketEvent(GameSocketEvent.SECURITYERROR));
      }
      
      private function method_235(param1:Event) : void
      {
         if(this.sendBytesByConnect != null)
         {
            this.sendBytesByConnect();
         }
         if(this.connectHandler != null)
         {
            this.connectHandler();
         }
         dispatchEvent(new GameSocketEvent(GameSocketEvent.CONNECTSUCCESS));
      }
      
      private function method_240() : void
      {
      }
      
      private function method_237(param1:Event) : void
      {
         if(this.closeHandler != null)
         {
            this.closeHandler();
         }
         dispatchEvent(new GameSocketEvent(GameSocketEvent.CLOSE));
      }
      
      protected function method_241() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_139.length >= 4)
         {
            this.var_139.position = 0;
            _loc1_ = uint(this.var_139.readUnsignedInt());
            if(this.var_139.length >= _loc1_)
            {
               _loc2_ = new ByteArray();
               _loc2_.writeBytes(this.var_139,0,_loc1_);
               _loc3_ = new class_40(_loc2_);
               this.var_137.push(_loc3_);
               _loc4_ = new ByteArray();
               _loc4_.writeBytes(this.var_139,_loc1_);
               this.var_139.clear();
               this.var_139 = _loc4_;
               this.method_241();
            }
         }
      }
      
      protected function method_236(param1:ProgressEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_138.bytesAvailable > 0)
         {
            this.var_139.position = this.var_139.length;
            _loc2_ = new ByteArray();
            this.var_138.readBytes(_loc2_);
            this.var_139.writeBytes(_loc2_);
            this.method_241();
         }
      }
      
      public function send(param1:ByteArray) : void
      {
         if(this.var_138.connected)
         {
            this.var_138.writeBytes(param1);
            this.var_138.flush();
         }
      }
      
      public function sendCommand(param1:String, param2:ByteArray) : void
      {
         this.send(class_94.method_242(param1,param2));
      }
      
      public function get bufferList() : Vector.<class_40>
      {
         return this.var_137;
      }
      
      public function get ip() : String
      {
         return this.var_141;
      }
      
      public function get port() : int
      {
         return this.var_142;
      }
      
      public function get isConnected() : Boolean
      {
         return this.var_138.connected;
      }
   }
}
