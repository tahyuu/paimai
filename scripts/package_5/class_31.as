package package_5
{
   import flash.utils.ByteArray;
   import package_13.class_27;
   import package_18.class_76;
   
   public class class_31 extends ByteArray
   {
       
      
      public function class_31()
      {
         super();
      }
      
      public static function get method_154() : class_31
      {
         return new class_31();
      }
      
      public function method_155(param1:int) : void
      {
         if(param1 < -128)
         {
            param1 = -128;
         }
         if(param1 > 127)
         {
            param1 = 127;
         }
         this.writeByte(param1);
      }
      
      public function method_156(param1:int) : void
      {
         if(param1 > 255)
         {
            param1 = 255;
         }
         this.writeByte(param1);
      }
      
      public function method_157(param1:int) : void
      {
         if(param1 < -32768)
         {
            param1 = -32768;
         }
         if(param1 > 32767)
         {
            param1 = 32767;
         }
         this.writeShort(param1);
      }
      
      public function method_158(param1:uint) : void
      {
         if(param1 > 4294967295)
         {
            param1 = 4294967295;
         }
         this.writeUnsignedInt(param1);
      }
      
      public function method_159(param1:int) : void
      {
         if(param1 < -2147483648)
         {
            param1 = -2147483648;
         }
         if(param1 > 2147483648)
         {
            param1 = -2147483648;
         }
         this.writeInt(param1);
      }
      
      public function method_160(param1:*) : void
      {
         switch(class_27.serverType)
         {
            case class_76.const_2:
               this.method_161(param1);
         }
      }
      
      private function method_161(param1:Number) : void
      {
         if(param1 < -9223372036854770000)
         {
            param1 = -9223372036854770000;
         }
         if(param1 > 9223372036854770000)
         {
            param1 = 9223372036854770000;
         }
         this.writeDouble(param1);
      }
      
      private function method_162(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 9223372036854770000)
         {
            param1 = 9223372036854770000;
         }
         this.writeDouble(param1);
      }
      
      public function method_163(param1:Number) : void
      {
         switch(class_27.serverType)
         {
            case class_76.const_2:
               this.method_162(param1);
         }
      }
      
      public function method_32(param1:String, param2:String = "utf-8") : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeMultiByte(param1,param2);
         this.method_158(_loc3_.length);
         this.writeMultiByte(param1,param2);
      }
      
      public function method_164(param1:Boolean) : void
      {
         this.writeBoolean(param1);
      }
      
      public function method_165(param1:Number) : void
      {
         this.writeFloat(param1);
      }
   }
}
