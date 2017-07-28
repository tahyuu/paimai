package r1.deval.parser
{
   import package_29.class_115;
   import package_29.class_116;
   import package_29.class_117;
   import package_29.class_135;
   import package_29.class_136;
   import package_29.class_137;
   import package_29.class_138;
   import package_29.class_139;
   import package_29.class_140;
   
   public class class_114 extends class_113
   {
      
      public static var var_316:Boolean = false;
       
      
      private var var_320:Array;
      
      private var var_321:class_140 = null;
      
      private var var_318:class_117;
      
      private var var_319:Array;
      
      private var var_324:int = 0;
      
      private var var_342:int = 0;
      
      private var var_344:int = 0;
      
      private var var_339:int = 0;
      
      private var var_343:int = 0;
      
      private var var_323:Array;
      
      private var var_317:Array;
      
      public function class_114()
      {
         var_317 = [];
         super();
      }
      
      private static function method_514(param1:String, param2:class_117, param3:Array) : void
      {
         var _loc5_:* = null;
         trace(param1);
         var _loc4_:* = {};
         for each(_loc5_ in param3)
         {
            _loc5_.method_515(_loc4_);
         }
         param2.method_515(_loc4_);
      }
      
      private static function method_516(param1:int) : String
      {
         switch(param1)
         {
            case CLASS:
               return "class";
            case TRY:
               return "try";
            case CATCH:
               return "catch";
            case FINALLY:
               return "finally";
            default:
               return "";
         }
      }
      
      public function method_517(param1:*, param2:int) : void
      {
         if(var_318.method_518)
         {
            method_455("msg.unreachable.code","K51");
         }
         var_318.method_517(param1,param2);
      }
      
      protected function method_519(param1:String = null, param2:Boolean = false) : Array
      {
         var _loc3_:class_117 = new class_117(param1);
         method_520(_loc3_);
         method_521(null,param2);
         var _loc4_:Array = [_loc3_,var_318];
         method_522();
         return _loc4_;
      }
      
      private function method_523() : Object
      {
         return var_319[var_319.length - 1];
      }
      
      protected function method_524() : class_115
      {
         method_454(LP,"msg.no.paren.cond","k51");
         var _loc1_:class_115 = method_453();
         method_454(RP,"msg.no.paren.after.cond","k52");
         return _loc1_;
      }
      
      protected function method_525(param1:class_125, param2:class_117, param3:class_117, param4:String = null) : class_125
      {
         if(param1 == null)
         {
            param1 = method_526(param4);
         }
         param1.block = param2;
         param1.var_322 = param3 == null?param2:param3;
         method_527(param1);
         return param1;
      }
      
      public function method_518(param1:class_117) : Boolean
      {
         return param1 != null && param1.method_518;
      }
      
      private function method_528() : class_125
      {
         return var_323.pop() as class_125;
      }
      
      private function method_529(param1:int, param2:class_125) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Boolean = false;
         if(method_449(NAME))
         {
            if(var_311.method_452() == "each")
            {
               _loc3_ = true;
            }
            else
            {
               method_455("msg.no.paren.for","K55");
            }
         }
         method_454(LP,"msg.no.paren.for","k54");
         var _loc6_:int = method_461();
         if(_loc6_ != SEMI)
         {
            if(_loc6_ == VAR)
            {
               method_462();
               method_454(NAME,"msg.bad.var","k55");
               _loc4_ = var_311.method_452();
               if(method_461() == IN)
               {
                  method_462();
                  var_310.method_530(_loc4_);
               }
               else
               {
                  method_531(_loc4_);
                  _loc4_ = null;
               }
            }
            else if(method_461() == NAME)
            {
               _loc4_ = var_311.method_452();
               method_462();
               if(method_461() == IN)
               {
                  method_462();
               }
               else
               {
                  method_456();
                  _loc4_ = null;
                  method_521(null,true);
               }
            }
            else
            {
               method_521(null,true);
            }
         }
         var _loc7_:* = null;
         if(_loc4_)
         {
            _loc5_ = method_453();
         }
         else
         {
            method_454(SEMI,"msg.no.semi.for","k56");
            _loc5_ = method_461() == SEMI?null:method_453();
            method_454(SEMI,"msg.no.semi.for.cond","k57");
            if(method_461() != RP)
            {
               _loc7_ = method_519(null,true)[0] as class_117;
            }
         }
         method_454(RP,"msg.no.paren.for.ctrl","k58");
         var _loc8_:String = (!!_loc3_?"@for_each_":!!_loc4_?"@for_in_":"@for_") + var_324++;
         if(_loc4_ == null)
         {
            method_532(param1,param2,_loc8_,_loc5_,":for-body:",_loc7_);
         }
         else
         {
            method_533(param1,param2,_loc8_,_loc4_,_loc5_,_loc3_,_loc7_);
         }
      }
      
      private function method_534(param1:class_125) : void
      {
         var label:class_125 = null;
         var var_326:class_117 = null;
         var var_328:class_125 = param1;
         var var_325:Array = method_519(":do-while-body");
         var var_327:class_117 = var_325[0] as class_117;
         var_318.method_535 = var_327;
         if(!method_518((var_325[1] as class_117).method_535))
         {
            (var_325[1] as class_117).method_535 = var_327;
         }
         try
         {
            label = method_525(var_328,var_327,null,"@do_while_");
            var_327.name = label.name;
            method_454(WHILE,"msg.no.while.do","k53");
            var_327.method_536(method_524(),var_311.method_464());
            var_326 = new class_117();
            if(!method_518((var_325[1] as class_117).method_535))
            {
               (var_325[1] as class_117).method_537 = var_326;
            }
            method_522();
            method_520(var_326);
         }
         catch(_loc3_:*)
         {
            throw ;
         }
         method_538();
         if(true)
         {
            throw _loc4_;
         }
      }
      
      override protected function method_498(param1:Boolean = false) : class_116
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!param1)
         {
            _loc2_ = method_539(NAME,"msg.missing.function.name","Kf1");
         }
         method_539(LP,"msg.no.paren.parms","Kf2");
         var _loc4_:* = [];
         loop0:
         while(true)
         {
            _loc3_ = method_461();
            if(_loc3_ == RP)
            {
               break;
            }
            if(_loc3_ == NAME)
            {
               _loc4_.push(var_311.method_452());
               method_462();
               loop1:
               while(true)
               {
                  switch(method_461())
                  {
                     case COLON:
                     case DOT:
                     case NAME:
                        method_462();
                        continue;
                     case COMMA:
                        break loop1;
                     case RP:
                        addr53:
                        continue loop0;
                     default:
                        method_455("msg.no.paren.after.parms","Kf3");
                        continue;
                  }
               }
               method_462();
               §§goto(addr53);
            }
            else
            {
               continue;
            }
         }
         method_462();
         loop2:
         while(true)
         {
            switch(method_461())
            {
               case COLON:
               case DOT:
               case NAME:
                  method_462();
                  continue;
               case LC:
                  break loop2;
               default:
                  method_455("msg.no.brace.body","Kf4");
                  continue;
            }
         }
         method_462();
         var _loc5_:class_117 = method_520();
         var _loc6_:class_140 = var_321 = new class_140("[/" + _loc2_ + "]");
         while(var_321 != null)
         {
            method_521();
         }
         var _loc7_:class_117 = method_540(_loc5_);
         if(_loc7_.method_541() > 0)
         {
            if(_loc7_.method_535 == null)
            {
               _loc7_.method_535 = _loc6_;
            }
            if(_loc7_.method_537 == null)
            {
               _loc7_.method_537 = _loc6_;
            }
         }
         return new class_116(_loc2_,_loc4_,_loc5_,_loc6_);
      }
      
      private function method_539(param1:int, param2:String, param3:String) : String
      {
         if(method_461() != param1)
         {
            method_455(param2,param3);
         }
         var _loc4_:String = var_311.method_452();
         method_462();
         return _loc4_;
      }
      
      private function get method_542() : Boolean
      {
         return var_319.length > 0;
      }
      
      private function method_543(param1:class_125, param2:class_115, param3:int) : void
      {
         method_539(LC,"msg.no.brace.switch","Ksw5");
         var _loc4_:String = "_switch_" + method_544;
         method_517(var_310.method_530(_loc4_,param2),0);
         var _loc5_:class_117 = var_318;
         _loc5_.method_535 = method_520();
         if(param1 == null)
         {
            param1 = method_526();
         }
         param1.var_329 = true;
         param1.block = new class_117();
         method_527(param1);
         var _loc6_:Object = {
            "switchVar":var_310.method_450(null,_loc4_),
            "type":0,
            "branchHead":var_318,
            "branchCondition":_loc5_,
            "label":param1
         };
         var _loc7_:int = method_544;
         var_319.push(_loc6_);
         do
         {
            method_521();
         }
         while(method_544 > _loc7_);
         
      }
      
      protected function method_522() : class_117
      {
         var _loc1_:class_117 = var_317.pop() as class_117;
         var_318 = var_317[var_317.length - 1] as class_117;
         return _loc1_;
      }
      
      private function method_545(param1:String) : class_125
      {
         var _loc2_:class_125 = var_323[param1] as class_125;
         if(_loc2_ == null)
         {
            method_455("msg.undef.label","K53");
         }
         return _loc2_;
      }
      
      private function method_533(param1:int, param2:class_125, param3:String, param4:String, param5:class_115, param6:Boolean, param7:class_117 = null) : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * 反混淆被激活，但是反编译还是失败了。如果文件不混乱，禁用“自动反混淆”效果会更好。
          * Error type: ConvertException (Invalid jump to ofs0190 on line -1)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      private function method_532(param1:int, param2:class_125, param3:String, param4:class_115, param5:String = ":while_body:", param6:class_117 = null) : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * 反混淆被激活，但是反编译还是失败了。如果文件不混乱，禁用“自动反混淆”效果会更好。
          * Error type: ConvertException (Invalid jump to ofs014b on line -1)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      private function method_546() : class_125
      {
         if(method_480() != NAME)
         {
            return null;
         }
         method_462();
         return method_545(var_311.method_452());
      }
      
      protected function method_520(param1:* = null) : class_117
      {
         if(param1 == null)
         {
            param1 = new class_117();
         }
         else if(param1 is String)
         {
            param1 = new class_117(String(param1));
         }
         var_317.push(var_318 = param1 as class_117);
         return var_318;
      }
      
      override protected function method_468(param1:String) : void
      {
         super.method_468(param1);
         var_323 = [];
         var_319 = [];
         var_320 = [];
      }
      
      private function method_547(param1:Boolean) : void
      {
         var_318.method_518 = true;
         var _loc2_:class_125 = method_546();
         if(_loc2_ == null)
         {
            _loc2_ = method_548();
         }
         if(_loc2_.var_329)
         {
            if(!param1)
            {
               method_455("msg.bad.continue","Ksw");
            }
            var_318.method_535 = _loc2_.block;
         }
         else
         {
            var_318.method_535 = !!param1?_loc2_.block.method_537:_loc2_.var_322;
         }
      }
      
      public function method_429(param1:String) : Object
      {
         var _loc3_:* = null;
         method_468(param1);
         method_520(":Main:");
         var _loc2_:class_117 = var_318;
         while(method_461() != EOF)
         {
            method_521();
         }
         if(var_318.method_535 == null)
         {
            var_318.method_535 = class_140.const_80;
         }
         method_522();
         if(var_316)
         {
            method_514("===== Pre-optimization =====",_loc2_,var_320);
         }
         _loc2_.method_549();
         for each(_loc3_ in var_320)
         {
            _loc3_.method_549();
         }
         if(var_316)
         {
            method_514("\n===== Post-optimization =====",_loc2_,var_320);
         }
         if(var_320.length == 0)
         {
            return _loc2_;
         }
         return [_loc2_,var_320];
      }
      
      private function method_550(param1:int, param2:class_115) : void
      {
         var_318.method_536(param2,param1);
         var _loc3_:class_117 = new class_117();
         var _loc4_:Array = method_519(":if-part:");
         var_318.method_535 = _loc4_[0] as class_117;
         var _loc5_:class_117 = _loc4_[1] as class_117;
         if(!_loc5_.method_518)
         {
            _loc5_.method_535 = _loc3_;
         }
         if(method_449(ELSE))
         {
            method_462();
            _loc4_ = method_519(":else-part:");
            var_318.method_537 = _loc4_[0] as class_117;
            _loc5_ = _loc4_[1] as class_117;
            if(!_loc5_.method_518)
            {
               _loc5_.method_535 = _loc3_;
            }
         }
         else
         {
            var_318.method_537 = _loc3_;
         }
         method_522();
         method_520(_loc3_);
      }
      
      private function method_551(param1:int, param2:class_115 = null) : void
      {
         var _loc9_:* = null;
         var _loc3_:int = var_311.method_464();
         var _loc4_:Object = method_523();
         var _loc5_:class_117 = _loc4_.branchCondition as class_117;
         var _loc6_:class_117 = _loc4_.branchHead as class_117;
         var _loc7_:int = _loc4_.type as int;
         _loc4_.type = param1;
         if(param2 != null)
         {
            param2 = var_310.method_483(_loc4_.switchVar as class_115,param2,EQ);
         }
         if(_loc7_ == 0)
         {
            if(!_loc6_.method_552())
            {
               method_455("msg.unreachable.stmts.in.switch","Ksw6");
            }
            if(param1 == CASE)
            {
               _loc5_.method_536(param2,_loc3_);
            }
            else
            {
               _loc4_.defaultBlockHead = _loc6_;
            }
            return;
         }
         var _loc8_:class_117 = method_540(_loc6_);
         if(_loc7_ == DEFAULT)
         {
            _loc4_.defaultBlockTail = _loc8_;
         }
         if(param1 == RC)
         {
            _loc9_ = method_528();
            if(!_loc8_.method_518)
            {
               _loc8_.method_535 = _loc9_.block;
            }
            _loc6_ = _loc4_.defaultBlockHead as class_117;
            if(_loc6_ != null)
            {
               _loc8_ = _loc4_.defaultBlockTail as class_117;
               _loc5_.method_537 = _loc6_;
            }
            var_319.pop();
            method_520(_loc9_.block);
            return;
         }
         _loc4_.branchHead = method_520();
         if(!_loc8_.method_518)
         {
            _loc8_.method_535 = var_318;
         }
         if(param1 == DEFAULT)
         {
            _loc4_.defaultBlockHead = var_318;
         }
         else if(param1 == CASE)
         {
            if(_loc5_.method_553() != null)
            {
               _loc5_.method_537 = new class_117();
               _loc5_ = _loc5_.method_537;
               _loc5_.method_537 = method_548().block;
               _loc4_.branchCondition = _loc5_;
            }
            _loc5_.method_536(param2,_loc3_);
            _loc5_.method_535 = var_318;
         }
      }
      
      protected function method_540(param1:class_117) : class_117
      {
         var _loc2_:class_117 = method_522();
         var _loc3_:int = var_317.indexOf(param1);
         if(_loc3_ >= 0)
         {
            var_317.length = _loc3_;
         }
         var_318 = var_317[var_317.length - 1] as class_117;
         return _loc2_;
      }
      
      private function method_526(param1:String = null) : class_125
      {
         if(param1 == null)
         {
            param1 = "@_";
         }
         return new class_125(param1 + var_343++);
      }
      
      private function method_548() : class_125
      {
         if(var_323.length == 0)
         {
            method_455("msg.bad.break.continue","K56");
         }
         return var_323[var_323.length - 1] as class_125;
      }
      
      protected function method_538() : void
      {
         method_528();
      }
      
      private function method_554() : void
      {
         var _loc1_:int = 0;
         while((_loc1_ = method_461()) != EOF && _loc1_ != RC)
         {
            method_521();
         }
      }
      
      private function get method_544() : int
      {
         return var_319.length;
      }
      
      private function method_555(param1:int) : void
      {
         if(!(method_449(NAME) && var_311.method_452() == "xml"))
         {
            method_455("msg.bad.namespace","K57");
         }
         if(!(method_449(NAME) && var_311.method_452() == "namespace"))
         {
            method_455("msg.bad.namespace","K58");
         }
         if(!method_449(ASSIGN))
         {
            method_455("msg.bad.namespace","K59");
         }
         method_517(new class_137(DEFAULT_NS,method_453(),param1),param1);
      }
      
      private function method_521(param1:class_125 = null, param2:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:int = 0;
         var _loc7_:int = var_311.method_464();
         var _loc8_:int = method_461();
         switch(_loc8_)
         {
            case IF:
               method_462();
               method_550(_loc7_,method_524());
               return;
            case SWITCH:
               method_462();
               method_543(param1,method_524(),_loc7_);
               break;
            case CASE:
               method_462();
               if(!method_542)
               {
                  method_455("msg.misplaced.case","Ksw1");
               }
               _loc4_ = method_453();
               method_539(COLON,"msg.case.no.colon","Ksw2");
               method_551(CASE,_loc4_);
               return;
            case DEFAULT:
               method_462();
               if(method_461() == COLON)
               {
                  method_539(COLON,"msg.case.no.colon","Ksw3");
                  method_551(DEFAULT);
                  return;
               }
               method_555(_loc7_);
               break;
            case RC:
               if(!method_542 && var_321 == null)
               {
                  method_455("msg.misplaced.right.brace","Krc");
               }
               method_462();
               if(method_542)
               {
                  method_551(RC);
               }
               else
               {
                  var_321 = null;
               }
               return;
            case BREAK:
            case CONTINUE:
               method_462();
               method_547(_loc8_ == BREAK);
               break;
            case THROW:
               method_462();
               var_318.method_518 = true;
               method_517(new class_137(THROW,method_453(),_loc7_),_loc7_);
               break;
            case WHILE:
               method_462();
               _loc4_ = method_524();
               method_532(_loc7_,param1,"@while_" + var_344++,_loc4_);
               return;
            case DO:
               method_462();
               method_534(param1);
               return;
            case FOR:
               method_462();
               method_529(var_311.method_464(),param1);
               return;
            case VAR:
               method_462();
               method_531();
               break;
            case RETURN:
               method_462();
               switch(method_480())
               {
                  case SEMI:
                     method_462();
                  case RC:
                  case EOF:
                  case EOL:
                  case ERROR:
                     break;
                  default:
                     method_517(method_453(),_loc7_);
               }
               var_318.method_535 = var_321 != null?var_321:class_140.const_80;
               var_318.method_518 = true;
               break;
            case LC:
               method_462();
               method_554();
               method_454(RC,"msg.no.brace.block","k65");
               return;
            case ERROR:
            case SEMI:
               method_462();
               break;
            case IMPORT:
               method_462();
               method_556(_loc7_);
               break;
            case NAME:
               _loc9_ = var_311.method_452();
               method_484();
               _loc4_ = method_453();
               if(_loc4_ is class_125)
               {
                  if(param1 == null)
                  {
                     _loc10_ = true;
                     param1 = _loc4_ as class_125;
                  }
                  else
                  {
                     _loc10_ = false;
                  }
                  method_521(param1);
                  break;
               }
               method_517(_loc4_,_loc7_);
               break;
            case FUNCTION:
               method_462();
               var_320.push(method_498());
               break;
            case CLASS:
               method_455("msg.class.not.supported","K64");
               break;
            case TRY:
            case CATCH:
            case FINALLY:
               method_455("msg.reserved.id","K54",method_516(_loc8_));
               break;
            default:
               method_517(method_453(),var_311.method_464());
         }
         if(!param2)
         {
            _loc11_ = method_513();
            switch(_loc11_ & CLEAR_TI_MASK)
            {
               case SEMI:
                  method_462();
               case ERROR:
               case EOF:
               case RC:
                  break;
               default:
                  if((_loc11_ & TI_AFTER_EOL) == 0)
                  {
                     method_455("msg.no.semi.stmt","K65");
                     break;
                  }
            }
         }
      }
      
      private function method_556(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:* = [];
         loop0:
         while(true)
         {
            _loc4_ = method_513();
            switch(_loc4_ & CLEAR_TI_MASK)
            {
               case NAME:
                  if(!_loc3_)
                  {
                     _loc3_ = var_311.method_452();
                  }
                  else
                  {
                     _loc3_ = _loc3_ + ("." + var_311.method_452());
                  }
                  method_462();
                  continue;
               case DOT:
                  method_462();
                  continue;
               case COMMA:
                  _loc2_.push(_loc3_);
                  _loc3_ = null;
                  method_462();
                  continue;
               case SEMI:
                  method_462();
               case ERROR:
               case EOF:
               case RC:
                  addr107:
                  _loc2_.push(_loc3_);
                  method_517(new class_135(_loc2_,param1),param1);
                  return;
               default:
                  break loop0;
            }
         }
         if((_loc4_ & TI_AFTER_EOL) == 0)
         {
            method_455("msg.no.semi.stmt","K66");
         }
         §§goto(addr107);
      }
      
      private function method_527(param1:class_125) : void
      {
         if(var_323[param1.name] != null)
         {
            method_455("msg.dup.label","K61");
         }
         var_323.push(param1);
         var_323[param1.name] = param1;
      }
      
      private function method_531(param1:String = null) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc3_:int = var_311.method_464();
         do
         {
            if(param1 != null)
            {
               _loc4_ = param1;
            }
            else
            {
               method_454(NAME,"msg.bad.var","k66");
               _loc4_ = var_311.method_452();
            }
            if(method_461() == COLON)
            {
               method_462();
               method_454(NAME,"msg.bad.var","k67");
               method_462();
            }
            _loc5_ = null;
            if(method_449(ASSIGN))
            {
               _loc5_ = method_458();
            }
            _loc2_ = var_310.method_530(_loc4_,_loc5_,_loc2_);
         }
         while(method_449(COMMA));
         
         if(_loc2_ is class_139)
         {
            _loc2_ = (_loc2_ as class_139).method_557();
         }
         method_517(_loc2_,_loc3_);
      }
   }
}
