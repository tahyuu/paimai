package package_28
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class class_107
   {
       
      
      public function class_107()
      {
         super();
      }
      
      public static function method_438(param1:class_119) : Vector.<BitmapData>
      {
         var _loc2_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc3_:MovieClip = MovieClip(param1.target);
         var _loc4_:int = 1;
         while(_loc4_ <= _loc3_.totalFrames)
         {
            _loc3_.gotoAndStop(_loc4_);
            _loc2_.push(param1.method_439(_loc3_));
            _loc4_++;
         }
         return _loc2_;
      }
      
      public static function method_440(param1:BitmapData, param2:uint, param3:uint, param4:uint = 16777215) : void
      {
         if(param1 == null || param1.width < 1)
         {
            return;
         }
         param1.threshold(param1,param1.rect,new Point(),"==",param2,param3,param4,true);
      }
      
      public static function method_441(param1:BitmapData) : Rectangle
      {
         if(param1 == null || param1.width < 1)
         {
            return new Rectangle();
         }
         return param1.getColorBoundsRect(4278190080,0,false);
      }
      
      public static function method_442(param1:BitmapData) : BitmapData
      {
         var _loc2_:Rectangle = method_441(param1);
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
         _loc3_.copyPixels(param1,_loc2_,new Point(0,0));
         return _loc3_;
      }
      
      public static function method_443(param1:BitmapData) : Boolean
      {
         if(param1 == null || param1.width < 1)
         {
            return false;
         }
         return method_441(param1).equals(new Rectangle());
      }
      
      public static function method_376(param1:Bitmap) : Boolean
      {
         if(param1["@doswf__s"] == null)
         {
            return true;
         }
         var _loc2_:BitmapData = param1.bitmapData;
         var _loc3_:Point = method_59(param1);
         var _loc4_:Point = new Point(param1["@doswf__s"].mouseX,param1["@doswf__s"].mouseY);
         return (_loc2_.getPixel32(param1["@doswf__s"].mouseX - _loc3_.x,param1["@doswf__s"].mouseY - _loc3_.y) >> 24 & 255) != 0;
      }
      
      private static function method_59(param1:DisplayObject) : Point
      {
         return param1.parent.localToGlobal(new Point(param1.x,param1.y));
      }
   }
}
