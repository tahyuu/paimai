package package_18
{
   import flash.net.SharedObject;
   
   public class class_59
   {
       
      
      private var var_130:uint;
      
      private var var_129:String;
      
      private var var_131:SharedObject;
      
      public function class_59(param1:String = "@zebraGame", param2:uint = 1.5768E7, param3:Boolean = false)
      {
         super();
         this.var_129 = param1;
         this.var_130 = param2;
         this.var_131 = SharedObject.getLocal(this.var_129,"/");
         if(param3)
         {
            this.method_221();
         }
      }
      
      public function get name() : String
      {
         return this.var_129;
      }
      
      public function get method_222() : uint
      {
         return this.var_130;
      }
      
      public function method_221() : void
      {
         var _loc2_:* = undefined;
         var _loc1_:* = this.var_131.data.cookie;
         if(_loc1_ == undefined)
         {
            return;
         }
         for(_loc2_ in _loc1_)
         {
            if(_loc1_[_loc2_] == undefined || _loc1_[_loc2_].time == undefined || this.method_223(_loc1_[_loc2_].time))
            {
               delete _loc1_[_loc2_];
            }
         }
         this.var_131.data.cookie = _loc1_;
         this.var_131.flush();
      }
      
      public function clear() : void
      {
         this.var_131.clear();
      }
      
      public function method_224(param1:String, param2:*) : void
      {
         var _loc4_:* = null;
         var _loc3_:Date = new Date();
         param1 = "$key_" + param1;
         if(this.var_131.data.cookie == undefined || this.var_131.data.cookie == null)
         {
            _loc4_ = new Object();
            _loc4_[param1] = param2;
            _loc4_[param1].time = _loc3_.getTime();
            this.var_131.data.cookie = _loc4_;
         }
         else
         {
            this.var_131.data.cookie[param1] = param2;
            this.var_131.data.cookie[param1].time = _loc3_.getTime();
         }
         this.var_131.flush();
      }
      
      public function method_225(param1:String) : Object
      {
         return !!this.contains(param1)?this.var_131.data.cookie["$key_" + param1]:null;
      }
      
      public function method_91(param1:String) : void
      {
         if(this.contains(param1))
         {
            delete this.var_131.data.cookie["$key_" + param1];
            this.var_131.flush();
         }
      }
      
      public function contains(param1:String) : Boolean
      {
         param1 = "$key_" + param1;
         return this.var_131.data.cookie != undefined && this.var_131.data.cookie[param1] != undefined;
      }
      
      private function method_223(param1:Number) : Boolean
      {
         var _loc2_:Date = new Date();
         return param1 + this.var_130 * 1000 < _loc2_.getTime();
      }
   }
}
