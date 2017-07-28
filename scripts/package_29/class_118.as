package package_29
{
   import flash.utils.describeType;
   import package_26.D;
   
   public class class_118
   {
      
      public static var var_301:Function = trace;
      
      private static var var_364:int = D.const_25;
      
      private static var var_363:Array = [];
      
      private static const const_81:Object = {
         "decodeURI":decodeURI,
         "decodeURIComponent":decodeURIComponent,
         "encodeURI":encodeURI,
         "encodeURIComponent":encodeURIComponent,
         "escape":escape,
         "isFinite":isFinite,
         "isNaN":isNaN,
         "isXMLName":isXMLName,
         "parseFloat":parseFloat,
         "parseInt":parseInt,
         "trace":trace,
         "unescape":unescape,
         "printf":printf,
         "importFunction":importFunction,
         "importStaticMethods":importStaticMethods,
         "Array":Array,
         "Boolean":Boolean,
         "int":int,
         "Number":Number,
         "Object":Object,
         "String":String,
         "uint":uint,
         "XML":XML,
         "XMLList":XMLList,
         "Date":Date,
         "Math":Math,
         "RegExp":RegExp,
         "QName":QName,
         "Namespace":Namespace,
         "Error":Error,
         "Class":Class
      };
      
      public static var var_359:Number = 100000;
      
      private static const const_82:Object = {
         "msg.no.paren.parms":"missing ( before function parameters.",
         "msg.misplaced.case":"misplaced case",
         "msg.no.colon.prop":"missing : in object property definition",
         "msg.no.brace.switch":"missing { in switch",
         "msg.bad.continue":"incorrect use of continue",
         "msg.illegal.character":"illegal character",
         "msg.reserved.id":"identifier is a reserved word",
         "msg.bad.break.continue":"incorrect use of break or continue",
         "msg.unreachable.code":"unreachable code",
         "msg.bad.prop":"invalid property id",
         "msg.no.name.after.dot":"missing name after . operator",
         "msg.no.paren":"missing ) in parenthetical",
         "msg.misplaced.right.brace":"misplaced }",
         "msg.unreachable.stmts.in.switch":"unreachable code in switch statement",
         "msg.XML.bad.form":"illegally formed XML syntax",
         "msg.dup.label":"duplicatet label",
         "msg.no.semi.stmt":"missing ; before statement",
         "msg.class.not.supported":"class not supported",
         "msg.no.colon.cond":"missing : in conditional expression",
         "msg.bad.number.base":"incorrect number base",
         "msg.missing.exponent":"missing exponent",
         "msg.case.no.colon":"missing : after case expression",
         "msg.no.name.after.xmlAttr":"missing name after .@",
         "msg.no.brace.prop":"missing } after property list",
         "msg.unterminated.re.lit":"unterminated regular expression literal",
         "msg.invalid.escape":"invalid Unicode escape sequence",
         "msg.unterminated.comment":"unterminated comment",
         "msg.invalid.re.flag":"invalid flag after regular expression",
         "msg.caught.nfe":"number format error",
         "msg.not.assignable":"not assignable",
         "msg.unexpected.eof":"Unexpected end of file",
         "msg.no.brace.body":"missing \'{\' before function body",
         "msg.undef.label":"undefined labe",
         "msg.function.expr.not.supported":"function expression is not supported",
         "msg.missing.function.name":"missing function name",
         "msg.syntax":"syntax error",
         "msg.unterminated.string.lit":"unterminated string literal",
         "msg.no.bracket.arg":"missing ] after element list",
         "msg.bad.namespace":"not a valid default namespace statement. Syntax is: default xml namespace : EXPRESSION;",
         "msg.no.bracket.index":"missing ] in index expression",
         "msg.no.name.after.coloncolon":"missing name after ::",
         "msg.no.paren.for":"missing ( after for",
         "msg.no.paren.after.parms":"missing ) after formal parameters"
      };
      
      private static var var_365:class_118;
       
      
      private var var_372:Object;
      
      private var var_366:Array;
      
      private var var_351:Object;
      
      private var var_371:Object;
      
      private var var_370:Object;
      
      private var var_373:Object;
      
      public function class_118(param1:Object, param2:Object)
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         this.var_370 = param1;
         this.var_351 = param2;
         this.var_366 = [param2];
         var_371 = {};
         var_372 = {};
         if(param1)
         {
            this.var_366.push(param1);
            if(param1.prototype != null)
            {
               this.var_366.push(param1.prototype);
            }
            _loc3_ = describeType(param1);
            for each(_loc4_ in _loc3_.accessor)
            {
               _loc5_ = _loc4_.@access;
               if(_loc5_ == "readwrite")
               {
                  var_372[_loc4_.@name] = true;
                  var_371[_loc4_.@name] = true;
               }
               else if(_loc5_ == "readonly")
               {
                  var_372[_loc4_.@name] = true;
               }
               else if(_loc5_ == "writeonly")
               {
                  var_371[_loc4_.@name] = true;
               }
            }
         }
         else
         {
            var_371 = var_372;
         }
         this.var_366.push(const_81);
      }
      
      public static function method_103(param1:String) : Class
      {
         var _loc2_:* = const_81[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         if(_loc2_ is Class)
         {
            return _loc2_ as Class;
         }
         if(_loc2_ is Array)
         {
            _loc2_ = (_loc2_ as Array)[0];
            if(_loc2_ is Class)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function method_568(param1:*) : Object
      {
         return var_365.method_568(param1);
      }
      
      public static function method_569() : Boolean
      {
         var _loc1_:* = var_365.var_366[0];
         return _loc1_ is XML || _loc1_ is XMLList;
      }
      
      public static function method_570(... rest) : void
      {
         var_301("[D:warn ] " + method_504.apply(null,rest));
      }
      
      public static function method_424(param1:String) : void
      {
         var_301(param1);
      }
      
      public static function method_431(param1:class_117, param2:Object = null, param3:Object = null) : Object
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * 反混淆被激活，但是反编译还是失败了。如果文件不混乱，禁用“自动反混淆”效果会更好。
          * Error type: ConvertException (Invalid jump to ofs006d on line -1)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      public static function method_430(param1:Class, param2:String = null) : void
      {
         if(param2 == null)
         {
            param2 = describeType(param1).@name;
         }
         var _loc3_:Array = param2.split(/\./g);
         param2 = _loc3_[_loc3_.length - 1];
         method_574(param2,param1);
      }
      
      public static function method_575() : Object
      {
         return var_365.var_370;
      }
      
      public static function method_576(param1:*, param2:Object) : void
      {
         var_365.method_576(param1,param2);
      }
      
      public static function printf(... rest) : void
      {
         method_424(method_577.apply(null,rest));
      }
      
      private static function method_573() : void
      {
         var_363.pop();
         if(var_363.length > 0)
         {
            var_365 = var_363[var_363.length - 1];
         }
         else
         {
            var_365 = null;
         }
      }
      
      public static function importFunction(param1:String, param2:Function) : void
      {
         method_574(param1,param2);
      }
      
      public static function method_559(param1:Object) : void
      {
         var_365.method_572 = param1;
      }
      
      public static function method_504(... rest) : String
      {
         if(rest.length > 0)
         {
            rest[0] = method_578(rest[0]);
         }
         return method_577.apply(null,rest);
      }
      
      public static function method_433(param1:int) : void
      {
         var_364 = param1;
      }
      
      private static function method_574(param1:String, param2:*) : void
      {
         if(var_364 != D.const_25)
         {
            if(const_81[param1])
            {
               switch(var_364)
               {
                  case D.const_26:
                     method_570("msg.override.global.name",param1);
                     break;
                  case D.const_27:
                     throw new class_141("msg.override.global.name",param1);
               }
            }
         }
         const_81[param1] = param2;
      }
      
      public static function method_560() : Object
      {
         return var_365.method_572;
      }
      
      public static function method_577(... rest) : String
      {
         switch(rest.length)
         {
            case 0:
               return "";
            case 1:
               return String(rest[0]);
            default:
               return class_143.method_579.apply(null,rest);
         }
      }
      
      public static function method_561() : *
      {
         return var_365.method_561();
      }
      
      private static function method_578(param1:String) : String
      {
         var _loc2_:String = const_82[param1] as String;
         return _loc2_ == null?param1:_loc2_;
      }
      
      private static function method_571(param1:class_118) : void
      {
         var_363.push(var_365 = param1);
      }
      
      public static function method_455(... rest) : void
      {
         var_301("[D:error] " + method_504.apply(null,rest));
      }
      
      public static function method_580(... rest) : void
      {
         var_301("[D:debug] " + method_504.apply(null,rest));
      }
      
      public static function method_558(param1:*) : void
      {
         var_365.method_558(param1);
      }
      
      public static function method_581() : *
      {
         return var_365.var_366[0];
      }
      
      public static function importStaticMethods(param1:Class, param2:* = null) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:XML = describeType(param1);
         for each(_loc4_ in _loc3_.method)
         {
            _loc5_ = _loc4_.@name;
            if(param2)
            {
               if(param2 is RegExp)
               {
                  if(!_loc5_.match(param2 as RegExp))
                  {
                     _loc5_ = null;
                  }
               }
               else if(param2 is Array)
               {
                  if((param2 as Array).indexOf(_loc5_) < 0)
                  {
                     _loc5_ = null;
                  }
               }
               else if(_loc5_ != param2)
               {
                  _loc5_ = null;
               }
            }
            if(_loc5_)
            {
               importFunction(_loc5_,param1[_loc5_]);
            }
         }
      }
      
      function set method_572(param1:Object) : void
      {
         var_373 = param1;
      }
      
      function get method_572() : Object
      {
         return var_373;
      }
      
      function method_568(param1:*) : Object
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in var_366)
         {
            if(_loc2_.hasOwnProperty(param1))
            {
               return _loc2_[param1];
            }
         }
         if(var_370 != null && var_372[param1])
         {
            return var_370[param1];
         }
         return null;
      }
      
      function method_561() : *
      {
         return var_366.shift();
      }
      
      function method_576(param1:*, param2:*) : void
      {
         var _loc3_:* = undefined;
         for each(_loc3_ in var_366)
         {
            if(_loc3_.hasOwnProperty(param1))
            {
               _loc3_[param1] = param2;
               return;
            }
         }
         if(var_370 != null && var_371[param1])
         {
            var_370[param1] = param2;
         }
         else
         {
            var_351[param1] = param2;
         }
      }
      
      function method_558(param1:*) : void
      {
         var_366.unshift(param1);
      }
   }
}
