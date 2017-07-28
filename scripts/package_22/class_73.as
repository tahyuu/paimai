package package_22
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.TextEvent;
   import package_21.class_67;
   import package_21.class_98;
   import package_25.ScrollEvent;
   
   public class class_73 extends class_72
   {
      
      private static var var_154:Object = {};
       
      
      protected var var_213:DisplayObject;
      
      protected var var_214:Boolean = false;
      
      protected var var_215:Boolean = false;
      
      protected var var_216:String;
      
      protected var var_217:String;
      
      public function class_73()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return class_67.mergeStyles(var_154,class_72.getStyleDefinition());
      }
      
      override public function set method_304(param1:Number) : void
      {
         super.method_304 = param1 < 0?0:Number(param1);
      }
      
      override public function set method_305(param1:Number) : void
      {
         var _loc2_:Number = param1;
         if(this.var_213 != null)
         {
            _loc2_ = Math.min(_loc2_,this.var_213[this.var_217]);
         }
         super.method_305 = _loc2_;
      }
      
      public function get method_311() : DisplayObject
      {
         return this.var_213;
      }
      
      public function set method_311(param1:DisplayObject) : void
      {
         var target:DisplayObject = param1;
         if(this.var_213 != null)
         {
            this.var_213.removeEventListener(Event.CHANGE,this.method_312,false);
            this.var_213.removeEventListener(TextEvent.TEXT_INPUT,this.method_312,false);
            this.var_213.removeEventListener(Event.SCROLL,this.method_313,false);
         }
         this.var_213 = target;
         var var_218:String = null;
         var var_219:String = null;
         var var_220:Boolean = false;
         if(this.var_213 != null)
         {
            try
            {
               if(this.var_213.hasOwnProperty("blockProgression"))
               {
                  var_218 = this.var_213["blockProgression"];
               }
               if(this.var_213.hasOwnProperty("direction"))
               {
                  var_219 = this.var_213["direction"];
               }
               if(this.var_213.hasOwnProperty("pixelScrollV"))
               {
                  var_220 = true;
               }
            }
            catch(e:Error)
            {
               var_218 = null;
               var_219 = null;
            }
         }
         var var_221:Boolean = this.direction == class_100.HORIZONTAL;
         var var_222:Number = Math.abs(this.rotation);
         if(var_221 && (var_218 == "rl" || var_219 == "rtl"))
         {
            if(method_263() > 0 && rotation == 90)
            {
               x = x + width;
            }
            method_264(-1);
         }
         else if(!var_221 && var_218 == "rl" && var_219 == "rtl")
         {
            if(method_263() > 0 && rotation != 90)
            {
               y = y + height;
            }
            method_264(-1);
         }
         else
         {
            if(method_263() < 0)
            {
               if(var_221)
               {
                  if(rotation == 90)
                  {
                     x = x - width;
                  }
               }
               else if(rotation != 90)
               {
                  y = y - height;
               }
            }
            method_264(1);
         }
         this.method_314(var_221,var_218,var_220);
         if(this.var_213 != null)
         {
            this.var_213.addEventListener(Event.CHANGE,this.method_312,false,0,true);
            this.var_213.addEventListener(TextEvent.TEXT_INPUT,this.method_312,false,0,true);
            this.var_213.addEventListener(Event.SCROLL,this.method_313,false,0,true);
         }
         invalidate(class_98.DATA);
      }
      
      public function get method_315() : String
      {
         return this.var_213.name;
      }
      
      public function set method_315(param1:String) : void
      {
         var target:String = param1;
         try
         {
            this.method_311 = parent.getChildByName(target);
            return;
         }
         catch(error:Error)
         {
            throw new Error("ScrollTarget not found, or is not a valid target");
         }
      }
      
      override public function get direction() : String
      {
         return super.direction;
      }
      
      override public function set direction(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_163)
         {
            return;
         }
         if(!componentInspectorSetting && this.var_213 != null)
         {
            _loc2_ = this.var_213;
            this.method_311 = null;
         }
         super.direction = param1;
         if(_loc2_ != null)
         {
            this.method_311 = _loc2_;
         }
         else
         {
            this.method_316();
         }
      }
      
      public function method_94() : void
      {
         this.var_214 = true;
         this.method_316();
         this.var_214 = false;
      }
      
      override protected function draw() : void
      {
         if(method_278(class_98.DATA))
         {
            this.method_316();
         }
         super.draw();
      }
      
      protected function method_316() : void
      {
         var var_218:String = null;
         var var_220:Boolean = false;
         var name_11:Number = NaN;
         var var_223:Number = NaN;
         var var_224:* = undefined;
         if(this.var_213 == null)
         {
            this.method_302(name_11,method_304,method_305);
            scrollPosition = 0;
         }
         else
         {
            var_218 = null;
            var_220 = false;
            try
            {
               if(this.var_213.hasOwnProperty("blockProgression"))
               {
                  var_218 = this.var_213["blockProgression"];
               }
               if(this.var_213.hasOwnProperty("pixelScrollV"))
               {
                  var_220 = true;
               }
            }
            catch(e1:Error)
            {
            }
            this.method_314(this.direction == class_100.HORIZONTAL,var_218,var_220);
            if(this.var_216 == "scrollH")
            {
               var_223 = 0;
               try
               {
                  if(this.var_213.hasOwnProperty("controller") && this.var_213["controller"].hasOwnProperty("compositionWidth"))
                  {
                     name_11 = this.var_213["controller"]["compositionWidth"];
                  }
                  else
                  {
                     name_11 = this.var_213.width;
                  }
               }
               catch(e2:Error)
               {
                  name_11 = var_213.width;
               }
            }
            else
            {
               try
               {
                  if(var_218 != null)
                  {
                     var_224 = this.var_213["pixelMinScrollV"];
                     if(var_224 is int)
                     {
                        var_223 = var_224;
                     }
                     else
                     {
                        var_223 = 1;
                     }
                  }
                  else
                  {
                     var_223 = 1;
                  }
               }
               catch(e3:Error)
               {
                  var_223 = 1;
               }
               name_11 = 10;
            }
            this.method_302(name_11,var_223,this.method_311[this.var_217]);
            scrollPosition = this.var_213[this.var_216];
         }
      }
      
      override public function method_302(param1:Number, param2:Number, param3:Number, param4:Number = 0) : void
      {
         var _loc5_:Number = param3;
         var _loc6_:Number = param2 < 0?0:Number(param2);
         if(this.var_213 != null)
         {
            _loc5_ = Math.min(param3,this.var_213[this.var_217]);
         }
         super.method_302(param1,_loc6_,_loc5_,param4);
      }
      
      override public function method_303(param1:Number, param2:Boolean = true) : void
      {
         super.method_303(param1,param2);
         if(!this.var_213)
         {
            this.var_215 = false;
            return;
         }
         this.method_317();
      }
      
      protected function method_317(param1:ScrollEvent = null) : void
      {
         if(this.var_214)
         {
            return;
         }
         this.var_213[this.var_216] = scrollPosition;
      }
      
      protected function method_312(param1:Event) : void
      {
         this.var_214 = true;
         this.method_303(this.var_213[this.var_216],true);
         this.method_316();
         this.var_214 = false;
      }
      
      protected function method_313(param1:Event) : void
      {
         if(var_208)
         {
            return;
         }
         if(!enabled)
         {
            return;
         }
         this.var_214 = true;
         this.method_316();
         scrollPosition = this.var_213[this.var_216];
         this.var_214 = false;
      }
      
      private function method_314(param1:Boolean, param2:String, param3:Boolean = false) : void
      {
         if(param2 == "rl")
         {
            if(param1)
            {
               this.var_216 = !!param3?"pixelScrollV":"scrollV";
               this.var_217 = !!param3?"pixelMaxScrollV":"maxScrollV";
            }
            else
            {
               this.var_216 = "scrollH";
               this.var_217 = "maxScrollH";
            }
         }
         else if(param1)
         {
            this.var_216 = "scrollH";
            this.var_217 = "maxScrollH";
         }
         else
         {
            this.var_216 = !!param3?"pixelScrollV":"scrollV";
            this.var_217 = !!param3?"pixelMaxScrollV":"maxScrollV";
         }
      }
   }
}
