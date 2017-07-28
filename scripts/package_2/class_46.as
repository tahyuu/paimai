package package_2
{
   import package_14.class_37;
   import package_4.class_6;
   
   public class class_46 extends class_6
   {
       
      
      public var var_59:int = 15;
      
      public var var_58:int = 5;
      
      private var var_121:int = 0;
      
      public var var_122:int = 6;
      
      public function class_46()
      {
         super();
      }
      
      public function get method_206() : int
      {
         return this.var_121;
      }
      
      public function method_79() : void
      {
         this.var_121 = this.var_58 - this.var_59;
      }
      
      public function method_170() : int
      {
         if(class_37.var_60 >= this.var_58)
         {
            return 100;
         }
         return (class_37.var_60 - this.var_59) / (this.var_58 - this.var_59) * 100;
      }
   }
}
