package package_23
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.display.SimpleButton;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import package_21.class_67;
   import package_22.class_71;
   
   public class class_96 implements class_95
   {
       
      
      private var var_275:DisplayObjectContainer;
      
      private var var_274:Dictionary;
      
      private var var_276:Array;
      
      private var var_277:Boolean = false;
      
      private var var_278:Boolean = true;
      
      private var var_279:InteractiveObject;
      
      private var var_280:Boolean = true;
      
      private var var_281:String;
      
      private var var_282:class_71;
      
      private var var_283:class_71;
      
      private var var_284:Boolean = true;
      
      public function class_96(param1:DisplayObjectContainer)
      {
         super();
         this.var_274 = new Dictionary(true);
         if(param1 != null)
         {
            this.var_275 = param1;
            this.activate();
         }
      }
      
      private function method_283(param1:Event) : void
      {
         var _loc2_:DisplayObject = DisplayObject(param1.target);
         if(_loc2_["@doswf__s"])
         {
            this.method_389(DisplayObject(param1.target));
         }
      }
      
      private function method_285(param1:Event) : void
      {
         var _loc4_:* = null;
         var _loc3_:DisplayObject = DisplayObject(param1.target);
         if(_loc3_ is class_69 && this.var_274[_loc3_] == true)
         {
            if(_loc3_ == this.var_279)
            {
               class_69(this.var_279).drawFocus(false);
               this.var_279 = null;
            }
            _loc3_.removeEventListener(Event.TAB_ENABLED_CHANGE,this.method_390,false);
            delete this.var_274[_loc3_];
            this.var_278 = true;
         }
         else if(_loc3_ is InteractiveObject && this.var_274[_loc3_] == true)
         {
            _loc4_ = _loc3_ as InteractiveObject;
            if(_loc4_)
            {
               if(_loc4_ == this.var_279)
               {
                  this.var_279 = null;
               }
               delete this.var_274[_loc4_];
               this.var_278 = true;
            }
            _loc3_.addEventListener(Event.TAB_ENABLED_CHANGE,this.method_390,false,0,true);
         }
         this.method_391(_loc3_);
      }
      
      private function method_389(param1:DisplayObject, param2:Boolean = false) : void
      {
         var var_286:class_69 = null;
         var var_287:InteractiveObject = null;
         var var_288:DisplayObjectContainer = null;
         var var_289:DisplayObjectContainer = null;
         var i:int = 0;
         var child:DisplayObject = null;
         var o:DisplayObject = param1;
         var var_285:Boolean = param2;
         if(!var_285)
         {
            if(o is class_69)
            {
               var_286 = class_69(o);
               if(var_286.focusEnabled)
               {
                  if(var_286.tabEnabled && this.method_392(o))
                  {
                     this.var_274[o] = true;
                     this.var_278 = true;
                  }
                  o.addEventListener(Event.TAB_ENABLED_CHANGE,this.method_390,false,0,true);
                  o.addEventListener(Event.TAB_INDEX_CHANGE,this.method_393,false,0,true);
               }
            }
            else if(o is InteractiveObject)
            {
               var_287 = o as InteractiveObject;
               if(var_287 && var_287.tabEnabled && this.method_387(var_287) == var_287)
               {
                  this.var_274[var_287] = true;
                  this.var_278 = true;
               }
               var_287.addEventListener(Event.TAB_ENABLED_CHANGE,this.method_390,false,0,true);
               var_287.addEventListener(Event.TAB_INDEX_CHANGE,this.method_393,false,0,true);
            }
         }
         if(o is DisplayObjectContainer)
         {
            var_288 = DisplayObjectContainer(o);
            o.addEventListener(Event.TAB_CHILDREN_CHANGE,this.method_394,false,0,true);
            var_289 = null;
            try
            {
               var_289 = var_288.parent;
            }
            catch(se:SecurityError)
            {
               var_289 = null;
            }
            if(var_288 is Stage || var_289 is Stage || var_288.tabChildren)
            {
               i = 0;
               while(i < var_288.numChildren)
               {
                  try
                  {
                     child = var_288.getChildAt(i);
                     if(child != null)
                     {
                        this.method_389(var_288.getChildAt(i));
                     }
                  }
                  catch(error:SecurityError)
                  {
                  }
                  i++;
               }
            }
         }
      }
      
      private function method_391(param1:DisplayObject) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 is DisplayObjectContainer)
         {
            param1.removeEventListener(Event.TAB_CHILDREN_CHANGE,this.method_394,false);
            param1.removeEventListener(Event.TAB_INDEX_CHANGE,this.method_393,false);
            for(_loc2_ in this.var_274)
            {
               _loc3_ = DisplayObject(_loc2_);
               if(DisplayObjectContainer(param1).contains(_loc3_))
               {
                  if(_loc3_ == this.var_279)
                  {
                     this.var_279 = null;
                  }
                  _loc3_.removeEventListener(Event.TAB_ENABLED_CHANGE,this.method_390,false);
                  delete this.var_274[_loc2_];
                  this.var_278 = true;
               }
            }
         }
      }
      
      private function method_392(param1:DisplayObject) : Boolean
      {
         var _loc2_:* = null;
         try
         {
            _loc2_ = param1.parent;
            while(_loc2_ && !(_loc2_ is Stage) && !(_loc2_.parent && _loc2_.parent is Stage))
            {
               if(!_loc2_.tabChildren)
               {
                  return false;
               }
               _loc2_ = _loc2_.parent;
            }
         }
         catch(se:SecurityError)
         {
         }
         return true;
      }
      
      private function method_395(param1:DisplayObject, param2:String) : Boolean
      {
         var _loc3_:* = null;
         if(!this.method_396(param1))
         {
            return false;
         }
         if(param1 is class_108)
         {
            _loc3_ = class_108(param1);
            if(param2 == _loc3_.method_397)
            {
               return false;
            }
         }
         return true;
      }
      
      private function method_396(param1:DisplayObject) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         try
         {
            _loc2_ = DisplayObject(this.form).parent;
            while(param1 != _loc2_)
            {
               if(param1 is class_67)
               {
                  if(!class_67(param1).enabled)
                  {
                     return false;
                  }
               }
               else if(param1 is TextField)
               {
                  _loc3_ = TextField(param1);
                  if(_loc3_.type == TextFieldType.DYNAMIC || !_loc3_.selectable)
                  {
                     return false;
                  }
               }
               else if(param1 is SimpleButton)
               {
                  _loc4_ = SimpleButton(param1);
                  if(!_loc4_.enabled)
                  {
                     return false;
                  }
               }
               if(!param1.visible)
               {
                  return false;
               }
               param1 = param1.parent;
            }
         }
         catch(se:SecurityError)
         {
         }
         return true;
      }
      
      private function method_390(param1:Event) : void
      {
         this.var_278 = true;
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
         var _loc3_:* = this.var_274[_loc2_] == true;
         if(_loc2_.tabEnabled)
         {
            if(!_loc3_ && this.method_392(_loc2_))
            {
               if(!(_loc2_ is class_69))
               {
                  _loc2_.focusRect = false;
               }
               this.var_274[_loc2_] = true;
            }
         }
         else if(_loc3_)
         {
            delete this.var_274[_loc2_];
         }
      }
      
      private function method_393(param1:Event) : void
      {
         this.var_278 = true;
      }
      
      private function method_394(param1:Event) : void
      {
         if(param1.target != param1.currentTarget)
         {
            return;
         }
         this.var_278 = true;
         var _loc2_:DisplayObjectContainer = DisplayObjectContainer(param1.target);
         if(_loc2_.tabChildren)
         {
            this.method_389(_loc2_,true);
         }
         else
         {
            this.method_391(_loc2_);
         }
      }
      
      public function activate() : void
      {
         if(this.var_277)
         {
            return;
         }
         this.method_389(this.form);
         this.form.addEventListener(Event.ADDED,this.method_283,false,0,true);
         this.form.addEventListener(Event.REMOVED,this.method_285,false,0,true);
         try
         {
            this.form["@doswf__s"].addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.method_398,false,0,true);
            this.form["@doswf__s"].addEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.method_399,false,0,true);
            this.form["@doswf__s"].addEventListener(Event.ACTIVATE,this.method_400,false,0,true);
            this.form["@doswf__s"].addEventListener(Event.DEACTIVATE,this.method_401,false,0,true);
         }
         catch(se:SecurityError)
         {
            form.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,method_398,false,0,true);
            form.addEventListener(FocusEvent.KEY_FOCUS_CHANGE,method_399,false,0,true);
            form.addEventListener(Event.ACTIVATE,method_400,false,0,true);
            form.addEventListener(Event.DEACTIVATE,method_401,false,0,true);
         }
         this.form.addEventListener(FocusEvent.FOCUS_IN,this.method_254,true,0,true);
         this.form.addEventListener(FocusEvent.FOCUS_OUT,this.method_255,true,0,true);
         this.form.addEventListener(MouseEvent.MOUSE_DOWN,this.method_402,false,0,true);
         this.form.addEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,true,0,true);
         this.var_277 = true;
         if(this.var_279)
         {
            this.method_274(this.var_279);
         }
      }
      
      public function deactivate() : void
      {
         if(!this.var_277)
         {
            return;
         }
         this.var_274 = new Dictionary(true);
         this.var_276 = null;
         this.var_279 = null;
         this.var_282 = null;
         this.form.removeEventListener(Event.ADDED,this.method_283,false);
         this.form.removeEventListener(Event.REMOVED,this.method_285,false);
         try
         {
            this.form["@doswf__s"].removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.method_398,false);
            this.form["@doswf__s"].removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.method_399,false);
            this.form["@doswf__s"].removeEventListener(Event.ACTIVATE,this.method_400,false);
            this.form["@doswf__s"].removeEventListener(Event.DEACTIVATE,this.method_401,false);
         }
         catch(se:SecurityError)
         {
         }
         this.form.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE,this.method_398,false);
         this.form.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE,this.method_399,false);
         this.form.removeEventListener(Event.ACTIVATE,this.method_400,false);
         this.form.removeEventListener(Event.DEACTIVATE,this.method_401,false);
         this.form.removeEventListener(FocusEvent.FOCUS_IN,this.method_254,true);
         this.form.removeEventListener(FocusEvent.FOCUS_OUT,this.method_255,true);
         this.form.removeEventListener(MouseEvent.MOUSE_DOWN,this.method_402,false);
         this.form.removeEventListener(KeyboardEvent.KEY_DOWN,this.keyDownHandler,true);
         this.var_277 = false;
      }
      
      private function method_254(param1:FocusEvent) : void
      {
         var _loc3_:* = null;
         if(!this.var_277)
         {
            return;
         }
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
         if(this.form.contains(_loc2_))
         {
            this.var_279 = this.method_387(InteractiveObject(_loc2_));
            if(this.var_279 is class_71)
            {
               _loc3_ = class_71(this.var_279);
               if(this.var_282)
               {
                  this.var_282.method_142 = false;
                  this.var_282 = _loc3_;
                  _loc3_.method_142 = true;
               }
            }
            else if(this.var_282 && this.var_282 != this.var_283)
            {
               this.var_282.method_142 = false;
               this.var_282 = this.var_283;
               this.var_283.method_142 = true;
            }
         }
      }
      
      private function method_255(param1:FocusEvent) : void
      {
         if(!this.var_277)
         {
            return;
         }
         var _loc2_:InteractiveObject = param1.target as InteractiveObject;
      }
      
      private function method_400(param1:Event) : void
      {
         if(!this.var_277)
         {
            return;
         }
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
         if(this.var_279)
         {
            if(this.var_279 is class_69)
            {
               class_69(this.var_279).method_274();
            }
            else
            {
               this.form["@doswf__s"].focus = this.var_279;
            }
         }
         this.var_281 = "ACTIVATE";
      }
      
      private function method_401(param1:Event) : void
      {
         if(!this.var_277)
         {
            return;
         }
         var _loc2_:InteractiveObject = InteractiveObject(param1.target);
      }
      
      private function method_398(param1:FocusEvent) : void
      {
         if(!this.var_277)
         {
            return;
         }
         if(param1.relatedObject is TextField)
         {
            return;
         }
         param1.preventDefault();
      }
      
      private function method_399(param1:FocusEvent) : void
      {
         if(!this.var_277)
         {
            return;
         }
         this.method_280 = true;
         if((param1.keyCode == Keyboard.TAB || param1.keyCode == 0) && !param1.isDefaultPrevented())
         {
            this.method_403(param1);
            param1.preventDefault();
         }
      }
      
      private function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(!this.var_277)
         {
            return;
         }
         if(param1.keyCode == Keyboard.TAB)
         {
            this.var_281 = "KEY";
            if(this.var_278)
            {
               this.method_404();
               this.var_278 = false;
            }
         }
         if(this.method_339 && param1.keyCode == Keyboard.ENTER && this.method_383 && this.var_282.enabled)
         {
            this.method_405();
         }
      }
      
      private function method_402(param1:MouseEvent) : void
      {
         if(!this.var_277)
         {
            return;
         }
         if(param1.isDefaultPrevented())
         {
            return;
         }
         var _loc2_:InteractiveObject = this.method_406(InteractiveObject(param1.target));
         if(!_loc2_)
         {
            return;
         }
         this.method_280 = false;
         if((_loc2_ != this.var_279 || this.var_281 == "ACTIVATE") && !(_loc2_ is TextField))
         {
            this.method_274(_loc2_);
         }
         this.var_281 = "MOUSEDOWN";
      }
      
      public function get method_383() : class_71
      {
         return this.var_283;
      }
      
      public function set method_383(param1:class_71) : void
      {
         var _loc2_:class_71 = !!param1?class_71(param1):null;
         if(_loc2_ != this.var_283)
         {
            if(this.var_283)
            {
               this.var_283.method_142 = false;
            }
            if(this.var_282)
            {
               this.var_282.method_142 = false;
            }
            this.var_283 = _loc2_;
            this.var_282 = _loc2_;
            if(_loc2_)
            {
               _loc2_.method_142 = true;
            }
         }
      }
      
      public function method_405() : void
      {
         this.var_282.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
      }
      
      private function method_403(param1:FocusEvent) : void
      {
         if(!this.method_407())
         {
            return;
         }
         var _loc2_:InteractiveObject = this.method_388(param1.shiftKey);
         if(_loc2_)
         {
            this.method_274(_loc2_);
         }
      }
      
      private function method_407() : Boolean
      {
         var _loc1_:* = null;
         for(_loc1_ in this.var_274)
         {
            return true;
         }
         return false;
      }
      
      public function method_388(param1:Boolean = false) : InteractiveObject
      {
         var _loc8_:* = null;
         if(!this.method_407())
         {
            return null;
         }
         if(this.var_278)
         {
            this.method_404();
            this.var_278 = false;
         }
         var _loc2_:DisplayObject = this.form["@doswf__s"].focus;
         _loc2_ = DisplayObject(this.method_387(InteractiveObject(_loc2_)));
         var _loc3_:String = "";
         if(_loc2_ is class_108)
         {
            _loc8_ = class_108(_loc2_);
            _loc3_ = _loc8_.method_397;
         }
         var _loc4_:int = this.method_408(_loc2_);
         var _loc5_:Boolean = false;
         var _loc6_:int = _loc4_;
         if(_loc4_ == -1)
         {
            if(param1)
            {
               _loc4_ = this.var_276.length;
            }
            _loc5_ = true;
         }
         var _loc7_:int = this.method_409(_loc4_,param1,_loc5_,_loc3_);
         return this.method_387(this.var_276[_loc7_]);
      }
      
      private function method_408(param1:DisplayObject) : int
      {
         var _loc2_:int = this.var_276.length;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.var_276[_loc3_] == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function method_409(param1:int, param2:Boolean, param3:Boolean, param4:String) : int
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc5_:int = this.var_276.length;
         var _loc6_:int = param1;
         while(true)
         {
            if(param2)
            {
               param1--;
            }
            else
            {
               param1++;
            }
            if(param3)
            {
               if(param2 && param1 < 0)
               {
                  break;
               }
               if(!param2 && param1 == _loc5_)
               {
                  break;
               }
            }
            else
            {
               param1 = (param1 + _loc5_) % _loc5_;
               if(_loc6_ == param1)
               {
                  break;
               }
            }
            if(this.method_395(this.var_276[param1],param4))
            {
               _loc7_ = DisplayObject(this.method_387(this.var_276[param1]));
               if(_loc7_ is class_108)
               {
                  _loc8_ = class_108(_loc7_);
                  _loc9_ = 0;
                  while(_loc9_ < this.var_276.length)
                  {
                     _loc10_ = this.var_276[_loc9_];
                     if(_loc10_ is class_108)
                     {
                        _loc11_ = class_108(_loc10_);
                        if(_loc11_.method_397 == _loc8_.method_397 && _loc11_.selected)
                        {
                           param1 = _loc9_;
                           break;
                        }
                     }
                     _loc9_++;
                  }
               }
               return param1;
            }
         }
         return param1;
      }
      
      private function method_404() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_276 = [];
         for(_loc1_ in this.var_274)
         {
            _loc2_ = InteractiveObject(_loc1_);
            if(_loc2_.tabIndex && !isNaN(Number(_loc2_.tabIndex)) && _loc2_.tabIndex > 0)
            {
               this.method_410();
               return;
            }
            this.var_276.push(_loc2_);
         }
         this.var_276.sort(this.method_411);
      }
      
      private function method_410() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         this.var_276 = [];
         for(_loc1_ in this.var_274)
         {
            _loc2_ = InteractiveObject(_loc1_);
            if(_loc2_.tabIndex && !isNaN(Number(_loc2_.tabIndex)))
            {
               this.var_276.push(_loc2_);
            }
         }
         this.var_276.sort(this.method_412);
      }
      
      private function method_411(param1:InteractiveObject, param2:InteractiveObject) : Number
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc9_:DisplayObject = DisplayObject(param1);
         var _loc10_:DisplayObject = DisplayObject(param2);
         try
         {
            while(_loc9_ != DisplayObject(this.form) && _loc9_.parent)
            {
               _loc5_ = this.getChildIndex(_loc9_.parent,_loc9_);
               _loc6_ = _loc5_.toString(16);
               if(_loc6_.length < 4)
               {
                  _loc7_ = "0000".substring(0,4 - _loc6_.length) + _loc6_;
               }
               _loc3_ = _loc7_ + _loc3_;
               _loc9_ = _loc9_.parent;
            }
         }
         catch(se1:SecurityError)
         {
            try
            {
               while(_loc10_ != DisplayObject(this.form) && _loc10_.parent)
               {
                  _loc5_ = this.getChildIndex(_loc10_.parent,_loc10_);
                  _loc6_ = _loc5_.toString(16);
                  if(_loc6_.length < 4)
                  {
                     _loc7_ = "0000".substring(0,4 - _loc6_.length) + _loc6_;
                  }
                  _loc4_ = _loc7_ + _loc4_;
                  _loc10_ = _loc10_.parent;
               }
            }
            catch(se2:SecurityError)
            {
            }
            return _loc3_ > _loc4_?1:_loc3_ < _loc4_?-1:Number(0);
         }
         continue loop1;
      }
      
      private function getChildIndex(param1:DisplayObjectContainer, param2:DisplayObject) : int
      {
         return param1.getChildIndex(param2);
      }
      
      private function method_412(param1:InteractiveObject, param2:InteractiveObject) : int
      {
         return param1.tabIndex > param2.tabIndex?1:param1.tabIndex < param2.tabIndex?-1:int(this.method_411(param1,param2));
      }
      
      public function get method_339() : Boolean
      {
         return this.var_284;
      }
      
      public function set method_339(param1:Boolean) : void
      {
         this.var_284 = param1;
      }
      
      public function get method_384() : int
      {
         return 0;
      }
      
      public function get method_280() : Boolean
      {
         return this.var_280;
      }
      
      public function set method_280(param1:Boolean) : void
      {
         this.var_280 = param1;
      }
      
      public function get form() : DisplayObjectContainer
      {
         return this.var_275;
      }
      
      public function set form(param1:DisplayObjectContainer) : void
      {
         this.var_275 = param1;
      }
      
      public function method_275() : InteractiveObject
      {
         var _loc1_:InteractiveObject = this.form["@doswf__s"].focus;
         return this.method_387(_loc1_);
      }
      
      public function method_274(param1:InteractiveObject) : void
      {
         if(param1 is class_69)
         {
            class_69(param1).method_274();
         }
         else
         {
            this.form["@doswf__s"].focus = param1;
         }
      }
      
      public function method_385() : void
      {
      }
      
      public function method_386() : void
      {
      }
      
      public function method_387(param1:InteractiveObject) : InteractiveObject
      {
         var _loc2_:InteractiveObject = param1;
         try
         {
            while(param1)
            {
               if(param1 is class_69 && class_69(param1).focusEnabled)
               {
                  return param1;
               }
               param1 = param1.parent;
            }
         }
         catch(se:SecurityError)
         {
         }
         return _loc2_;
      }
      
      private function method_406(param1:InteractiveObject) : InteractiveObject
      {
         try
         {
            while(true)
            {
               if(param1 != InteractiveObject(this.form))
               {
                  if(param1 is class_69 && class_69(param1).focusEnabled && class_69(param1).method_270 && class_67(param1).enabled)
                  {
                     return param1;
                  }
                  param1 = param1.parent;
                  if(param1 == null)
                  {
                     break;
                  }
                  continue;
               }
            }
         }
         catch(se:SecurityError)
         {
         }
         break loop0;
      }
   }
}
