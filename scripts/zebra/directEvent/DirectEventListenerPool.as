package zebra.directEvent
{
   class DirectEventListenerPool
   {
       
      
      private var var_91:DirectEventScope;
      
      function DirectEventListenerPool(param1:DirectEventScope)
      {
         super();
         this.var_91 = param1;
      }
      
      public function method_134(param1:String) : Vector.<String>
      {
         if(this.var_91.method_136(param1) == null)
         {
            return null;
         }
         return this.var_91.method_136(param1).method_244.method_246;
      }
      
      public function method_135(param1:String) : Array
      {
         if(this.var_91.method_136(param1) == null)
         {
            return null;
         }
         return this.var_91.method_136(param1).method_244.method_247;
      }
      
      public function method_250(param1:String) : int
      {
         return this.var_91.method_136(param1).method_244.method_246.length;
      }
      
      public function add(param1:String, param2:*, param3:String) : void
      {
         if(!this.method_139(param1,param2,param3))
         {
            this.method_134(param3).push(param1);
            this.method_135(param3).push(param2);
         }
      }
      
      public function method_137(param1:String, param2:String) : Boolean
      {
         return this.method_134(param2).indexOf(param1) != -1;
      }
      
      public function method_139(param1:String, param2:*, param3:String) : Boolean
      {
         var _loc4_:Array = this.method_135(param3);
         var _loc5_:Vector.<String> = this.method_134(param3);
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
      
      public function method_91(param1:String, param2:*, param3:String) : void
      {
         var _loc9_:int = 0;
         var _loc4_:Array = this.method_135(param3);
         var _loc5_:Vector.<String> = this.method_134(param3);
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
