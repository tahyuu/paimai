package package_13
{
   import package_5.class_40;
   import zebra.directEvent.DirectEventParameter;
   
   public class class_45 extends DirectEventParameter
   {
       
      
      public var var_56:class_40;
      
      private var var_31:class_27;
      
      public function class_45(param1:class_40, param2:class_27)
      {
         super();
         this.var_56 = param1;
         this.var_31 = param2;
      }
      
      public function get name_5() : String
      {
         return this.var_31.name_5;
      }
      
      public function get method_205() : class_27
      {
         return this.var_31;
      }
   }
}
