package package_5
{
   import flash.utils.ByteArray;
   
   public class class_40 extends class_39
   {
       
      
      protected var var_110:uint;
      
      protected var var_111:int;
      
      protected var var_112:int;
      
      public function class_40(param1:ByteArray, param2:uint = 0, param3:Boolean = false)
      {
         super(param1,param2,param3);
         this.var_110 = this.readUInt32();
         this.var_111 = this.readUInt8();
         this.var_112 = this.readUInt8();
      }
      
      public function get method_190() : uint
      {
         return this.var_110;
      }
      
      public function get method_191() : int
      {
         return this.var_111;
      }
      
      public function get method_192() : int
      {
         return this.var_112;
      }
      
      override public function clone() : *
      {
         var_106.position = 0;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeBytes(var_106);
         return new class_40(_loc1_,0,var_105);
      }
   }
}
