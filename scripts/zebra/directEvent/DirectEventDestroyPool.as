package zebra.directEvent
{
   class DirectEventDestroyPool
   {
       
      
      private var var_149:DirectEventListenerPool;
      
      private var var_91:DirectEventScope;
      
      function DirectEventDestroyPool(param1:DirectEventScope, param2:DirectEventListenerPool)
      {
         super();
         this.var_91 = param1;
         this.var_149 = param2;
      }
      
      public function method_248(param1:String) : Array
      {
         return this.var_91.method_136(param1).method_245.method_247;
      }
      
      public function method_249(param1:String) : Vector.<String>
      {
         return this.var_91.method_136(param1).method_245.method_246;
      }
      
      public function add(param1:String, param2:*, param3:String) : void
      {
         if(!this.method_139(param1,param2,param3))
         {
            this.method_249(param3).push(param1);
            this.method_248(param3).push(param2);
         }
      }
      
      public function method_139(param1:String, param2:*, param3:String) : Boolean
      {
         var _loc4_:Array = this.method_248(param3);
         var _loc5_:Vector.<String> = this.method_249(param3);
         var _loc6_:int = _loc4_.indexOf(param2);
         if(_loc6_ == -1)
         {
            return false;
         }
         if(_loc6_ != -1 && _loc5_[_loc6_] != param1)
         {
            return false;
         }
         return true;
      }
      
      public function method_91(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = undefined;
         var _loc10_:int = 0;
         var _loc2_:Array = this.method_248(param1);
         var _loc3_:Vector.<String> = this.method_249(param1);
         var _loc4_:int = _loc3_.length - 1;
         var _loc9_:int = _loc4_;
         while(_loc9_ >= 0)
         {
            _loc5_ = _loc3_[_loc9_];
            _loc6_ = _loc2_[_loc9_];
            _loc10_ = this.var_149.method_250(param1) - 1;
            while(_loc10_ >= 0)
            {
               if(_loc5_ == this.var_149.method_134(param1)[_loc10_] && _loc6_ == this.var_149.method_135(param1)[_loc10_])
               {
                  this.var_149.method_91(_loc5_,_loc6_,param1);
                  this.method_251(_loc5_,_loc6_,param1);
               }
               _loc10_--;
            }
            _loc9_--;
         }
      }
      
      private function method_251(param1:String, param2:*, param3:String) : void
      {
         var _loc9_:int = 0;
         var _loc4_:Array = this.method_248(param3);
         var _loc5_:Vector.<String> = this.method_249(param3);
         var _loc6_:Vector.<int> = new Vector.<int>();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(_loc5_[_loc7_] == param1 && _loc4_[_loc7_] == param2)
            {
               _loc6_.push(_loc7_);
            }
            _loc7_++;
         }
         _loc6_.reverse();
         var _loc8_:int = _loc6_.length - 1;
         var _loc10_:int = _loc8_;
         while(_loc10_ >= 0)
         {
            _loc9_ = _loc6_[_loc10_];
            _loc5_.splice(_loc9_,1);
            _loc4_.splice(_loc9_,1);
            _loc10_--;
         }
      }
   }
}
