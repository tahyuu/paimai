package package_16
{
   import flash.events.EventDispatcher;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import package_19.class_106;
   import package_19.class_52;
   
   public class class_88 extends EventDispatcher
   {
       
      
      private var _taskActionList:Vector.<class_48>;
      
      private var var_126:Boolean;
      
      private var var_125:Boolean;
      
      private var _IsStop:Boolean;
      
      private var var_250:Boolean;
      
      private var var_252:int = 0;
      
      private var var_251:int;
      
      private var var_253:int;
      
      private var var_254:int;
      
      public var var_256:String;
      
      public function class_88()
      {
         super();
         this._taskActionList = new Vector.<class_48>();
         this.var_250 = false;
         this.var_251 = 1;
         this._IsStop = false;
      }
      
      public function get method_359() : int
      {
         return this._taskActionList.length;
      }
      
      public function start(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.var_252 = param1;
         if(!this.var_125)
         {
            this.var_125 = true;
            if(this._taskActionList.length == 0)
            {
               this.method_360();
            }
            else
            {
               _loc2_ = this.var_251 > this._taskActionList.length?int(this._taskActionList.length):int(this.var_251);
               this.var_253 = _loc2_ - 1;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  this._taskActionList[_loc3_].execute();
                  _loc3_++;
               }
            }
         }
      }
      
      public function get method_361() : class_48
      {
         if(this._taskActionList.length > 0)
         {
            return this._taskActionList[0];
         }
         return null;
      }
      
      public function get method_208() : Boolean
      {
         return this.var_126;
      }
      
      public function get method_362() : int
      {
         return this.var_251;
      }
      
      public function set method_362(param1:int) : void
      {
         this.var_251 = param1;
      }
      
      public function get method_363() : int
      {
         return this.var_254;
      }
      
      public function get method_364() : Boolean
      {
         return this._IsStop;
      }
      
      public function method_365(param1:class_48) : void
      {
         param1.addEventListener(class_52.COMPLETE,this.method_366);
         param1.var_127 = this;
         this._taskActionList.push(param1);
      }
      
      private function method_366(param1:class_52) : void
      {
         var var_255:int = 0;
         var id:uint = 0;
         var e:class_52 = param1;
         class_48(e.target).removeEventListener(class_52.COMPLETE,this.method_366);
         this.var_254++;
         if(this.var_254 == this._taskActionList.length)
         {
            this.method_360();
         }
         else
         {
            var_255 = ++this.var_253;
            if(var_255 <= this._taskActionList.length - 1)
            {
               if(this.var_252 == 0)
               {
                  this._taskActionList[var_255].execute();
               }
               else
               {
                  id = setTimeout(function():void
                  {
                     if(_IsStop)
                     {
                        return;
                     }
                     _taskActionList[var_255].execute();
                     clearTimeout(id);
                  },this.var_252);
               }
            }
         }
      }
      
      private function method_360() : void
      {
         this.var_126 = true;
         this.var_125 = false;
         this.var_254 = 0;
         this._taskActionList = new Vector.<class_48>();
         dispatchEvent(new class_106(class_106.COMPLETE));
      }
      
      public function stop() : void
      {
         this.method_367(true);
      }
      
      private function method_367(param1:Boolean) : void
      {
         var _loc2_:* = null;
         this._IsStop = true;
         for each(_loc2_ in this._taskActionList)
         {
            class_48(_loc2_).stop();
            _loc2_.removeEventListener(class_52.COMPLETE,this.method_366);
         }
         this._taskActionList = new Vector.<class_48>();
         this.var_126 = false;
         this.var_125 = false;
         this.var_254 = 0;
         if(param1)
         {
            dispatchEvent(new class_106(class_106.STOP));
         }
      }
      
      public function method_368(param1:class_48) : void
      {
         throw new Error("taskAction  auto remove");
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this._taskActionList.length)
         {
            this._taskActionList[_loc1_].removeEventListener(class_52.COMPLETE,this.method_366);
            _loc1_++;
         }
         this.var_126 = false;
         this.var_254 = 0;
         this._taskActionList.length = 0;
      }
      
      public function name_12(param1:String) : void
      {
         this.method_367(false);
         this.var_256 = param1;
         var _loc2_:class_106 = new class_106(class_106.ERROR);
         _loc2_.name_12 = param1;
         dispatchEvent(_loc2_);
      }
      
      public function finish() : void
      {
         this.method_360();
      }
   }
}
