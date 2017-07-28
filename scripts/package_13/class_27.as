package package_13
{
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import package_3.class_4;
   import zebra.directEvent.DirectEventParameter;
   
   public class class_27
   {
      
      public static var var_14:int = 0;
      
      public static var serverType:uint;
       
      
      public var var_84:String = "GameSocketThreadConnect_Success";
      
      public var var_85:String = "GameSocketThread_Close";
      
      public var var_86:String = "GameSocketThread_ioerror";
      
      public var var_87:String = "GameSocketThread_securityerror";
      
      private var _socketManager:class_65;
      
      public var var_88:Function;
      
      private var var_89:uint = 3000;
      
      private var var_90:Boolean;
      
      private var var_83:String = "GameSocketThread_channel";
      
      public var connectHandler:Function;
      
      public var ioErrorHandler:Function;
      
      public var securityErrorHandler:Function;
      
      public var closeHandler:Function;
      
      public function class_27()
      {
         super();
         var_14++;
         this.var_83 = "GameSocketThread_channel" + var_14;
         this.var_84 = "GameSocketThreadConnect_Success" + var_14;
         this.var_85 = "GameSocketThread_Close" + var_14;
         this.var_86 = "GameSocketThread_ioerror" + var_14;
         this.var_87 = "GameSocketThread_securityerror" + var_14;
         this._socketManager = new class_65(this);
         this._socketManager.connectHandler = this.method_126;
         this._socketManager.ioErrorHandler = this.method_127;
         this._socketManager.securityErrorHandler = this.method_128;
         this._socketManager.closeHandler = this.method_129;
      }
      
      public function method_130(param1:Function) : void
      {
         this._socketManager.sendBytesByConnect = param1;
      }
      
      public function receive(param1:String, param2:*) : void
      {
         class_4.method_17.receive(param1,param2,this.var_83);
      }
      
      public function method_84(param1:String, param2:*) : void
      {
         class_4.method_17.method_84(param1,param2,this.var_83);
      }
      
      public function send(param1:String, param2:ByteArray) : void
      {
         this._socketManager.sendCommand(param1,param2);
      }
      
      private function method_129() : void
      {
         if(this.closeHandler != null)
         {
            this.closeHandler(this);
         }
         class_4.method_17.send(this.var_85,new DirectEventParameter(),this.var_83);
         if(this.var_90)
         {
            setTimeout(function():void
            {
               class_4.method_21.connect(_socketManager.ip,_socketManager.port,serverType);
            },this.var_89);
         }
      }
      
      private function method_127() : void
      {
         if(this.ioErrorHandler != null)
         {
            this.ioErrorHandler(this);
         }
         class_4.method_17.send(this.var_86,new DirectEventParameter(),this.var_83);
         if(this.var_90)
         {
            setTimeout(function():void
            {
               class_4.method_21.connect(_socketManager.ip,_socketManager.port,serverType);
            },this.var_89);
         }
      }
      
      private function method_128() : void
      {
         if(this.securityErrorHandler != null)
         {
            this.securityErrorHandler(this);
         }
         class_4.method_17.send(this.var_87,new DirectEventParameter(),this.var_83);
      }
      
      private function method_126() : void
      {
         if(this.connectHandler != null)
         {
            this.connectHandler(this);
         }
         class_4.method_17.send(this.var_84,new DirectEventParameter(),this.var_83);
      }
      
      public function connect(param1:String, param2:int, param3:uint = 0) : void
      {
         this._socketManager.connect(param1,param2);
         param3 = param3;
      }
      
      public function method_131(param1:uint = 3000) : void
      {
         this.var_89 = param1;
         this.var_90 = true;
      }
      
      public function method_132() : void
      {
         this.var_90 = false;
      }
      
      public function close() : void
      {
         this._socketManager.close();
      }
      
      public function get name_5() : String
      {
         return this.var_83;
      }
      
      public function get isConnected() : Boolean
      {
         return this._socketManager.isConnected;
      }
   }
}
