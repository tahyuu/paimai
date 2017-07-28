package zebra.graphics.animation
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import package_19.BitmapBatchEvent;
   import package_28.class_107;
   import package_3.class_4;
   
   public class class_91 extends Bitmap implements class_90
   {
       
      
      protected var var_263:Function;
      
      protected var var_264:Function;
      
      protected var var_265:Function;
      
      protected var var_266:Function;
      
      protected var var_267:Function;
      
      private var var_268:Boolean;
      
      private var var_42:Boolean;
      
      private var var_269:Boolean;
      
      private var var_270:Boolean;
      
      private var var_271:class_92;
      
      private var var_272:int = 0;
      
      private var var_257:Vector.<BitmapData>;
      
      private var var_262:int;
      
      private var var_258:Boolean;
      
      private var var_259:String;
      
      private var var_260:Number;
      
      private var var_261:Number;
      
      public function class_91(param1:Vector.<BitmapData> = null, param2:String = "none")
      {
         var _loc3_:* = null;
         super();
         if(param1 == null)
         {
            param1 = new Vector.<BitmapData>();
            _loc3_ = new BitmapData(1,1,true);
            param1.push(_loc3_);
         }
         this.var_257 = param1;
         this.var_258 = true;
         this.var_42 = false;
         this.var_259 = param2;
         this.var_260 = 0;
         this.var_261 = 0;
         this.var_262 = 24;
         this.bitmapData == this.var_257[0];
         addEventListener(Event.ADDED_TO_STAGE,this.method_374);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_375);
      }
      
      private function method_375(param1:Event) : void
      {
         class_4.method_9.method_113.method_91(this);
      }
      
      private function method_374(param1:Event) : void
      {
         class_4.method_9.method_113.add(this);
      }
      
      public function get IsHitMouse() : Boolean
      {
         if(this.var_268)
         {
            return false;
         }
         return class_107.method_376(this);
      }
      
      public function method_59(param1:DisplayObject) : Point
      {
         return this.parent.localToGlobal(new Point(this.x,this.y));
      }
      
      override public function set bitmapData(param1:BitmapData) : void
      {
         super.bitmapData = param1;
         this.method_377();
      }
      
      public function get method_372() : int
      {
         return this.var_257.length;
      }
      
      public function get method_373() : int
      {
         return this.var_272;
      }
      
      public function set method_373(param1:int) : void
      {
         if(param1 < 0)
         {
            this.var_272 = 0;
         }
         if(param1 >= this.method_372)
         {
            this.var_272 = this.method_372 - 1;
         }
         this.bitmapData = this.var_257[this.var_272];
      }
      
      public function get method_207() : Boolean
      {
         return this.var_270;
      }
      
      public function get loop() : Boolean
      {
         return this.var_258;
      }
      
      public function set loop(param1:Boolean) : void
      {
         this.var_258 = param1;
      }
      
      public function method_378() : void
      {
         if(!this.var_269 && !this.var_42)
         {
            if(this.var_258)
            {
               this.bitmapData = this.var_257[this.var_272];
               this.var_272++;
               this.var_272 = this.var_272 == this.method_372?0:int(this.var_272);
            }
            else if(this.var_272 != this.method_372 - 1)
            {
               this.bitmapData = this.var_257[this.var_272];
               this.var_272++;
            }
         }
      }
      
      public function play(param1:String = "") : void
      {
         this.bitmapData = this.var_257[this.var_272];
         this.var_270 = true;
         this.var_42 = false;
         this.var_269 = false;
         this.method_110 = this.var_262;
      }
      
      public function method_369() : void
      {
         this.var_269 = !this.var_269;
      }
      
      public function stop() : void
      {
         this.var_269 = true;
      }
      
      public function get method_55() : Boolean
      {
         return this.var_42;
      }
      
      public function get method_110() : int
      {
         return this.var_262;
      }
      
      public function set method_110(param1:int) : void
      {
         this.var_262 = param1;
         if(this.method_372 > 1)
         {
            if(this.var_271 != null)
            {
               class_4.method_18.method_77(this.var_271);
            }
            this.var_271 = new class_92(this);
            class_4.method_18.method_82(this.var_271,1000 / this.var_262);
         }
      }
      
      public function get method_371() : Vector.<BitmapData>
      {
         return this.var_257;
      }
      
      public function set method_371(param1:Vector.<BitmapData>) : void
      {
         this.var_257 = param1;
         this.method_373 = 0;
      }
      
      public function get method_370() : String
      {
         return this.var_259;
      }
      
      public function set method_370(param1:String) : void
      {
         this.var_259 = param1;
         this.method_377();
      }
      
      public function get method_379() : Number
      {
         return this.var_260;
      }
      
      public function set method_379(param1:Number) : void
      {
         this.var_260 = param1;
      }
      
      public function get method_380() : Number
      {
         return this.var_261;
      }
      
      public function set method_380(param1:Number) : void
      {
         this.var_261 = param1;
      }
      
      public function get method_232() : Function
      {
         return this.var_264;
      }
      
      public function set method_232(param1:Function) : void
      {
         this.var_264 = param1;
      }
      
      public function get method_230() : Function
      {
         return this.var_265;
      }
      
      public function set method_230(param1:Function) : void
      {
         this.var_265 = param1;
      }
      
      public function get method_229() : Function
      {
         return this.var_267;
      }
      
      public function set method_229(param1:Function) : void
      {
         this.var_267 = param1;
      }
      
      public function get method_381() : Boolean
      {
         return this.var_268;
      }
      
      public function set method_381(param1:Boolean) : void
      {
         this.var_268 = param1;
      }
      
      public function get method_233() : Function
      {
         return this.var_266;
      }
      
      public function set method_233(param1:Function) : void
      {
         this.var_266 = param1;
      }
      
      public function get method_231() : Function
      {
         return this.var_263;
      }
      
      public function set method_231(param1:Function) : void
      {
         this.var_263 = param1;
      }
      
      private function method_377() : void
      {
         if(this.bitmapData == null)
         {
            return;
         }
         switch(this.var_259.toLocaleUpperCase())
         {
            case "NONE":
               break;
            case "LT":
               this.x = 0;
               this.y = 0;
               break;
            case "CT":
               this.x = this.bitmapData.width / 2 * -1;
               this.y = 0;
               break;
            case "RT":
               this.x = this.bitmapData.width * -1;
               this.y = 0;
               break;
            case "TL":
               this.x = 0;
               this.y = 0;
               break;
            case "TC":
               this.x = this.bitmapData.width / 2 * -1;
               this.y = 0;
               break;
            case "TR":
               this.x = this.bitmapData.width * -1;
               this.y = 0;
               break;
            case "CL":
               this.x = 0;
               this.y = this.bitmapData.height / 2 * -1;
               break;
            case "LC":
               this.x = 0;
               this.y = this.bitmapData.height / 2 * -1;
               break;
            case "CC":
               this.x = this.bitmapData.width / 2 * -1;
               this.y = this.bitmapData.height / 2 * -1;
               break;
            case "CR":
               this.x = this.bitmapData.width * -1;
               this.y = this.bitmapData.height / 2 * -1;
               break;
            case "RC":
               this.x = this.bitmapData.width * -1;
               this.y = this.bitmapData.height / 2 * -1;
               break;
            case "BL":
               this.x = 0;
               this.y = this.bitmapData.height * -1;
               break;
            case "LB":
               this.x = 0;
               this.y = this.bitmapData.height * -1;
               break;
            case "BC":
               this.x = this.bitmapData.width / 2 * -1;
               this.y = this.bitmapData.height * -1;
               break;
            case "CB":
               this.x = this.bitmapData.width / 2 * -1;
               this.y = this.bitmapData.height * -1;
               break;
            case "BR":
               this.x = this.bitmapData.width * -1;
               this.y = this.bitmapData.height * -1;
               break;
            case "RB":
               this.x = this.bitmapData.width * -1;
               this.y = this.bitmapData.height * -1;
         }
         this.x = this.x + this.var_260;
         this.y = this.y + this.var_261;
      }
      
      public function clone() : class_91
      {
         return new class_91(this.var_257,this.var_259);
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this.var_42)
         {
            this.var_42 = true;
            _loc1_ = new BitmapBatchEvent(BitmapBatchEvent.DISPOSE);
            dispatchEvent(_loc1_);
            this.bitmapData = null;
            if(this.var_271 != null)
            {
               class_4.method_18.method_77(this.var_271);
            }
         }
      }
   }
}

import package_16.class_48;
import zebra.graphics.animation.class_91;

class class_92 extends class_48
{
    
   
   private var var_273:class_91;
   
   function class_92(param1:class_91)
   {
      super();
      this.var_273 = param1;
   }
   
   override public function execute() : void
   {
      super.execute();
      if(this.var_273 != null && this.var_273.method_207)
      {
         this.var_273.method_378();
      }
   }
}
