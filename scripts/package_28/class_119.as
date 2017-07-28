package package_28
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class class_119
   {
       
      
      private var var_374:DisplayObject = null;
      
      private var var_376:Number = 1;
      
      private var var_377:Boolean;
      
      private var var_378:Boolean;
      
      private var var_172:Number = 0;
      
      private var var_173:Number = 0;
      
      private var var_170:Number = 0;
      
      private var var_171:Number = 0;
      
      private var var_375:Boolean;
      
      public function class_119(param1:DisplayObject = null, param2:Boolean = false)
      {
         super();
         this.var_374 = param1;
         this.var_375 = param2;
      }
      
      public function render() : BitmapData
      {
         var _loc4_:* = null;
         if(this.var_374 == null)
         {
            throw new Error("没有显示对象");
         }
         var _loc1_:Rectangle = this.var_374.getBounds(this.var_374.parent);
         var _loc2_:Number = this.var_170 == 0?Number(this.var_374.width):Number(this.var_170);
         var _loc3_:Number = this.var_171 == 0?Number(this.var_374.height):Number(this.var_171);
         _loc2_ = _loc2_ * this.var_376;
         _loc3_ = _loc3_ * this.var_376;
         var _loc5_:int = this.var_377 == true?-1:1;
         var _loc6_:int = this.var_378 == true?-1:1;
         var _loc7_:Number = this.var_377 == true?Number(_loc2_):Number(0);
         var _loc8_:Number = this.var_378 == true?Number(_loc3_):Number(0);
         var _loc9_:BitmapData = new BitmapData(_loc2_,_loc3_,true,0);
         if(this.var_375)
         {
            _loc4_ = new Matrix(1,0,0,1,this.var_374.x - _loc1_.x,this.var_374.y - _loc1_.y);
            _loc4_.scale(_loc5_ * this.var_376,_loc6_ * this.var_376);
            _loc4_.translate(_loc7_,_loc8_);
            _loc9_.draw(this.var_374,_loc4_);
         }
         else
         {
            _loc4_ = new Matrix(1,0,0,1,-this.var_172,-this.var_173);
            _loc4_.scale(_loc5_ * this.var_376,_loc6_ * this.var_376);
            _loc9_.draw(this.var_374,_loc4_);
         }
         return _loc9_;
      }
      
      public function method_439(param1:DisplayObject) : BitmapData
      {
         this.var_374 = param1;
         return this.render();
      }
      
      public function method_582(param1:Rectangle) : BitmapData
      {
         var _loc5_:* = null;
         if(this.var_374 == null)
         {
            throw new Error("没有显示对象");
         }
         var _loc2_:Rectangle = this.var_374.getBounds(this.var_374.parent);
         var _loc3_:Number = param1.width;
         var _loc4_:Number = param1.height;
         _loc3_ = _loc3_ * this.var_376;
         _loc4_ = _loc4_ * this.var_376;
         var _loc6_:int = this.var_377 == true?-1:1;
         var _loc7_:int = this.var_378 == true?-1:1;
         var _loc8_:Number = this.var_377 == true?Number(_loc3_):Number(0);
         var _loc9_:Number = this.var_378 == true?Number(_loc4_):Number(0);
         var _loc10_:BitmapData = new BitmapData(_loc3_,_loc4_,false,14934858);
         if(this.var_375)
         {
            _loc5_ = new Matrix(1,0,0,1,this.var_374.x - _loc2_.x,this.var_374.y - _loc2_.y);
            _loc5_.scale(_loc6_ * this.var_376,_loc7_ * this.var_376);
            _loc5_.translate(_loc8_,_loc9_);
            _loc10_.draw(this.var_374,_loc5_);
         }
         else
         {
            _loc5_ = new Matrix(1,0,0,1,-this.var_172,-this.var_173);
            _loc5_.scale(_loc6_ * this.var_376,_loc7_ * this.var_376);
            _loc10_.draw(this.var_374,_loc5_);
         }
         return _loc10_;
      }
      
      public function method_583() : Vector.<BitmapData>
      {
         return class_107.method_438(this);
      }
      
      public function get method_584() : Number
      {
         return this.var_376;
      }
      
      public function set method_584(param1:Number) : void
      {
         this.var_376 = param1;
      }
      
      public function get horizontal() : Boolean
      {
         return this.var_377;
      }
      
      public function set horizontal(param1:Boolean) : void
      {
         this.var_377 = param1;
      }
      
      public function get vertical() : Boolean
      {
         return this.var_378;
      }
      
      public function set vertical(param1:Boolean) : void
      {
         this.var_378 = param1;
      }
      
      public function get x() : Number
      {
         return this.var_172;
      }
      
      public function set x(param1:Number) : void
      {
         this.var_172 = param1;
      }
      
      public function get y() : Number
      {
         return this.var_173;
      }
      
      public function set y(param1:Number) : void
      {
         this.var_173 = param1;
      }
      
      public function get width() : Number
      {
         return this.var_170;
      }
      
      public function set width(param1:Number) : void
      {
         this.var_170 = param1;
      }
      
      public function get height() : Number
      {
         return this.var_171;
      }
      
      public function set height(param1:Number) : void
      {
         this.var_171 = param1;
      }
      
      public function get method_585() : Boolean
      {
         return this.var_375;
      }
      
      public function set method_585(param1:Boolean) : void
      {
         this.var_375 = param1;
      }
      
      public function get target() : DisplayObject
      {
         return this.var_374;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         this.var_374 = param1;
      }
   }
}
