package package_20
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import package_19.AssetLoaderEvent;
   import package_3.class_4;
   import package_9.class_102;
   import zebra.debug.Debug;
   import zebra.directEvent.DirectEventManager;
   
   public class class_109 extends EventDispatcher implements class_89
   {
       
      
      public var progress:Number;
      
      private var var_306:class_120;
      
      private var var_305:String;
      
      private var var_300:Boolean;
      
      private var var_307:String;
      
      private var var_308;
      
      public function class_109(param1:String, param2:Boolean)
      {
         super();
         this.progress = 0;
         this.var_305 = param1;
         this.var_300 = param2;
         switch(this.var_305)
         {
            case class_111.DISPLAYOBJECT:
               this.var_306 = new class_123(this);
               class_123(this.var_306).contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
               class_123(this.var_306).contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.method_444);
               class_123(this.var_306).contentLoaderInfo.addEventListener(Event.COMPLETE,this.completeHandler);
               break;
            case class_111.TEXT:
               this.var_306 = new class_121(this);
               class_121(this.var_306).method_445.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
               class_121(this.var_306).method_445.addEventListener(ProgressEvent.PROGRESS,this.method_444);
               class_121(this.var_306).method_445.addEventListener(Event.COMPLETE,this.completeHandler);
         }
         this.var_306.state = class_124.const_29;
      }
      
      private function method_423(param1:String) : String
      {
         var _loc2_:String = "";
         if(param1.indexOf(".xml") != -1)
         {
            _loc2_ = class_111.TEXT;
         }
         if(param1.indexOf(".swf") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".jpg") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".png") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(param1.indexOf(".gif") != -1)
         {
            _loc2_ = class_111.DISPLAYOBJECT;
         }
         if(_loc2_ == "")
         {
            _loc2_ = class_111.TEXT;
         }
         return _loc2_;
      }
      
      public function load(param1:*, param2:Object = null) : void
      {
         var _loc3_:* = null;
         if(param1 is URLRequest)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = new URLRequest(param1);
         }
         this.var_307 = _loc3_.url;
         this.var_306.method_220 = param2;
         this.var_306.load(_loc3_);
         if(this.var_300)
         {
            class_4.method_7.method_100(_loc3_.url,this.var_306);
         }
      }
      
      private function method_444(param1:ProgressEvent) : void
      {
         this.var_306.state = class_124.const_30;
         this.progress = param1.bytesLoaded / param1.bytesTotal;
         dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.PROGRESS));
      }
      
      public function completeHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         this.progress = 1;
         this.var_306.state = class_124.const_31;
         var _loc2_:Array = DirectEventManager(class_4.method_17).method_133(class_102.name_5);
         if(_loc2_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc2_[0].length)
            {
               if(_loc2_[0][_loc4_] == this.var_306.name_7.url)
               {
                  if(_loc2_[1][_loc4_] is class_122)
                  {
                     class_122(_loc2_[1][_loc4_]).var_304 = this.var_306;
                  }
               }
               _loc4_++;
            }
         }
         class_4.method_17.send(this.var_306.name_7.url,this.var_306,class_102.name_5);
         var _loc3_:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.COMPLETE);
         _loc3_.var_304 = this.var_306;
         dispatchEvent(_loc3_);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         var _loc2_:AssetLoaderEvent = new AssetLoaderEvent(AssetLoaderEvent.const_28);
         dispatchEvent(_loc2_);
         Debug.method_446("[加载错误]:" + this.var_306.name_7.url,1,"0xFFFF00","0x9F0050");
         this.method_447();
      }
      
      public function get type() : String
      {
         return this.var_305;
      }
      
      private function method_447() : void
      {
         if(this.var_306)
         {
            switch(this.var_305)
            {
               case class_111.DISPLAYOBJECT:
                  class_123(this.var_306).contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
                  class_123(this.var_306).contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.method_444);
                  class_123(this.var_306).contentLoaderInfo.removeEventListener(Event.COMPLETE,this.completeHandler);
                  break;
               case class_111.TEXT:
                  class_121(this.var_306).method_445.removeEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
                  class_121(this.var_306).method_445.removeEventListener(ProgressEvent.PROGRESS,this.method_444);
                  class_121(this.var_306).method_445.removeEventListener(Event.COMPLETE,this.completeHandler);
            }
         }
      }
      
      public function dispose() : void
      {
         this.var_306.state = class_124.const_32;
         this.method_447();
      }
   }
}
