package package_5
{
   import flash.utils.ByteArray;
   
   public class class_39
   {
       
      
      protected var var_106:ByteArray;
      
      protected var var_107:String = "utf-8";
      
      protected var var_108:uint;
      
      protected var var_105:Boolean;
      
      protected var var_109:uint;
      
      public function class_39(param1:ByteArray, param2:uint = 0, param3:Boolean = false)
      {
         super();
         this.var_105 = param3;
         if(param3)
         {
            this.var_106 = new ByteArray();
            param1.readBytes(this.var_106);
         }
         else
         {
            this.var_106 = param1;
         }
         this.var_106.position = param2;
      }
      
      public function method_182() : int
      {
         return this.var_106.readByte();
      }
      
      public function readUInt8() : int
      {
         return this.var_106.readUnsignedByte();
      }
      
      public function method_183() : int
      {
         return this.var_106.readShort();
      }
      
      public function method_184() : int
      {
         return this.var_106.readUnsignedShort();
      }
      
      public function readUInt32() : uint
      {
         return this.var_106.readUnsignedInt();
      }
      
      public function method_185() : int
      {
         return this.var_106.readInt();
      }
      
      public function method_186() : Number
      {
         return this.method_187();
      }
      
      public function method_187() : Number
      {
         return this.var_106.readDouble();
      }
      
      public function readString() : String
      {
         var _loc1_:int = this.var_106.readUnsignedInt();
         var _loc2_:String = this.var_106.readMultiByte(_loc1_,this.var_107);
         return _loc2_;
      }
      
      public function readBoolean() : Boolean
      {
         return this.var_106.readBoolean();
      }
      
      public function readFloat() : Number
      {
         return this.var_106.readFloat();
      }
      
      public function get position() : uint
      {
         return this.var_106.position;
      }
      
      public function set position(param1:uint) : void
      {
         this.var_106.position = param1;
      }
      
      public function get method_188() : String
      {
         return this.var_107;
      }
      
      public function set method_188(param1:String) : void
      {
         this.var_107 = param1;
      }
      
      public function get endian() : String
      {
         return this.var_106.endian;
      }
      
      public function set endian(param1:String) : void
      {
         this.var_106.endian = param1;
      }
      
      public function get length() : uint
      {
         return this.var_106.length;
      }
      
      public function get method_189() : ByteArray
      {
         return this.var_106;
      }
      
      public function clear() : void
      {
         this.var_106.clear();
      }
      
      public function clone() : *
      {
         this.var_106.position = 0;
         var _loc1_:ByteArray = new ByteArray();
         _loc1_.writeBytes(this.var_106);
         return new class_39(_loc1_,0,this.var_105);
      }
   }
}
