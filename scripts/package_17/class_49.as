package package_17
{
   import package_1.class_15;
   import package_13.class_45;
   import package_16.class_48;
   import package_2.class_7;
   import package_3.class_4;
   import package_5.class_40;
   
   public class class_49 extends class_48
   {
       
      
      public function class_49()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         class_4.method_1.method_120();
         var _loc1_:class_7 = class_4.method_7.method_76(class_7) as class_7;
         if(_loc1_ != null)
         {
            _loc1_.var_35 = new Date();
            class_15(class_4.method_7.method_8(class_15)).socketControl.socket.receive("0-0",this.method_210);
            class_15(class_4.method_7.method_8(class_15)).socketControl.socket.send("0-0",_loc1_.method_33);
         }
      }
      
      private function method_210(param1:class_45) : void
      {
         var _loc2_:class_40 = param1.var_56.clone();
         var _loc3_:String = _loc2_.readString();
         var _loc4_:class_7 = class_4.method_7.method_76(class_7) as class_7;
         _loc4_.var_36 = new Date();
         _loc4_.var_34 = (_loc4_.var_36 - _loc4_.var_35).toString();
         class_15(class_4.method_7.method_8(class_15)).socketControl.socket.method_84("0-0",this.method_210);
      }
   }
}
