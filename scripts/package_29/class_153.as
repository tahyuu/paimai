package package_29
{
   import r1.deval.parser.class_112;
   
   public class class_153 implements class_115
   {
       
      
      var var_440:int;
      
      var base:class_115;
      
      public function class_153(param1:class_115, param2:int)
      {
         super();
         this.base = param1;
         this.var_440 = param2;
      }
      
      private function method_636(param1:Boolean, param2:Boolean) : Number
      {
         var _loc3_:class_128 = base as class_128;
         if(_loc3_ == null)
         {
            throw new class_141("msg.rt.incdec.on.const");
         }
         var _loc4_:Number = base.getNumber();
         _loc3_.method_590(_loc4_ + (!!param1?1:-1));
         return !!param2?Number(_loc4_):Number(_loc4_ + (!!param1?1:-1));
      }
      
      public function getNumber() : Number
      {
         switch(var_440)
         {
            case class_112.NOT:
            case class_112.DELETE:
               return Number(getBoolean());
            case class_112.BITNOT:
               return ~base.getNumber();
            case class_112.SUB:
               return -base.getNumber();
            case class_112.INC:
            case class_112.DEC:
               return method_636(var_440 == class_112.INC,false);
            case class_112.POSTFIX_INC:
            case class_112.POSTFIX_DEC:
               return method_636(var_440 == class_112.POSTFIX_INC,true);
            default:
               return 0;
         }
      }
      
      public function method_452() : String
      {
         switch(var_440)
         {
            case class_112.NOT:
            case class_112.DELETE:
               return getBoolean().toString();
            case class_112.ESCXMLATTR:
               return "\"" + base.method_452() + "\"";
            case class_112.ESCXMLTEXT:
               return XML(getAny()).toXMLString();
            case class_112.TYPEOF:
               return typeof base.getAny();
            case class_112.VOID:
               return "";
            default:
               return getNumber().toString();
         }
      }
      
      public function getAny() : Object
      {
         var _loc1_:* = null;
         switch(var_440)
         {
            case class_112.NOT:
            case class_112.DELETE:
               return getBoolean();
            case class_112.TYPEOF:
            case class_112.ESCXMLATTR:
               return method_452();
            case class_112.ESCXMLTEXT:
               _loc1_ = base.method_452();
               if(class_143.method_592(_loc1_,"<>"))
               {
                  return new XMLList(_loc1_);
               }
               return new XML(_loc1_);
            case class_112.VOID:
               return null;
            default:
               return getNumber();
         }
      }
      
      public function getBoolean() : Boolean
      {
         switch(var_440)
         {
            case class_112.NOT:
               return !base.getBoolean();
            case class_112.ESCXMLATTR:
            case class_112.ESCXMLTEXT:
               return false;
            case class_112.DELETE:
               try
               {
                  return (base as class_128).method_589();
               }
               catch(e:Error)
               {
               }
               return false;
            default:
               return Boolean(getNumber());
         }
      }
   }
}
