package package_29
{
   class class_130 implements class_115
   {
       
      
      function class_130()
      {
         super();
      }
      
      public function getNumber() : Number
      {
         return Number(getAny());
      }
      
      public function getBoolean() : Boolean
      {
         return Boolean(getAny());
      }
      
      public function getAny() : Object
      {
         throw new Error("UNIMPLEMENTED");
      }
      
      public function method_452() : String
      {
         var _loc1_:Object = getAny();
         if(_loc1_ == null)
         {
            return null;
         }
         return _loc1_.toString();
      }
   }
}
