package package_29
{
   import r1.deval.parser.class_112;
   
   public class class_126 extends class_112
   {
       
      
      public function class_126()
      {
         super();
      }
      
      public function method_530(param1:String, param2:class_115 = null, param3:class_115 = null) : class_115
      {
         return method_497(param3,new class_150(param1,param2));
      }
      
      public function method_473(param1:class_115) : class_115
      {
         return new class_153(param1,ESCXMLATTR);
      }
      
      public function method_500(param1:class_115, param2:*, param3:Boolean, param4:Boolean, param5:Boolean = false) : class_115
      {
         if(param1 is class_152 && class_152(param1).method_587(param3,param4,param5))
         {
            class_152(param1).addOperand(param2);
            return param1;
         }
         return new class_152(param1,param2,param3,param4,param5);
      }
      
      public function method_450(param1:class_115, param2:*, param3:class_115 = null, param4:Boolean = false, param5:Boolean = false) : class_115
      {
         var _loc6_:* = param2;
         if(_loc6_ is class_127)
         {
            _loc6_ = (_loc6_ as class_127).getAny();
         }
         if(param3 == null && !param4 && !param5)
         {
            return new class_160(param1,_loc6_);
         }
         return new class_161(param1,_loc6_,param3,false,param4,param5);
      }
      
      public function method_483(param1:class_115, param2:class_115, param3:int) : class_115
      {
         if(param1 is class_157)
         {
            class_157(param1).addOperand(param2,param3);
            return param1;
         }
         return new class_157(param1,[param2],[param3]);
      }
      
      public function method_477(param1:class_115, param2:int) : class_115
      {
         if(param2 == ADD)
         {
            return param1;
         }
         if(param2 == SUB)
         {
            if(param1 is class_127)
            {
               if(param1 == class_127.const_83)
               {
                  return class_127.const_84;
               }
               if(param1.getAny() is Number)
               {
                  return new class_127(-param1.getNumber());
               }
            }
         }
         return new class_153(param1,param2);
      }
      
      public function method_465(param1:class_128, param2:class_115, param3:int, param4:int) : class_115
      {
         return new class_155(param1,param2,param3,param4);
      }
      
      public function method_505(param1:class_115, param2:class_115) : class_115
      {
         return new class_161(param1,param2,null,true);
      }
      
      public function method_509(param1:Object, param2:Boolean = false, param3:Array = null) : class_115
      {
         return !!param2?new class_127(param1):new class_148(param1,param3);
      }
      
      public function method_495(param1:class_115, param2:*, param3:int) : class_115
      {
         if(param1 is class_151 && class_151(param1).method_587(param3))
         {
            class_151(param1).addOperand(param2);
            return param1;
         }
         return new class_151(param1,param2,param3);
      }
      
      public function method_490(param1:class_115, param2:class_115, param3:int) : class_115
      {
         if(param1 is class_149)
         {
            class_149(param1).addOperand(param2,param3);
            return param1;
         }
         return new class_149(param1,[param2],[param3]);
      }
      
      public function literal(param1:Object) : class_115
      {
         if(param1 is Number)
         {
            if(param1 == 0)
            {
               return class_127.const_85;
            }
            if(param1 == 1)
            {
               return class_127.const_83;
            }
            if(param1 == -1)
            {
               return class_127.const_84;
            }
         }
         else
         {
            if(param1 is Boolean)
            {
               return param1 == true?class_127.TRUE:class_127.FALSE;
            }
            if(param1 == null)
            {
               return class_127.NULL;
            }
            if(param1 == "")
            {
               return class_127.const_86;
            }
         }
         return new class_127(param1);
      }
      
      public function method_588(param1:class_115, param2:class_115) : class_115
      {
         if(param1 is class_127 && param2 is class_127)
         {
            return new class_127(new QName(param1.getAny() as Namespace,param2.method_452()));
         }
         return new class_156(param1,param2);
      }
      
      public function method_501(param1:class_115, param2:class_115, param3:int) : class_115
      {
         return new class_154(param1,param2,param3);
      }
      
      public function method_510() : class_115
      {
         return class_158.const_87;
      }
      
      public function method_506(param1:class_115) : class_131
      {
         return new class_131(false,param1);
      }
      
      public function method_471(param1:class_115, param2:class_115, param3:Boolean = true) : class_115
      {
         if(param1 == null)
         {
            return !!param3?param2:method_477(param2,SUB);
         }
         if(param1 is class_162)
         {
            class_162(param1).addOperand(param2,param3);
            return param1;
         }
         return new class_162(param1,[param2],[param3]);
      }
      
      public function method_512(param1:String, param2:String) : class_115
      {
         return new class_127(new RegExp(param1,param2));
      }
      
      public function method_502(param1:class_115) : class_131
      {
         return new class_131(true,param1);
      }
      
      public function method_508(param1:class_115, param2:class_115, param3:class_115) : class_115
      {
         return new class_159(param1,param2,param3);
      }
      
      public function method_488(param1:class_115, param2:class_115, param3:int) : class_115
      {
         if(param1 is class_147)
         {
            class_147(param1).addOperand(param2,param3);
            return param1;
         }
         return new class_147(param1,[param2],[param3]);
      }
      
      public function method_474(param1:class_115, param2:class_115) : class_115
      {
         return new class_153(method_471(param1,param2),ESCXMLTEXT);
      }
      
      public function method_497(param1:class_115, param2:class_115) : class_115
      {
         if(param1 == null)
         {
            return param2;
         }
         if(param1 is class_139)
         {
            class_139(param1).add(param2);
            return param1;
         }
         return new class_139(param1,param2);
      }
   }
}
