package r1.deval.parser
{
   import package_29.class_143;
   
   public class class_129 extends Error
   {
      
      public static const const_88:String = "PARSING CODE ERROR";
       
      
      private var var_385:int;
      
      private var var_384:String;
      
      public function class_129(param1:String, param2:String, param3:int = 0)
      {
         super(method_591(param1));
         this.var_384 = param2;
         this.var_385 = param3;
      }
      
      public static function method_591(param1:String) : String
      {
         if(!param1)
         {
            return const_88;
         }
         if(!class_143.method_592(param1,"msg."))
         {
         }
         return param1;
      }
      
      public function get name_13() : int
      {
         return var_385;
      }
      
      public function get id() : String
      {
         return !!var_384?var_384:"";
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Parse Error: " + super.message;
         if(var_385 <= 0 && !var_384)
         {
            return _loc1_;
         }
         if(var_385 > 0)
         {
            _loc1_ = _loc1_ + (" [line:" + var_385);
         }
         if(id)
         {
            _loc1_ = _loc1_ + ("/" + id);
         }
         return _loc1_ + "]";
      }
   }
}
