package package_29
{
   import r1.deval.parser.class_129;
   
   public class class_141 extends Error
   {
       
      
      private var var_420:String;
      
      private var var_421:String;
      
      private var var_385:int;
      
      public function class_141(param1:String, param2:String = null, param3:String = null)
      {
         super(class_129.method_591(param1));
         var_420 = param2;
         var_421 = param3;
      }
      
      public function set name_13(param1:int) : void
      {
         var_385 = param1;
      }
      
      public function get name_13() : int
      {
         return var_385;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Runtime Error: " + super.message;
         if(var_385 > 0)
         {
            _loc1_ = _loc1_ + (" [line:" + var_385 + "]");
         }
         return _loc1_;
      }
   }
}
