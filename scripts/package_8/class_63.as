package package_8
{
   import flash.utils.getTimer;
   import package_16.class_48;
   import package_19.KeyInputEvent;
   import package_3.class_4;
   
   class class_63 extends class_48
   {
       
      
      public var var_77:Vector.<int>;
      
      private var var_136:int;
      
      function class_63()
      {
         super();
         this.var_77 = new Vector.<int>();
      }
      
      public function get method_117() : int
      {
         return this.var_136;
      }
      
      public function set method_117(param1:int) : void
      {
         var _loc2_:* = null;
         if(this.var_136 == 0)
         {
            _loc2_ = new KeyInputEvent(KeyInputEvent.ACTIVEKEYGROUP);
            class_4.method_20.dispatchEvent(_loc2_);
         }
         this.var_136 = param1;
      }
      
      override public function execute() : void
      {
         var _loc1_:* = null;
         super.execute();
         if(this.var_136 > 0)
         {
            if(getTimer() - this.var_136 > class_4.method_20.var_76)
            {
               _loc1_ = new KeyInputEvent(KeyInputEvent.RELEASEKEYGROUP);
               _loc1_.var_135 = this.method_234(this.var_77);
               _loc1_.var_77 = this.var_77;
               class_4.method_20.dispatchEvent(_loc1_);
               this.var_136 = 0;
               this.var_77 = new Vector.<int>();
            }
         }
      }
      
      private function method_234(param1:Vector.<int>) : Vector.<class_62>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc2_:Vector.<class_62> = new Vector.<class_62>();
         for each(_loc5_ in param1)
         {
            _loc6_ = new class_62();
            if(_loc4_ == 0)
            {
               _loc4_ = _loc5_;
               _loc6_.keyCode = _loc4_;
               _loc6_.keepDownCount = 1;
               _loc2_.push(_loc6_);
            }
            if(_loc4_ != 0)
            {
               _loc3_ = _loc4_;
               _loc4_ = _loc5_;
               if(_loc3_ == _loc4_)
               {
                  _loc2_[_loc2_.length - 1].keepDownCount++;
               }
               else
               {
                  _loc6_.keyCode = _loc4_;
                  _loc6_.keepDownCount = 1;
                  _loc2_.push(_loc6_);
               }
            }
         }
         return _loc2_;
      }
   }
}
