package package_29
{
   public class class_127 implements class_115
   {
      
      public static const FALSE:class_127 = new class_127(false);
      
      public static const NULL:class_127 = new class_127(null);
      
      public static const const_85:class_127 = new class_127(0);
      
      public static const const_86:class_127 = new class_127("");
      
      public static const const_83:class_127 = new class_127(1);
      
      public static const TRUE:class_127 = new class_127(true);
      
      public static const const_84:class_127 = new class_127(-1);
       
      
      var value:Object;
      
      public function class_127(param1:Object)
      {
         super();
         this.value = param1;
      }
      
      public function method_452() : String
      {
         return value == null?"null":value.toString();
      }
      
      public function getBoolean() : Boolean
      {
         return Boolean(value);
      }
      
      public function getAny() : Object
      {
         return value;
      }
      
      public function getNumber() : Number
      {
         return value == null?0:Number(Number(value));
      }
   }
}
