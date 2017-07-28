package r1.deval.parser
{
   import package_29.class_118;
   import package_31.class_163;
   
   class class_132 extends class_112
   {
       
      
      private var var_392:Boolean;
      
      private var var_389:String;
      
      private var string:String = "";
      
      var var_315:String;
      
      private var var_387:class_163;
      
      private var name_13:int;
      
      private var var_394:int = -1;
      
      private var var_390:int;
      
      private var var_388:Array;
      
      private var number:Number;
      
      private var var_393:int = 0;
      
      private var var_391:int;
      
      private var var_396:int;
      
      private var var_407:Boolean;
      
      private var var_408:Boolean = false;
      
      private var var_409:String;
      
      private var var_397:int;
      
      private var var_395:Boolean;
      
      function class_132(param1:String, param2:int = 1)
      {
         super();
         this.name_13 = param2;
         this.var_387 = new class_163();
         this.var_388 = new Array(3);
         this.var_389 = param1;
         this.var_390 = param1.length;
         this.var_391 = 0;
      }
      
      private static function method_595(param1:int) : Boolean
      {
         return CHAR_0 <= param1 && param1 <= CHAR_9;
      }
      
      private static function method_596(param1:int) : Boolean
      {
         return method_597(param1) || param1 >= CHAR_0 && param1 <= CHAR_9;
      }
      
      private static function method_466() : void
      {
         class_118.method_455(class_129.const_88,"KT");
      }
      
      private static function method_570(param1:String, param2:* = null, param3:* = null, param4:* = null) : void
      {
         class_118.method_570(param1,param2,param3,param4);
      }
      
      private static function method_598(param1:int) : Boolean
      {
         if((param1 & 57296) != 0)
         {
            return false;
         }
         return param1 == CHAR_NL || param1 == CHAR_CR || param1 == 8232 || param1 == 8233;
      }
      
      private static function method_597(param1:int) : Boolean
      {
         return param1 >= CHAR_a && param1 <= CHAR_z || param1 >= CHAR_A && param1 <= CHAR_Z || param1 == CHAR_UNDERSCORE;
      }
      
      private static function method_599(param1:int) : Boolean
      {
         return param1 == 32 || param1 == 9 || param1 == 12 || param1 == 11 || param1 == 160;
      }
      
      private static function method_600(param1:int) : Boolean
      {
         if(param1 <= CHAR_Z)
         {
            return CHAR_A <= param1;
         }
         return CHAR_a <= param1 && param1 <= CHAR_z;
      }
      
      private static function method_601(param1:int, param2:int) : int
      {
         return param2 << 3 | param1 - CHAR_0;
      }
      
      private static function method_602(param1:int, param2:int) : int
      {
         if(param1 <= CHAR_9)
         {
            param1 = param1 - CHAR_0;
            if(0 <= param1)
            {
               addr44:
               return param2 << 4 | param1;
            }
         }
         else if(param1 <= CHAR_F)
         {
            if(CHAR_A <= param1)
            {
               param1 = param1 - (CHAR_A - 10);
               §§goto(addr44);
            }
         }
         else if(param1 <= CHAR_f)
         {
            if(CHAR_a <= param1)
            {
               param1 = param1 - (CHAR_a - 10);
               §§goto(addr44);
            }
         }
         return -1;
      }
      
      private static function method_455(param1:String) : void
      {
         class_118.method_455(param1,"KT");
      }
      
      private static function method_603(param1:String) : int
      {
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:int = param1.length;
         if(_loc4_ >= 2)
         {
            _loc5_ = param1.charCodeAt(0);
            _loc6_ = param1.charCodeAt(1);
            loop0:
            switch(_loc4_)
            {
               case 2:
                  switch(_loc5_)
                  {
                     case CHAR_a:
                        if(_loc6_ == CHAR_s)
                        {
                           return AS;
                        }
                        break loop0;
                     case CHAR_i:
                        switch(_loc6_)
                        {
                           case CHAR_f:
                              return IF;
                           case CHAR_n:
                              return IN;
                           case CHAR_s:
                              return IS;
                           default:
                              break loop0;
                        }
                     case CHAR_d:
                        if(param1.charCodeAt(1) == CHAR_o)
                        {
                           return DO;
                        }
                        break loop0;
                     case CHAR_o:
                        if(param1.charCodeAt(1) == CHAR_r)
                        {
                           return OR;
                        }
                        break loop0;
                     default:
                        break loop0;
                  }
               case 3:
                  switch(_loc5_)
                  {
                     case CHAR_a:
                        _loc3_ = "and";
                        _loc2_ = AND;
                        break loop0;
                     case CHAR_f:
                        _loc3_ = "for";
                        _loc2_ = FOR;
                        break loop0;
                     case CHAR_n:
                        if(param1 == "new")
                        {
                           return NEW;
                        }
                        if(param1 == "nor")
                        {
                           return NOR;
                        }
                        if(param1 == "not")
                        {
                           return NOT;
                        }
                        break loop0;
                     case CHAR_t:
                        _loc3_ = "try";
                        _loc2_ = TRY;
                        break loop0;
                     case CHAR_v:
                        _loc3_ = "var";
                        _loc2_ = VAR;
                        break loop0;
                     case CHAR_x:
                        _loc3_ = "xor";
                        _loc2_ = XOR;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 4:
                  switch(_loc5_)
                  {
                     case CHAR_c:
                        _loc3_ = "case";
                        _loc2_ = CASE;
                        break loop0;
                     case CHAR_e:
                        _loc3_ = "else";
                        _loc2_ = ELSE;
                        break loop0;
                     case CHAR_n:
                        if(param1 == "null")
                        {
                           return NULL;
                        }
                        if(param1 == "nand")
                        {
                           return NAND;
                        }
                        break loop0;
                     case CHAR_t:
                        if(param1 == "true")
                        {
                           return TRUE;
                        }
                        if(param1 == "this")
                        {
                           return THIS;
                        }
                        break loop0;
                     case CHAR_v:
                        _loc3_ = "void";
                        _loc2_ = VOID;
                        break loop0;
                     case CHAR_w:
                        _loc3_ = "with";
                        _loc2_ = WITH;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 5:
                  switch(param1.charCodeAt(2))
                  {
                     case CHAR_a:
                        _loc3_ = "class";
                        _loc2_ = CLASS;
                        break loop0;
                     case CHAR_e:
                        _loc3_ = "break";
                        _loc2_ = BREAK;
                        break loop0;
                     case CHAR_i:
                        _loc3_ = "while";
                        _loc2_ = WHILE;
                        break loop0;
                     case CHAR_l:
                        _loc3_ = "false";
                        _loc2_ = FALSE;
                        break loop0;
                     case CHAR_r:
                        _loc3_ = "throw";
                        _loc2_ = THROW;
                        break loop0;
                     case CHAR_t:
                        _loc3_ = "catch";
                        _loc2_ = CATCH;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 6:
                  switch(_loc5_)
                  {
                     case CHAR_d:
                        _loc3_ = "delete";
                        _loc2_ = DELETE;
                        break loop0;
                     case CHAR_r:
                        _loc3_ = "return";
                        _loc2_ = RETURN;
                        break loop0;
                     case CHAR_i:
                        _loc3_ = "import";
                        _loc2_ = IMPORT;
                        break loop0;
                     case CHAR_s:
                        _loc3_ = "switch";
                        _loc2_ = SWITCH;
                        break loop0;
                     case CHAR_t:
                        _loc3_ = "typeof";
                        _loc2_ = TYPEOF;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 7:
                  switch(_loc6_)
                  {
                     case CHAR_e:
                        _loc3_ = "default";
                        _loc2_ = DEFAULT;
                        break loop0;
                     case CHAR_i:
                        _loc3_ = "finally";
                        _loc2_ = FINALLY;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 8:
                  switch(_loc5_)
                  {
                     case CHAR_c:
                        _loc3_ = "continue";
                        _loc2_ = CONTINUE;
                        break loop0;
                     case CHAR_f:
                        _loc3_ = "function";
                        _loc2_ = FUNCTION;
                        break loop0;
                     default:
                        break loop0;
                  }
               case 10:
                  if(param1 == "instanceof")
                  {
                     return INSTANCEOF;
                  }
            }
            if(_loc3_ != null && _loc3_ != param1)
            {
               _loc2_ = 0;
            }
         }
         return _loc2_ == 0?int(EOF):_loc2_ & 255;
      }
      
      private static function method_604(param1:String) : Boolean
      {
         return EOF != method_603(param1);
      }
      
      public final function method_605() : int
      {
         var _loc1_:int = var_391 - var_393;
         if(var_394 >= 0)
         {
            _loc1_--;
         }
         return _loc1_;
      }
      
      public final function method_452() : String
      {
         return string;
      }
      
      public function method_472() : Boolean
      {
         return var_395;
      }
      
      public function method_606(param1:int) : void
      {
         if(var_396 != 0 && var_388[var_396 - 1] == CHAR_NL)
         {
            method_466();
         }
         var _loc2_:* = var_396++;
         var_388[_loc2_] = param1;
      }
      
      public function method_607() : Boolean
      {
         var _loc1_:int = method_608();
         while(_loc1_ != CHAR_EOF)
         {
            method_609(_loc1_);
            if(_loc1_ == CHAR_QUESTION && method_610() == CHAR_GT)
            {
               _loc1_ = method_608();
               method_609(_loc1_);
               return true;
            }
            _loc1_ = method_608();
         }
         var_387.clear();
         this.string = null;
         method_455("msg.XML.bad.form");
         return false;
      }
      
      private function method_611() : Boolean
      {
         var _loc1_:int = method_608();
         while(_loc1_ != CHAR_EOF)
         {
            method_609(_loc1_);
            if(_loc1_ == CHAR_RBRACKET && method_610() == CHAR_RBRACKET)
            {
               _loc1_ = method_608();
               method_609(_loc1_);
               if(method_610() == CHAR_GT)
               {
                  _loc1_ = method_608();
                  method_609(_loc1_);
                  return true;
               }
            }
            else
            {
               _loc1_ = method_608();
            }
         }
         var_387.clear();
         this.string = null;
         method_455("msg.XML.bad.form");
         return false;
      }
      
      private function method_612() : Boolean
      {
         var _loc1_:int = 1;
         var _loc2_:int = method_608();
         while(_loc2_ != CHAR_EOF)
         {
            method_609(_loc2_);
            switch(_loc2_)
            {
               case CHAR_LT:
                  _loc1_++;
                  break;
               case CHAR_GT:
                  _loc1_--;
                  if(_loc1_ == 0)
                  {
                     return true;
                  }
                  break;
            }
            _loc2_ = method_608();
         }
         var_387.clear();
         this.string = null;
         method_455("msg.XML.bad.form");
         return false;
      }
      
      public function method_613() : void
      {
         var _loc1_:int = 0;
         while((_loc1_ = method_608()) != CHAR_EOF && _loc1_ != CHAR_NL)
         {
         }
         method_606(_loc1_);
      }
      
      public function method_511(param1:int) : void
      {
         var _loc2_:int = 0;
         var_387.clear();
         if(param1 == ASSIGN_DIV)
         {
            method_609(CHAR_EQUAL);
         }
         else if(param1 != DIV)
         {
            method_466();
         }
         while((_loc2_ = method_608()) != CHAR_SLASH)
         {
            if(_loc2_ == CHAR_NL || _loc2_ == CHAR_EOF)
            {
               method_606(_loc2_);
               method_455("msg.unterminated.re.lit");
            }
            if(_loc2_ == CHAR_BACKSLASH)
            {
               method_609(_loc2_);
               _loc2_ = method_608();
            }
            method_609(_loc2_);
         }
         var _loc3_:int = var_387.length;
         while(true)
         {
            if(method_614(CHAR_g))
            {
               method_609(CHAR_g);
               continue;
            }
            if(method_614(CHAR_i))
            {
               method_609(CHAR_i);
               continue;
            }
            if(method_614(CHAR_m))
            {
               method_609(CHAR_m);
               continue;
            }
            break;
         }
         if(method_600(method_610()))
         {
            method_455("msg.invalid.re.flag");
         }
         this.string = var_387.substring(0,_loc3_);
         this.var_315 = var_387.substr(_loc3_,var_387.length - _loc3_);
      }
      
      public final function method_464() : int
      {
         return name_13;
      }
      
      public function method_475() : int
      {
         var_387.clear();
         var _loc1_:int = method_608();
         while(true)
         {
            if(_loc1_ == CHAR_EOF)
            {
               var_387.clear();
               this.string = null;
               method_455("msg.XML.bad.form");
               return ERROR;
            }
            if(var_392)
            {
               switch(_loc1_)
               {
                  case CHAR_GT:
                     method_609(_loc1_);
                     var_392 = false;
                     var_395 = false;
                     break;
                  case CHAR_SLASH:
                     method_609(_loc1_);
                     if(method_610() == CHAR_GT)
                     {
                        _loc1_ = method_608();
                        method_609(_loc1_);
                        var_392 = false;
                        var_397--;
                        break;
                     }
                     break;
                  case CHAR_LBRACE:
                     method_606(_loc1_);
                     this.string = method_615();
                     return XML;
                  case CHAR_QUOTE:
                  case CHAR_DOUBLEQUOTE:
                     method_609(_loc1_);
                     if(!method_616(_loc1_))
                     {
                        return ERROR;
                     }
                     break;
                  case CHAR_EQUAL:
                     method_609(_loc1_);
                     var_395 = true;
                     break;
                  case CHAR_SPACE:
                  case CHAR_TAB:
                  case CHAR_CR:
                  case CHAR_NL:
                     method_609(_loc1_);
                     break;
                  default:
                     method_609(_loc1_);
                     var_395 = false;
               }
               if(!var_392 && var_397 == 0)
               {
                  break;
               }
            }
            else
            {
               loop2:
               switch(_loc1_)
               {
                  case CHAR_LT:
                     method_609(_loc1_);
                     _loc1_ = method_610();
                     switch(_loc1_)
                     {
                        case CHAR_BAN:
                           _loc1_ = method_608();
                           method_609(_loc1_);
                           _loc1_ = method_610();
                           switch(_loc1_)
                           {
                              case CHAR_DASH:
                                 _loc1_ = method_608();
                                 method_609(_loc1_);
                                 _loc1_ = method_608();
                                 if(_loc1_ == CHAR_DASH)
                                 {
                                    method_609(_loc1_);
                                    if(!method_617())
                                    {
                                       return ERROR;
                                    }
                                    break loop2;
                                 }
                                 var_387.clear();
                                 this.string = null;
                                 method_455("msg.XML.bad.form");
                                 return ERROR;
                              case CHAR_LBRACKET:
                                 _loc1_ = method_608();
                                 method_609(_loc1_);
                                 if(method_608() == CHAR_C && method_608() == CHAR_D && method_608() == CHAR_A && method_608() == CHAR_T && method_608() == CHAR_A && method_608() == CHAR_LBRACKET)
                                 {
                                    method_609("CDATA[");
                                    if(!method_611())
                                    {
                                       return ERROR;
                                    }
                                    break loop2;
                                 }
                                 var_387.clear();
                                 this.string = null;
                                 method_455("msg.XML.bad.form");
                                 return ERROR;
                              default:
                                 if(!method_612())
                                 {
                                    return ERROR;
                                 }
                                 break loop2;
                           }
                        case CHAR_QUESTION:
                           _loc1_ = method_608();
                           method_609(_loc1_);
                           if(!method_607())
                           {
                              return ERROR;
                           }
                           break loop2;
                        case CHAR_SLASH:
                           _loc1_ = method_608();
                           method_609(_loc1_);
                           if(var_397 == 0)
                           {
                              var_387.clear();
                              this.string = null;
                              method_455("msg.XML.bad.form");
                              return ERROR;
                           }
                           var_392 = true;
                           var_397--;
                           break loop2;
                        default:
                           var_392 = true;
                           var_397++;
                           break loop2;
                     }
                  case CHAR_LBRACE:
                     method_606(_loc1_);
                     this.string = method_615();
                     return XML;
                  default:
                     method_609(_loc1_);
               }
            }
            _loc1_ = method_608();
         }
         this.string = method_615();
         return XMLEND;
      }
      
      public function method_609(param1:*) : void
      {
         if(param1 is String)
         {
            var_387.method_618(param1);
         }
         else
         {
            var_387.method_618(String.fromCharCode(int(param1)));
         }
      }
      
      public function method_614(param1:int) : Boolean
      {
         var _loc2_:int = method_608();
         if(_loc2_ == param1)
         {
            return true;
         }
         method_606(_loc2_);
         return false;
      }
      
      public function method_470() : int
      {
         var_397 = 0;
         var_395 = false;
         var_392 = false;
         method_606(CHAR_LT);
         return method_475();
      }
      
      public final function getNumber() : Number
      {
         return number;
      }
      
      public final function method_491() : int
      {
         var c:int = 0;
         var var_404:Boolean = false;
         var var_399:Boolean = false;
         var var_398:Boolean = false;
         var var_401:String = null;
         var var_400:int = 0;
         var i:int = 0;
         var var_373:int = 0;
         var base:int = 0;
         var var_403:Boolean = false;
         var var_406:String = null;
         var var_405:Number = NaN;
         var var_402:Boolean = false;
         loop0:
         while(true)
         {
            while(true)
            {
               c = method_608();
               if(c == CHAR_EOF)
               {
                  break;
               }
               if(c == CHAR_NL)
               {
                  var_407 = false;
                  return EOL;
               }
               if(!method_599(c))
               {
                  if(c != CHAR_DASH)
                  {
                     var_407 = true;
                  }
                  if(c == CHAR_AT)
                  {
                     return XMLATTR;
                  }
                  var_399 = false;
                  if(c == CHAR_BACKSLASH)
                  {
                     c = method_608();
                     if(c == CHAR_u)
                     {
                        var_404 = true;
                        var_399 = true;
                        var_387.clear();
                     }
                     else
                     {
                        var_404 = false;
                        method_606(c);
                        c = CHAR_BACKSLASH;
                     }
                  }
                  else
                  {
                     var_404 = method_597(c);
                     if(var_404)
                     {
                        var_387.clear();
                        method_609(c);
                     }
                  }
                  if(var_404)
                  {
                     var_398 = var_399;
                     while(true)
                     {
                        if(var_399)
                        {
                           var_400 = 0;
                           i = 0;
                           while(i != 4)
                           {
                              c = method_608();
                              var_400 = method_602(c,var_400);
                              if(var_400 < 0)
                              {
                                 break;
                              }
                              i++;
                           }
                           if(var_400 < 0)
                           {
                              break;
                           }
                           method_609(var_400);
                           var_399 = false;
                        }
                        else
                        {
                           c = method_608();
                           if(c == CHAR_BACKSLASH)
                           {
                              c = method_608();
                              if(c == CHAR_u)
                              {
                                 var_399 = true;
                                 var_398 = true;
                                 continue;
                              }
                              method_455("msg.illegal.character");
                              return ERROR;
                           }
                           if(c == CHAR_EOF || !method_596(c))
                           {
                              method_606(c);
                              var_401 = method_615();
                              if(!var_398)
                              {
                                 var_373 = method_603(var_401);
                                 if(var_373 != EOF)
                                 {
                                    if(var_373 != RESERVED)
                                    {
                                       return var_373;
                                    }
                                    method_570("msg.reserved.keyword",var_401);
                                 }
                              }
                              this.string = var_401;
                              return NAME;
                           }
                           method_609(c);
                        }
                     }
                     method_455("msg.invalid.escape");
                     return ERROR;
                  }
                  if(method_595(c) || c == CHAR_DOT && method_595(method_610()))
                  {
                     var_387.clear();
                     base = 10;
                     if(c == CHAR_0)
                     {
                        c = method_608();
                        if(c == CHAR_x || c == CHAR_X)
                        {
                           base = 16;
                           c = method_608();
                        }
                        else if(method_595(c))
                        {
                           base = 8;
                        }
                        else
                        {
                           method_609(CHAR_0);
                        }
                     }
                     if(base == 16)
                     {
                        while(0 <= method_602(c,0))
                        {
                           method_609(c);
                           c = method_608();
                        }
                     }
                     else
                     {
                        while(CHAR_0 <= c && c <= CHAR_9)
                        {
                           if(base == 8 && c >= CHAR_8)
                           {
                              method_570("msg.bad.octal.literal",c == CHAR_8?"8":"9");
                              base = 10;
                           }
                           method_609(c);
                           c = method_608();
                        }
                     }
                     var_403 = true;
                     if(base == 10 && (c == CHAR_DOT || c == CHAR_e || c == CHAR_E))
                     {
                        var_403 = false;
                        if(c == CHAR_DOT)
                        {
                           do
                           {
                              method_609(c);
                              c = method_608();
                           }
                           while(method_595(c));
                           
                        }
                        if(c == CHAR_e || c == CHAR_E)
                        {
                           method_609(c);
                           c = method_608();
                           if(c == CHAR_PLUS || c == CHAR_DASH)
                           {
                              method_609(c);
                              c = method_608();
                           }
                           if(!method_595(c))
                           {
                              method_455("msg.missing.exponent");
                              return ERROR;
                           }
                           do
                           {
                              method_609(c);
                              c = method_608();
                           }
                           while(method_595(c));
                           
                        }
                     }
                     method_606(c);
                     var_406 = method_615();
                     if(base == 10 && !var_403)
                     {
                        try
                        {
                           var_405 = Number(var_406);
                        }
                        catch(error:Error)
                        {
                           method_455("msg.caught.nfe");
                           return ERROR;
                        }
                     }
                     else
                     {
                        var_405 = method_619(var_406,base);
                     }
                     this.number = var_405;
                     return NUMBER;
                  }
                  switch(c)
                  {
                     case CHAR_DOUBLEQUOTE:
                     case CHAR_QUOTE:
                        break loop0;
                     case CHAR_SEMICOLON:
                        return SEMI;
                     case CHAR_LBRACKET:
                        return LB;
                     case CHAR_RBRACKET:
                        return RB;
                     case CHAR_LBRACE:
                        return LC;
                     case CHAR_RBRACE:
                        return RC;
                     case CHAR_LPAREN:
                        return LP;
                     case CHAR_RPAREN:
                        return RP;
                     case CHAR_COMMA:
                        return COMMA;
                     case CHAR_QUESTION:
                        return HOOK;
                     case CHAR_TILDA:
                        return BITNOT;
                     case CHAR_COLON:
                        return !!method_614(CHAR_COLON)?int(COLONCOLON):int(COLON);
                     case CHAR_DOT:
                        if(method_614(CHAR_DOT))
                        {
                           return DOTDOT;
                        }
                        return !!method_614(CHAR_LPAREN)?int(DOTQUERY):int(DOT);
                     case CHAR_PIPE:
                        if(method_614(CHAR_PIPE))
                        {
                           return !!method_614(CHAR_EQUAL)?int(ASSIGN_OR):int(OR);
                        }
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_BITOR):int(BITOR);
                     case CHAR_CARET:
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_BITXOR):int(BITXOR);
                     case CHAR_AMPERSAND:
                        if(method_614(CHAR_AMPERSAND))
                        {
                           return !!method_614(CHAR_EQUAL)?int(ASSIGN_AND):int(AND);
                        }
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_BITAND):int(BITAND);
                     case CHAR_EQUAL:
                        if(method_614(CHAR_EQUAL))
                        {
                           return !!method_614(CHAR_EQUAL)?int(SHEQ):int(EQ);
                        }
                        return ASSIGN;
                     case CHAR_BAN:
                        if(method_614(CHAR_EQUAL))
                        {
                           return !!method_614(CHAR_EQUAL)?int(SHNE):int(NE);
                        }
                        return NOT;
                     case CHAR_LT:
                        if(method_614(CHAR_BAN))
                        {
                           if(method_614(CHAR_DASH))
                           {
                              if(method_614(CHAR_DASH))
                              {
                                 method_613();
                                 continue loop0;
                              }
                              method_606(CHAR_DASH);
                           }
                           method_606(CHAR_BAN);
                        }
                        if(method_614(CHAR_LT))
                        {
                           return !!method_614(CHAR_EQUAL)?int(ASSIGN_LSH):int(LSH);
                        }
                        return !!method_614(CHAR_EQUAL)?int(LE):int(LT);
                     case CHAR_GT:
                        if(method_614(CHAR_GT))
                        {
                           if(method_614(CHAR_GT))
                           {
                              return !!method_614(CHAR_EQUAL)?int(ASSIGN_URSH):int(URSH);
                           }
                           return !!method_614(CHAR_EQUAL)?int(ASSIGN_RSH):int(RSH);
                        }
                        return !!method_614(CHAR_EQUAL)?int(GE):int(GT);
                     case CHAR_STAR:
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_MUL):int(MUL);
                     case CHAR_SLASH:
                        if(method_614(CHAR_SLASH))
                        {
                           method_613();
                           continue loop0;
                        }
                        if(method_614(CHAR_STAR))
                        {
                           var_402 = false;
                           while(true)
                           {
                              c = method_608();
                              if(c == CHAR_EOF)
                              {
                                 break;
                              }
                              if(c == CHAR_STAR)
                              {
                                 var_402 = true;
                              }
                              else if(c == CHAR_SLASH)
                              {
                                 if(var_402)
                                 {
                                    continue loop0;
                                 }
                              }
                              else
                              {
                                 var_402 = false;
                              }
                           }
                           method_455("msg.unterminated.comment");
                           return ERROR;
                        }
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_DIV):int(DIV);
                     case CHAR_PERCENT:
                        return !!method_614(CHAR_EQUAL)?int(ASSIGN_MOD):int(MOD);
                     case CHAR_PLUS:
                        if(method_614(CHAR_EQUAL))
                        {
                           return ASSIGN_ADD;
                        }
                        return !!method_614(CHAR_PLUS)?int(INC):int(ADD);
                     case CHAR_DASH:
                        if(method_614(CHAR_EQUAL))
                        {
                           c = ASSIGN_SUB;
                        }
                        else if(method_614(CHAR_DASH))
                        {
                           if(!var_407)
                           {
                              if(method_614(CHAR_GT))
                              {
                                 method_613();
                                 continue loop0;
                              }
                           }
                           c = DEC;
                        }
                        else
                        {
                           c = SUB;
                        }
                        var_407 = true;
                        return c;
                     default:
                        method_455("msg.illegal.character");
                        return ERROR;
                  }
               }
               else
               {
                  continue;
               }
            }
            return EOF;
         }
         return readString(c);
      }
      
      private function readString(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var_387.clear();
         var _loc3_:int = method_608();
         loop0:
         while(_loc3_ != param1)
         {
            if(_loc3_ == CHAR_NL || _loc3_ == CHAR_EOF)
            {
               method_606(_loc3_);
               method_455("msg.unterminated.string.lit");
               return ERROR;
            }
            if(_loc3_ == CHAR_BACKSLASH)
            {
               _loc3_ = method_608();
               switch(_loc3_)
               {
                  case CHAR_b:
                     _loc3_ = CHAR_BACKSLASH;
                     break;
                  case CHAR_f:
                     _loc3_ = CHAR_FEED;
                     break;
                  case CHAR_n:
                     _loc3_ = CHAR_NL;
                     break;
                  case CHAR_r:
                     _loc3_ = CHAR_CR;
                     break;
                  case CHAR_t:
                     _loc3_ = CHAR_TAB;
                     break;
                  case CHAR_v:
                     _loc3_ = 11;
                     break;
                  case CHAR_u:
                     _loc4_ = var_387.length;
                     _loc5_ = "u";
                     _loc2_ = 0;
                     _loc6_ = 0;
                     while(_loc6_ != 4)
                     {
                        _loc3_ = method_608();
                        _loc2_ = method_602(_loc3_,_loc2_);
                        if(_loc2_ < 0)
                        {
                           method_609(_loc5_);
                           continue loop0;
                        }
                        _loc5_ = _loc5_ + String.fromCharCode(_loc3_);
                        _loc6_++;
                     }
                     _loc3_ = _loc2_;
                     break;
                  case CHAR_x:
                     _loc3_ = method_608();
                     _loc2_ = method_602(_loc3_,0);
                     if(_loc2_ < 0)
                     {
                        method_609(CHAR_x);
                        continue;
                     }
                     _loc7_ = _loc3_;
                     _loc3_ = method_608();
                     _loc2_ = method_602(_loc3_,_loc2_);
                     if(_loc2_ < 0)
                     {
                        method_609(CHAR_x);
                        method_609(_loc7_);
                        continue;
                     }
                     _loc3_ = _loc2_;
                     break;
                  case CHAR_NL:
                     _loc3_ = method_608();
                     continue;
                  default:
                     if(CHAR_0 <= _loc3_ && _loc3_ < CHAR_8)
                     {
                        _loc8_ = _loc3_ - CHAR_0;
                        _loc3_ = method_608();
                        if(CHAR_0 <= _loc3_ && _loc3_ < CHAR_8)
                        {
                           _loc8_ = 8 * _loc8_ + _loc3_ - CHAR_0;
                           _loc3_ = method_608();
                           if(CHAR_0 <= _loc3_ && _loc3_ < CHAR_8 && _loc8_ <= 37)
                           {
                              _loc8_ = 8 * _loc8_ + _loc3_ - CHAR_0;
                              _loc3_ = method_608();
                           }
                        }
                        method_606(_loc3_);
                        _loc3_ = _loc8_;
                        break;
                     }
               }
            }
            method_609(_loc3_);
            _loc3_ = method_608();
         }
         this.string = method_615();
         return STRING;
      }
      
      private function method_616(param1:int) : Boolean
      {
         var _loc2_:int = method_608();
         while(_loc2_ != CHAR_EOF)
         {
            method_609(_loc2_);
            if(_loc2_ == param1)
            {
               return true;
            }
            _loc2_ = method_608();
         }
         var_387.clear();
         this.string = null;
         method_455("msg.XML.bad.form");
         return false;
      }
      
      private function method_619(param1:String, param2:Number) : Number
      {
         var _loc4_:int = 0;
         var _loc3_:* = 0;
         if(param2 == 10)
         {
            return Number(param1);
         }
         if(param2 == 16)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc3_ = Number(method_602(param1.charCodeAt(_loc4_),_loc3_));
               _loc4_++;
            }
         }
         else if(param2 == 8)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc3_ = Number(method_601(param1.charCodeAt(_loc4_),_loc3_));
               _loc4_++;
            }
         }
         else
         {
            class_118.method_455("msg.bad.number.base",param2);
         }
         return _loc3_;
      }
      
      public function method_610() : int
      {
         var _loc1_:int = method_608();
         method_606(_loc1_);
         return _loc1_;
      }
      
      public function method_608() : int
      {
         var _loc1_:int = 0;
         if(var_396 != 0)
         {
            return var_388[--var_396];
         }
         while(var_391 != var_390)
         {
            _loc1_ = var_389.charCodeAt(var_391++);
            if(var_394 >= 0)
            {
               if(var_394 == CHAR_CR && _loc1_ == CHAR_NL)
               {
                  var_394 = CHAR_NL;
                  continue;
               }
               var_394 = -1;
               var_393 = var_391 - 1;
               name_13++;
            }
            if(_loc1_ <= 127)
            {
               if(_loc1_ == CHAR_NL || _loc1_ == CHAR_CR)
               {
                  var_394 = _loc1_;
                  _loc1_ = CHAR_NL;
               }
            }
            else if(method_598(_loc1_))
            {
               var_394 = _loc1_;
               _loc1_ = CHAR_NL;
            }
            return _loc1_;
         }
         var_408 = true;
         return CHAR_EOF;
      }
      
      public function method_615() : String
      {
         return var_387.toString();
      }
      
      public final function method_620() : String
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(var_389 != null)
         {
            _loc1_ = var_391;
            if(var_394 >= 0)
            {
               _loc1_--;
            }
            else
            {
               while(_loc1_ != var_390)
               {
                  _loc2_ = var_389.charCodeAt(_loc1_);
                  if(method_598(_loc2_))
                  {
                     break;
                  }
                  _loc1_++;
               }
            }
            return var_389.substring(var_393,_loc1_);
         }
         _loc3_ = var_391 - var_393;
         if(var_394 >= 0)
         {
            _loc3_--;
         }
         else
         {
            while(true)
            {
               _loc4_ = var_393 + _loc3_;
               if(_loc4_ == var_390)
               {
                  break;
               }
               _loc2_ = var_389.charCodeAt(_loc4_);
               if(method_598(_loc2_))
               {
                  break;
               }
               _loc3_++;
            }
         }
         return var_389.substring(var_393,_loc3_);
      }
      
      public final function eof() : Boolean
      {
         return var_408;
      }
      
      private function method_617() : Boolean
      {
         var _loc1_:int = method_608();
         while(_loc1_ != CHAR_EOF)
         {
            method_609(_loc1_);
            if(_loc1_ == CHAR_DASH && method_610() == CHAR_DASH)
            {
               _loc1_ = method_608();
               method_609(_loc1_);
               if(method_610() == CHAR_GT)
               {
                  _loc1_ = method_608();
                  method_609(_loc1_);
                  return true;
               }
            }
            else
            {
               _loc1_ = method_608();
            }
         }
         var_387.clear();
         this.string = null;
         method_455("msg.XML.bad.form");
         return false;
      }
   }
}
