package package_17
{
   import flash.utils.ByteArray;
   import package_1.class_34;
   import package_13.class_45;
   import package_16.class_48;
   import package_2.class_77;
   import package_3.class_4;
   
   public class class_81 extends class_48
   {
       
      
      public function class_81()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         class_4.method_1.method_120();
         var _loc1_:class_77 = class_4.method_7.method_76(class_77) as class_77;
         if(_loc1_ != null)
         {
            _loc1_.var_35 = new Date();
            class_34(class_4.method_7.method_8(class_34)).socketControl.socket.send("0-0",_loc1_.method_33);
         }
      }
      
      private function method_210(param1:class_45) : void
      {
         var _loc2_:class_77 = class_4.method_7.method_76(class_77) as class_77;
         _loc2_.var_36 = new Date();
         _loc2_.var_34 = (_loc2_.var_36 - _loc2_.var_35).toString();
         class_34(class_4.method_7.method_8(class_34)).socketControl.socket.method_84("0-0",this.method_210);
      }
      
      private function method_342(param1:String, param2:int) : String
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(param1,"");
         if(_loc3_.length <= param2)
         {
            return param1;
         }
         _loc3_.position = 0;
         return _loc3_.readMultiByte(param2 - 6,"") + "......";
      }
   }
}
