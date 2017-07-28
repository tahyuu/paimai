package package_8
{
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.utils.getTimer;
   import package_3.class_4;
   
   public class class_22 extends EventDispatcher
   {
       
      
      public var var_76:int = 380;
      
      private var var_75:class_63;
      
      public function class_22()
      {
         super();
         this.var_75 = new class_63();
         class_4.method_18.method_82(this.var_75);
         class_4.method_9.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.method_116);
      }
      
      private function method_116(param1:KeyboardEvent) : void
      {
         this.var_75.method_117 = getTimer();
         this.var_75.var_77.push(param1.keyCode);
      }
      
      private function method_118(param1:*) : Vector.<class_62>
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Vector.<class_62> = new Vector.<class_62>();
         if(param1 is String)
         {
            _loc3_ = String(param1).split(",");
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc5_ = String(_loc3_[_loc4_]).split("_");
               if(_loc5_.length == 1)
               {
                  _loc5_.push(1);
               }
               _loc6_ = new class_62();
               _loc6_.keyCode = _loc5_[0];
               _loc6_.keepDownCount = _loc5_[1];
               _loc2_.push(_loc6_);
               _loc4_++;
            }
         }
         return _loc2_;
      }
      
      public function method_119(param1:Vector.<class_62>, param2:*) : Boolean
      {
         var _loc3_:* = null;
         if(param2 is String)
         {
            _loc3_ = this.method_118(param2);
         }
         else
         {
            _loc3_ = param2;
         }
         if(param1.length != _loc3_.length)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_].keyCode != _loc3_[_loc4_].keyCode || param1[_loc4_].keepDownCount < _loc3_[_loc4_].keepDownCount)
            {
               return false;
            }
            _loc4_++;
         }
         return true;
      }
   }
}
