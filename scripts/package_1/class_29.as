package package_1
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.utils.setTimeout;
   import package_13.class_27;
   import package_2.class_9;
   import package_3.class_4;
   import package_5.class_14;
   import package_7.class_28;
   
   public class class_29 extends class_28
   {
       
      
      private var var_94:class_27;
      
      private var var_100:String = "";
      
      public function class_29()
      {
         super();
         class_4.method_7.method_61(this);
         closeBut.addEventListener(MouseEvent.CLICK,this.closeHandler);
         localSaveBut.addEventListener(MouseEvent.CLICK,this.method_143);
         sentLogDataBut.addEventListener(MouseEvent.CLICK,this.method_144);
         this.hide();
      }
      
      private function method_145() : void
      {
         this.var_94 = class_15(class_4.method_7.method_8(class_15)).socketControl.socket;
         this.var_94.receive("3-2",this.method_146);
      }
      
      private function method_143(param1:MouseEvent) : void
      {
         var _loc2_:FileReference = new FileReference();
         _loc2_.save(log.text);
      }
      
      private function closeHandler(param1:MouseEvent) : void
      {
         this.visible = false;
      }
      
      private function method_144(param1:MouseEvent) : void
      {
         var loader:URLLoader = null;
         var e:MouseEvent = param1;
         var var_95:class_9 = class_9(class_4.method_7.method_76(class_9));
         var var_96:String = "http://" + var_95.var_12 + "/lc/LogCollect.svc/WebCmd?p=" + Math.random();
         var var_97:String = class_14.method_5().toLowerCase();
         loader = new URLLoader();
         var var_98:String = this.var_100;
         var_98 = var_98.split("\"").join("\\\"").split("\\n").join("+");
         var name_7:URLRequest = new URLRequest(var_96);
         name_7.method = URLRequestMethod.POST;
         var var_99:String = escape(var_98);
         name_7.data = "{\"cmd\":\"" + escape(var_98) + "\"}";
         name_7.contentType = "application/json";
         loader.addEventListener(Event.COMPLETE,function getHttpContentHandler(param1:Event):void
         {
            var _loc2_:String = String(loader.data);
         });
         loader.load(name_7);
      }
      
      private function method_146() : void
      {
         var _loc1_:* = setTimeout(this.method_147,7000);
      }
      
      private function method_147(param1:*) : void
      {
         var loader:URLLoader = null;
         var e:* = param1;
         var var_95:class_9 = class_9(class_4.method_7.method_76(class_9));
         var var_96:String = "http://" + var_95.var_12 + "/lc/LogCollect.svc/WebCmd?p=" + Math.random();
         var var_97:String = class_14.method_5().toLowerCase();
         loader = new URLLoader();
         var var_98:String = this.var_100;
         var_98 = var_98.split("\"").join("\\\"").split("\\n").join("+");
         var name_7:URLRequest = new URLRequest(var_96);
         name_7.method = URLRequestMethod.POST;
         var var_99:String = escape(var_98);
         name_7.data = "{\"cmd\":\"" + escape(var_98) + "\"}";
         name_7.contentType = "application/json";
         loader.addEventListener(Event.COMPLETE,function getHttpContentHandler(param1:Event):void
         {
            var _loc2_:String = String(loader.data);
         });
         loader.load(name_7);
      }
      
      public function show() : void
      {
         this.visible = true;
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function info(param1:String) : void
      {
         this.var_100 = this.var_100 + (param1 + "\n");
         log.text = this.var_100;
      }
   }
}
