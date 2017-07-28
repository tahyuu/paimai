package r1.deval.parser
{
   import package_29.class_115;
   import package_29.class_116;
   import package_29.class_118;
   import package_29.class_126;
   import package_29.class_127;
   import package_29.class_128;
   import package_29.class_131;
   
   public class class_113 extends class_112
   {
      
      protected static const const_79:int = 131072;
      
      protected static const CLEAR_TI_MASK:int = 65535;
      
      protected static const TI_AFTER_EOL:int = 65536;
       
      
      private var var_313:int;
      
      protected var var_310:class_126;
      
      protected var var_314:int;
      
      private var var_312:Boolean;
      
      protected var var_311:class_132;
      
      public function class_113()
      {
         super();
         this.var_310 = new class_126();
      }
      
      protected function method_448(param1:class_115, param2:String, param3:Boolean = false, param4:Boolean = false) : class_115
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         if(method_449(COLONCOLON))
         {
            _loc5_ = var_310.method_450(null,param2);
            _loc6_ = method_451();
            switch(_loc6_)
            {
               case NAME:
                  param2 = var_311.method_452();
                  break;
               case MUL:
                  param2 = "*";
                  break;
               case LB:
                  param1 = var_310.method_450(param1,method_453(),_loc5_,param3,param4);
                  method_454(RB,"msg.no.bracket.index","k07");
                  return param1;
               default:
                  method_455("msg.no.name.after.coloncolon","K08");
                  param2 = "?";
            }
         }
         return var_310.method_450(param1,param2,_loc5_,param3,param4);
      }
      
      protected function method_456() : void
      {
         var_312 = true;
         var_313 = var_314;
         var_314 = NAME;
      }
      
      private function method_457(param1:class_131) : void
      {
         if(method_449(RP))
         {
            return;
         }
         do
         {
            param1.method_459(method_458());
         }
         while(method_449(COMMA));
         
         method_454(RP,"msg.no.paren.arg","k04");
      }
      
      protected function method_458() : class_115
      {
         var _loc1_:class_115 = method_460();
         var _loc2_:int = method_461();
         if(FIRST_ASSIGN <= _loc2_ && _loc2_ <= LAST_ASSIGN)
         {
            method_462();
            method_463(_loc1_);
            _loc1_ = var_310.method_465(_loc1_ as class_128,method_458(),_loc2_,var_311.method_464());
         }
         return _loc1_;
      }
      
      protected function method_451() : int
      {
         var _loc1_:int = method_461();
         method_462();
         return _loc1_;
      }
      
      public function method_466(param1:String) : void
      {
         throw new class_129(null,param1,var_311.method_464());
      }
      
      public function method_467(param1:String) : class_115
      {
         method_468(param1);
         return method_453();
      }
      
      private function method_469() : class_115
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc2_:int = var_311.method_470();
         loop0:
         while(true)
         {
            _loc3_ = var_310.literal(var_311.method_452());
            switch(_loc2_)
            {
               case XML:
                  method_454(LC,"msg.syntax","k02");
                  _loc1_ = var_310.method_471(_loc1_,_loc3_);
                  if(method_461() != RC)
                  {
                     _loc4_ = method_453();
                     if(var_311.method_472())
                     {
                        _loc4_ = var_310.method_473(_loc4_);
                     }
                     _loc1_ = var_310.method_471(_loc1_,_loc4_);
                  }
                  method_454(RC,"msg.syntax","k03");
                  break;
               case XMLEND:
                  break loop0;
               default:
                  method_455("msg.syntax","K05");
            }
            _loc2_ = var_311.method_475();
         }
         return var_310.method_474(_loc1_,_loc3_);
      }
      
      private function method_476() : class_115
      {
         var _loc1_:* = null;
         var _loc2_:int = method_461();
         switch(_loc2_)
         {
            case VOID:
            case NOT:
            case BITNOT:
            case TYPEOF:
            case SUB:
            case ADD:
            case INC:
            case DEC:
            case DELETE:
               method_462();
               _loc1_ = method_476();
               if(_loc2_ == INC || _loc2_ == DEC)
               {
                  method_463(_loc1_);
               }
               return var_310.method_477(_loc1_,_loc2_);
            case ERROR:
               method_462();
               method_455("msg.syntax","K04");
               return null;
            case LT:
               method_462();
               return method_478(true,method_469());
            default:
               _loc1_ = method_479(true);
               _loc2_ = method_480();
               while(_loc2_ == INC || _loc2_ == DEC)
               {
                  method_462();
                  _loc1_ = var_310.method_477(_loc1_,_loc2_ == INC?int(POSTFIX_INC):int(POSTFIX_DEC));
                  _loc2_ = method_480();
               }
               return _loc1_;
         }
      }
      
      protected function method_468(param1:String) : void
      {
         this.var_311 = new class_132(param1);
         this.var_314 = EOF;
      }
      
      private function method_481() : class_115
      {
         var _loc1_:class_115 = method_482();
         var _loc2_:int = method_461();
         loop0:
         while(true)
         {
            switch(_loc2_)
            {
               case EQ:
               case NE:
               case SHEQ:
               case SHNE:
                  method_462();
                  _loc1_ = var_310.method_483(_loc1_,method_482(),_loc2_);
                  _loc2_ = method_461();
                  continue;
               default:
                  break loop0;
            }
         }
         return _loc1_;
      }
      
      protected function method_484() : void
      {
         if((var_314 & CLEAR_TI_MASK) != NAME)
         {
            method_466("K01");
         }
         var_314 = var_314 | const_79;
      }
      
      protected function method_485() : int
      {
         method_461();
         var _loc1_:int = var_314;
         method_462();
         return _loc1_;
      }
      
      private function method_486() : class_115
      {
         var _loc1_:class_115 = method_487();
         var _loc2_:int = method_461();
         loop0:
         while(true)
         {
            switch(_loc2_)
            {
               case LSH:
               case URSH:
               case RSH:
                  method_462();
                  _loc1_ = var_310.method_488(_loc1_,method_487(),_loc2_);
                  _loc2_ = method_461();
                  continue;
               default:
                  break loop0;
            }
         }
         return _loc1_;
      }
      
      private function method_489() : class_115
      {
         var _loc1_:class_115 = method_476();
         var _loc2_:int = method_461();
         loop0:
         while(true)
         {
            switch(_loc2_)
            {
               case MUL:
               case DIV:
               case MOD:
                  method_462();
                  _loc1_ = var_310.method_490(_loc1_,method_476(),_loc2_);
                  _loc2_ = method_461();
                  continue;
               default:
                  break loop0;
            }
         }
         return _loc1_;
      }
      
      protected function method_454(param1:int, param2:String, param3:String) : void
      {
         if(!method_449(param1))
         {
            method_455(param2,param3);
         }
      }
      
      protected function method_461() : int
      {
         if(var_312)
         {
            return NAME;
         }
         var _loc1_:* = int(var_314);
         if(_loc1_ == EOF)
         {
            _loc1_ = int(var_311.method_491());
            if(_loc1_ == EOL)
            {
               do
               {
                  _loc1_ = int(var_311.method_491());
               }
               while(_loc1_ == EOL);
               
               _loc1_ = _loc1_ | TI_AFTER_EOL;
            }
            var_314 = _loc1_;
         }
         return _loc1_ & CLEAR_TI_MASK;
      }
      
      private function method_492(param1:class_115 = null, param2:Boolean = false) : class_115
      {
         var _loc3_:int = method_451();
         switch(_loc3_)
         {
            case NAME:
               return method_448(param1,var_311.method_452(),true,param2);
            case MUL:
               return method_448(param1,"*",true,param2);
            case LB:
               param1 = var_310.method_450(param1,method_453(),null,true,param2);
               method_454(RB,"msg.no.bracket.index","k68");
               return param1;
            default:
               method_455("msg.no.name.after.xmlAttr","K69");
               return null;
         }
      }
      
      protected function method_480() : int
      {
         var _loc1_:int = method_461();
         if((var_314 & TI_AFTER_EOL) != 0)
         {
            _loc1_ = EOL;
         }
         return _loc1_;
      }
      
      private function method_493() : class_115
      {
         var _loc1_:class_115 = method_494();
         var _loc2_:int = method_461();
         while(_loc2_ == BITXOR)
         {
            method_462();
            _loc1_ = var_310.method_495(_loc1_,method_494(),BITXOR);
            _loc2_ = method_461();
         }
         return _loc1_;
      }
      
      protected function method_462() : void
      {
         if(var_312)
         {
            var_312 = false;
            var_314 = var_313;
            return;
         }
         var_314 = EOF;
      }
      
      private function method_496() : class_115
      {
         var _loc1_:class_115 = method_493();
         var _loc2_:int = method_461();
         while(_loc2_ == BITOR)
         {
            method_462();
            _loc1_ = var_310.method_495(_loc1_,method_493(),BITOR);
            _loc2_ = method_461();
         }
         return _loc1_;
      }
      
      private function method_494() : class_115
      {
         var _loc1_:class_115 = method_481();
         var _loc2_:int = method_461();
         while(_loc2_ == BITAND)
         {
            method_462();
            _loc1_ = var_310.method_495(_loc1_,method_481(),BITAND);
            _loc2_ = method_461();
         }
         return _loc1_;
      }
      
      protected function method_453() : class_115
      {
         var _loc1_:class_115 = method_458();
         while(method_449(COMMA))
         {
            _loc1_ = var_310.method_497(_loc1_,method_458());
         }
         return _loc1_;
      }
      
      protected function method_498(param1:Boolean = false) : class_116
      {
         method_455("msg.function.expr.not.supported","K09");
         return null;
      }
      
      private function method_499() : class_115
      {
         var _loc3_:int = 0;
         var _loc4_:* = false;
         var _loc1_:class_115 = method_496();
         var _loc2_:int = method_461();
         if(_loc2_ == AND || _loc2_ == NAND)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc2_ == NAND;
            while(_loc2_ == _loc3_)
            {
               method_462();
               _loc1_ = var_310.method_500(_loc1_,method_499(),true,_loc4_);
               _loc2_ = method_461();
            }
         }
         return _loc1_;
      }
      
      private function method_482() : class_115
      {
         var _loc1_:class_115 = method_486();
         var _loc2_:int = method_461();
         loop0:
         while(true)
         {
            switch(_loc2_)
            {
               case IS:
               case INSTANCEOF:
               case IN:
               case AS:
                  break loop0;
               case LE:
               case LT:
               case GE:
               case GT:
                  method_462();
                  _loc1_ = var_310.method_483(_loc1_,method_486(),_loc2_);
                  _loc2_ = method_461();
                  continue;
               default:
                  addr88:
                  return _loc1_;
            }
         }
         method_462();
         _loc1_ = var_310.method_501(_loc1_,method_486(),_loc2_);
         §§goto(addr88);
      }
      
      private function method_479(param1:Boolean) : class_115
      {
         var _loc2_:* = null;
         if(method_461() == NEW)
         {
            method_462();
            _loc2_ = var_310.method_502(method_479(false));
            if(method_449(LP))
            {
               method_457(_loc2_ as class_131);
            }
         }
         else
         {
            _loc2_ = method_503();
         }
         return method_478(param1,_loc2_);
      }
      
      private function method_463(param1:*) : void
      {
         if(!(param1 is class_128))
         {
            method_455("msg.not.assignable","K03");
         }
      }
      
      public function method_455(param1:String, param2:String, param3:String = null, param4:String = null, param5:String = null) : void
      {
         throw new class_129(class_118.method_504(param1,param3,param4,param5),param2,var_311.method_464());
      }
      
      private function method_478(param1:Boolean, param2:class_115) : class_115
      {
         var _loc3_:int = 0;
         var _loc4_:* = false;
         loop0:
         while(true)
         {
            _loc3_ = method_461();
            switch(_loc3_)
            {
               case DOT:
               case DOTDOT:
                  method_462();
                  _loc4_ = _loc3_ == DOTDOT;
                  _loc3_ = method_451();
                  switch(_loc3_)
                  {
                     case NAME:
                        param2 = method_448(param2,var_311.method_452(),_loc4_);
                        continue;
                     case MUL:
                        param2 = method_448(param2,"*",_loc4_);
                        continue;
                     case XMLATTR:
                        param2 = method_492(param2,_loc4_);
                        continue;
                     default:
                        method_455("msg.no.name.after.dot","K06");
                        continue;
                  }
               case DOTQUERY:
                  method_462();
                  param2 = var_310.method_505(param2,method_453());
                  method_454(RP,"msg.no.paren","k05");
                  continue;
               case LB:
                  method_462();
                  param2 = var_310.method_450(param2,method_453());
                  method_454(RB,"msg.no.bracket.index","k06");
                  continue;
               case LP:
                  if(!param1)
                  {
                     addr158:
                     return param2;
                  }
                  method_462();
                  param2 = var_310.method_506(param2);
                  method_457(param2 as class_131);
                  continue;
               default:
                  break loop0;
            }
         }
         §§goto(addr158);
      }
      
      private function method_487() : class_115
      {
         var _loc1_:class_115 = method_489();
         var _loc2_:int = method_461();
         while(_loc2_ == ADD || _loc2_ == SUB)
         {
            method_462();
            _loc1_ = var_310.method_471(_loc1_,method_489(),_loc2_ == ADD);
            _loc2_ = method_461();
         }
         return _loc1_;
      }
      
      private function method_460() : class_115
      {
         var _loc2_:* = null;
         var _loc1_:class_115 = method_507();
         if(method_449(HOOK))
         {
            _loc2_ = method_458();
            method_454(COLON,"msg.no.colon.cond","k01");
            _loc1_ = var_310.method_508(_loc1_,_loc2_,method_458());
         }
         return _loc1_;
      }
      
      private function method_507() : class_115
      {
         var _loc3_:int = 0;
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc1_:class_115 = method_499();
         var _loc2_:int = method_461();
         if(_loc2_ == OR || _loc2_ == NOR || _loc2_ == XOR)
         {
            _loc3_ = _loc2_;
            _loc4_ = _loc2_ == NOR;
            _loc5_ = _loc2_ == XOR;
            while(_loc2_ == _loc3_)
            {
               method_462();
               _loc1_ = var_310.method_500(_loc1_,method_507(),false,_loc4_,_loc5_);
               _loc2_ = method_461();
            }
         }
         return _loc1_;
      }
      
      private function method_503() : class_115
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = undefined;
         var _loc1_:Boolean = true;
         var _loc4_:int = method_485();
         var _loc5_:* = _loc4_ & CLEAR_TI_MASK;
         switch(_loc5_)
         {
            case FUNCTION:
               return method_498(true);
            case LB:
               _loc3_ = [];
               _loc6_ = true;
               while(true)
               {
                  _loc5_ = int(method_461());
                  if(_loc5_ == COMMA)
                  {
                     method_462();
                     if(!_loc6_)
                     {
                        _loc6_ = true;
                     }
                     else
                     {
                        _loc3_.push(class_127.NULL);
                     }
                  }
                  else
                  {
                     if(_loc5_ == RB)
                     {
                        break;
                     }
                     if(!_loc6_)
                     {
                        method_455("msg.no.bracket.arg","K10");
                     }
                     _loc6_ = false;
                     _loc2_ = method_458();
                     if(_loc2_ is class_127)
                     {
                        _loc3_.push((_loc2_ as class_127).getAny());
                     }
                     else
                     {
                        _loc3_.push(_loc2_);
                        _loc1_ = false;
                     }
                  }
               }
               method_462();
               return var_310.method_509(_loc3_,_loc1_);
            case LC:
               _loc7_ = {};
               _loc3_ = [];
               if(!method_449(LC))
               {
                  loop1:
                  do
                  {
                     _loc5_ = int(method_461());
                     switch(_loc5_)
                     {
                        case NAME:
                        case STRING:
                           method_462();
                           _loc10_ = var_311.method_452();
                           _loc3_.push(_loc10_);
                           break;
                        case NUMBER:
                           method_462();
                           _loc10_ = var_311.getNumber();
                           _loc3_.push(_loc10_);
                           break;
                        case RC:
                           break loop1;
                        default:
                           method_455("msg.bad.prop","K11");
                           break loop1;
                     }
                     method_454(COLON,"msg.no.colon.prop","k08");
                     _loc2_ = method_458();
                     if(_loc2_ is class_127)
                     {
                        _loc7_[_loc10_] = (_loc2_ as class_127).getAny();
                     }
                     else
                     {
                        _loc7_[_loc10_] = _loc2_;
                        _loc1_ = false;
                     }
                  }
                  while(method_449(COMMA));
                  
                  method_454(RC,"msg.no.brace.prop","k09");
               }
               return var_310.method_509(_loc7_,_loc1_,_loc3_);
            case LP:
               _loc2_ = method_453();
               method_454(RP,"msg.no.paren","k10");
               return _loc2_;
            case XMLATTR:
               return method_492();
            case NAME:
               _loc8_ = var_311.method_452();
               if((_loc4_ & const_79) != 0 && method_461() == COLON)
               {
                  method_462();
                  return new class_125(_loc8_);
               }
               return method_448(null,_loc8_);
            case THIS:
               method_462();
               return var_310.method_510();
            case NULL:
               return var_310.literal(null);
            case FALSE:
               return var_310.literal(false);
            case TRUE:
               return var_310.literal(true);
            case NUMBER:
               return var_310.literal(var_311.getNumber());
            case STRING:
               return var_310.literal(var_311.method_452());
            case DIV:
            case ASSIGN_DIV:
               var_311.method_511(_loc5_);
               _loc9_ = var_311.var_315;
               var_311.var_315 = null;
               return var_310.method_512(var_311.method_452(),_loc9_);
            case RESERVED:
               method_455("msg.reserved.id","K12");
               break;
            case EOF:
               method_455("msg.unexpected.eof","K13");
               break;
            case ERROR:
            default:
               method_455("msg.syntax","K14");
         }
         return null;
      }
      
      protected function method_513() : int
      {
         method_461();
         return var_314;
      }
      
      protected function method_449(param1:int) : Boolean
      {
         var _loc2_:int = method_461();
         if(_loc2_ != param1)
         {
            return false;
         }
         method_462();
         return true;
      }
      
      protected function eof() : Boolean
      {
         return var_311.eof();
      }
   }
}
