package package_29
{
   import flash.system.ApplicationDomain;
   import r1.deval.parser.class_112;
   
   public class class_154 extends class_153
   {
      
      private static const const_95:int = -7;
      
      private static const const_90:int = -2;
      
      private static const const_91:int = -3;
      
      private static const const_94:int = -6;
      
      private static const const_93:int = -5;
      
      private static const const_96:int = -8;
      
      private static const const_92:int = -4;
      
      private static const const_89:int = -1;
       
      
      private var type;
      
      private var id:int;
      
      public function class_154(param1:class_115, param2:*, param3:int)
      {
         var _loc4_:* = null;
         super(param1,param3);
         this.type = param2 as class_115;
         id = const_89;
         if(param2 is String)
         {
            _loc4_ = String(param2).toLowerCase();
            if(_loc4_ == "int")
            {
               id = const_92;
            }
            else if(_loc4_ == "uint")
            {
               id = const_93;
            }
            else if(_loc4_ == "number")
            {
               id = const_91;
            }
            else if(_loc4_ == "string")
            {
               id = const_94;
            }
            else if(_loc4_ == "boolean")
            {
               id = const_96;
            }
            else if(_loc4_ == "date")
            {
               id = const_95;
            }
            else if(_loc4_ == "array")
            {
               id = const_90;
            }
         }
      }
      
      override public function getNumber() : Number
      {
         return Number(getBoolean());
      }
      
      public function method_637() : Array
      {
         if(var_440 != class_112.IN)
         {
            return null;
         }
         return [base,type];
      }
      
      override public function method_452() : String
      {
         return getBoolean().toString();
      }
      
      override public function getBoolean() : Boolean
      {
         var var_444:String = null;
         var var_443:Class = null;
         var x:Object = null;
         if(var_440 == class_112.AS)
         {
            return Boolean(getAny());
         }
         var o:Object = base.getAny();
         if(var_440 == class_112.IN)
         {
            try
            {
               return o in (type as class_115).getAny();
            }
            catch(e:Error)
            {
               return false;
            }
            if(id == const_89)
            {
               var_443 = null;
               if(type is String)
               {
                  var_444 = type as String;
                  §§push(§§pop());
               }
               x = (type as class_115).getAny();
               if(x is Class)
               {
                  var_443 = x as Class;
               }
               else
               {
                  var_444 = x.toString();
               }
               throw _loc1_;
            }
            switch(id)
            {
               case const_92:
                  return o is int;
               case const_93:
                  return o is uint;
               case const_91:
                  return o is Number;
               case const_96:
                  return o is Boolean;
               case const_94:
                  return o is String;
               case const_95:
                  return o is Date;
               case const_90:
                  return o is Array;
               default:
                  return false;
            }
         }
         else
         {
            if(id == const_89)
            {
               var_443 = null;
               if(type is String)
               {
                  var_444 = type as String;
                  §§push(§§pop());
               }
               x = (type as class_115).getAny();
               if(x is Class)
               {
                  var_443 = x as Class;
               }
               else
               {
                  var_444 = x.toString();
               }
               throw _loc1_;
            }
            switch(id)
            {
               case const_92:
                  return o is int;
               case const_93:
                  return o is uint;
               case const_91:
                  return o is Number;
               case const_96:
                  return o is Boolean;
               case const_94:
                  return o is String;
               case const_95:
                  return o is Date;
               case const_90:
                  return o is Array;
               default:
                  return false;
            }
         }
      }
      
      override public function getAny() : Object
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * 反混淆被激活，但是反编译还是失败了。如果文件不混乱，禁用“自动反混淆”效果会更好。
          * Error type: ConvertException (Invalid jump to ofs0165 on line -1)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
   }
}
