package package_30
{
   import flash.system.ApplicationDomain;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class class_144
   {
       
      
      private var var_423:XML;
      
      private var _class:Class;
      
      private var var_424;
      
      private var var_425:class_170;
      
      private var var_426:class_169;
      
      private var var_427:class_165;
      
      private var var_428:class_167;
      
      private var var_429:class_160;
      
      private var var_430:class_127;
      
      private var var_431:class_166;
      
      private var var_432:class_168;
      
      private var var_433:String;
      
      private var var_434:String;
      
      public function class_144(param1:* = null)
      {
         super();
         this.parse(param1);
      }
      
      public static function method_622(param1:Class) : XML
      {
         var _loc2_:String = method_623(param1);
         var _loc3_:Class = getDefinitionByName(_loc2_) as Class;
         if(!class_171.method_624(_loc2_))
         {
            class_171.add(_loc2_,describeType(_loc3_));
         }
         return class_171.method_89(_loc2_);
      }
      
      public static function method_625(param1:String, param2:ApplicationDomain = null) : Class
      {
         if(!param2)
         {
            param2 = ApplicationDomain.currentDomain;
         }
         return param2.getDefinition(param1) as Class;
      }
      
      public static function method_626(param1:*) : String
      {
         var _loc2_:String = getQualifiedClassName(param1);
         _loc2_ = _loc2_.split("::").join(".");
         var _loc3_:Array = _loc2_.split(".");
         if(_loc3_.length > 1)
         {
            _loc3_.pop();
            return _loc3_.join(".");
         }
         return "";
      }
      
      public static function method_623(param1:*, param2:Boolean = true) : String
      {
         var _loc3_:String = getQualifiedClassName(param1);
         if(param2)
         {
            _loc3_ = _loc3_.split("::").join(".");
         }
         return _loc3_;
      }
      
      public static function method_627(param1:*, param2:Boolean = false) : String
      {
         var _loc4_:* = null;
         var _loc3_:String = getQualifiedClassName(param1);
         if(param2)
         {
            return _loc3_;
         }
         _loc3_ = _loc3_.split("::").join(".");
         _loc4_ = _loc3_.split(".");
         if(_loc4_.length > 1)
         {
            return _loc4_.pop();
         }
         return _loc3_;
      }
      
      public static function method_628(param1:Class, param2:Array = null) : *
      {
         if(!param2)
         {
            return new param1();
         }
         var _loc3_:Array = param2;
         switch(_loc3_.length)
         {
            case 0:
               return new param1();
            case 1:
               return new param1(_loc3_[0]);
            case 2:
               return new param1(_loc3_[0],_loc3_[1]);
            case 3:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2]);
            case 4:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
            case 5:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4]);
            case 6:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5]);
            case 7:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6]);
            case 8:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7]);
            case 9:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8]);
            case 10:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9]);
            case 11:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10]);
            case 12:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11]);
            case 13:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12]);
            case 14:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13]);
            case 15:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14]);
            case 16:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15]);
            case 17:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16]);
            case 18:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17]);
            case 19:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18]);
            case 20:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19]);
            case 21:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20]);
            case 22:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21]);
            case 23:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22]);
            case 24:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23]);
            case 25:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24]);
            case 26:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25]);
            case 27:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26]);
            case 28:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26],_loc3_[27]);
            case 29:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26],_loc3_[27],_loc3_[28]);
            case 30:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26],_loc3_[27],_loc3_[28],_loc3_[29]);
            case 31:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26],_loc3_[27],_loc3_[28],_loc3_[29],_loc3_[30]);
            case 32:
               return new param1(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3],_loc3_[4],_loc3_[5],_loc3_[6],_loc3_[7],_loc3_[8],_loc3_[9],_loc3_[10],_loc3_[11],_loc3_[12],_loc3_[13],_loc3_[14],_loc3_[15],_loc3_[16],_loc3_[17],_loc3_[18],_loc3_[19],_loc3_[20],_loc3_[21],_loc3_[22],_loc3_[23],_loc3_[24],_loc3_[25],_loc3_[26],_loc3_[27],_loc3_[28],_loc3_[29],_loc3_[30],_loc3_[31]);
            default:
               return null;
         }
      }
      
      protected function parse(param1:*) : void
      {
         this.var_424 = param1;
         this._class = getDefinitionByName(method_623(this.var_424)) as Class;
         this.var_423 = method_622(this._class);
         this.var_425 = new class_170(this.var_424,this.var_423);
         this.var_426 = new class_169(this.var_424,this.var_423);
         this.var_427 = new class_165(this.var_424,this.var_423);
         this.var_428 = new class_167(this.var_424,this.var_423);
         this.var_429 = new class_160(this.var_424,this.var_423);
         this.var_430 = new class_127(this.var_424,this.var_423);
         this.var_431 = new class_166(this.var_424,this.var_423);
         this.var_432 = new class_168(this.var_424,this.var_423);
         this.var_433 = String(this.var_423.@name).replace("::",".");
         var _loc2_:Array = this.var_433.split(".");
         this.var_434 = _loc2_[_loc2_.length - 1];
      }
      
      public function get method_629() : class_170
      {
         return this.var_425;
      }
      
      public function get method_630() : class_169
      {
         return this.var_426;
      }
      
      public function get method_631() : class_165
      {
         return this.var_427;
      }
      
      public function get method_632() : class_167
      {
         return this.var_428;
      }
      
      public function get method_633() : Class
      {
         return this._class;
      }
      
      public function get accessor() : class_160
      {
         return this.var_429;
      }
      
      public function get variable() : class_166
      {
         return this.var_431;
      }
      
      public function get constant() : class_127
      {
         return this.var_430;
      }
      
      public function get method() : class_168
      {
         return this.var_432;
      }
      
      public function get method_634() : String
      {
         return this.var_433;
      }
      
      public function get method_635() : String
      {
         return this.var_434;
      }
   }
}
