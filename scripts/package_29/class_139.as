package package_29
{
   public class class_139 implements class_115
   {
       
      
      var var_419:Array;
      
      public function class_139(param1:class_115, param2:class_115)
      {
         var_419 = [];
         super();
         if(param1 != null)
         {
            var_419.push(param1);
         }
         if(param2 != null)
         {
            var_419.push(param2);
         }
      }
      
      public function add(param1:class_115) : void
      {
         var_419.push(param1);
      }
      
      public function getNumber() : Number
      {
         return Number(getAny());
      }
      
      public function method_557() : class_115
      {
         if(var_419.length == 1)
         {
            return var_419[0] as class_115;
         }
         return this;
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
      
      public function getBoolean() : Boolean
      {
         return Boolean(getAny());
      }
      
      public function getAny() : Object
      {
         var _loc1_:int = 0;
         while(_loc1_ < var_419.length - 1)
         {
            (var_419[_loc1_] as class_115).getAny();
            _loc1_++;
         }
         return (var_419[var_419.length - 1] as class_115).getAny();
      }
   }
}
