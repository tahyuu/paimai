package zebra.graphics.animation
{
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import package_19.BitmapBatchEvent;
   
   public class class_61
   {
       
      
      private var var_132:Vector.<class_91>;
      
      private var var_133:Vector.<Stage>;
      
      private var var_134:class_91;
      
      public function class_61()
      {
         super();
         this.var_132 = new Vector.<class_91>();
         this.var_133 = new Vector.<Stage>();
      }
      
      public function add(param1:class_91) : void
      {
         this.var_132.push(param1);
         if(this.var_133.indexOf(param1["@doswf__s"]) == -1)
         {
            this.var_133.push(param1["@doswf__s"]);
            param1["@doswf__s"].addEventListener(MouseEvent.CLICK,this.method_226);
            param1["@doswf__s"].addEventListener(MouseEvent.MOUSE_DOWN,this.method_227);
            param1["@doswf__s"].addEventListener(MouseEvent.MOUSE_MOVE,this.method_228);
         }
      }
      
      private function method_228(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc3_:Stage = param1.target.stage;
         var _loc4_:Point = new Point(_loc3_.mouseX,_loc3_.mouseY);
         var _loc5_:Array = _loc3_.getObjectsUnderPoint(_loc4_);
         _loc5_.reverse();
         if(_loc5_.length == 0 && this.var_134 != null)
         {
            _loc2_ = new BitmapBatchEvent(BitmapBatchEvent.BITMAPOUT);
            this.var_134.dispatchEvent(_loc2_);
            if(this.var_134.method_229 != null)
            {
               this.var_134.method_229(this.var_134);
            }
            this.var_134 = null;
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            if(_loc5_[_loc6_] is class_91)
            {
               _loc7_ = class_91(_loc5_[_loc6_]);
               if(this.var_134 == _loc7_ && !_loc7_.IsHitMouse)
               {
                  _loc2_ = new BitmapBatchEvent(BitmapBatchEvent.BITMAPOUT);
                  this.var_134.dispatchEvent(_loc2_);
                  if(this.var_134.method_229 != null)
                  {
                     this.var_134.method_229(this.var_134);
                  }
                  this.var_134 = null;
                  return;
               }
               if(_loc7_.IsHitMouse)
               {
                  if(this.var_134 != _loc7_)
                  {
                     this.var_134 = _loc7_;
                     _loc2_ = new BitmapBatchEvent(BitmapBatchEvent.BITMAPHOVER);
                     _loc7_.dispatchEvent(_loc2_);
                     if(_loc7_.method_230 != null)
                     {
                        _loc7_.method_230(_loc7_);
                     }
                  }
                  return;
               }
            }
            _loc6_++;
         }
      }
      
      private function method_226(param1:MouseEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Stage = param1.target.stage;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Point = new Point(_loc2_.mouseX,_loc2_.mouseY);
         var _loc4_:Array = _loc2_.getObjectsUnderPoint(_loc3_);
         _loc4_.reverse();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc4_[_loc5_] is class_91 && _loc4_[_loc5_].IsHitMouse)
            {
               _loc6_ = new BitmapBatchEvent(BitmapBatchEvent.BITMAPCLICK);
               _loc7_ = class_91(_loc4_[_loc5_]);
               _loc7_.dispatchEvent(_loc6_);
               if(_loc7_.method_231 != null)
               {
                  _loc7_.method_231(_loc7_);
               }
               if(_loc7_.method_232 != null)
               {
                  _loc7_.method_232(_loc7_);
                  break;
               }
               break;
            }
            _loc5_++;
         }
      }
      
      private function method_227(param1:MouseEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:Stage = param1.target.stage;
         var _loc3_:Point = new Point(_loc2_.mouseX,_loc2_.mouseY);
         var _loc4_:Array = _loc2_.getObjectsUnderPoint(_loc3_);
         _loc4_.reverse();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc4_[_loc5_] is class_91 && _loc4_[_loc5_].IsHitMouse)
            {
               _loc6_ = class_91(_loc4_[_loc5_]);
               _loc7_ = new BitmapBatchEvent(BitmapBatchEvent.BITMAPDOWN);
               _loc6_.dispatchEvent(_loc7_);
               if(_loc6_.method_233 != null)
               {
                  _loc6_.method_233(_loc6_);
               }
               return;
            }
            _loc5_++;
         }
      }
      
      public function method_91(param1:class_91) : void
      {
         var _loc2_:int = this.var_132.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.var_132.splice(_loc2_,1);
         }
      }
   }
}
