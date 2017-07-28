package package_29
{
   import r1.deval.parser.class_112;
   
   class class_155 extends class_130 implements class_133
   {
       
      
      protected var var_440:int;
      
      protected var left:class_128;
      
      private var var_445:class_133;
      
      private var var_385:int;
      
      protected var right:class_115;
      
      function class_155(param1:class_128, param2:class_115, param3:int, param4:int)
      {
         super();
         this.left = param1;
         this.right = param2;
         this.var_440 = param3;
         this.var_385 = param4;
      }
      
      public function set method_638(param1:class_133) : void
      {
         var_445 = param1;
      }
      
      public function method_567() : void
      {
         class_118.method_559(getAny());
      }
      
      public function get name_13() : int
      {
         return var_385;
      }
      
      override public function getAny() : Object
      {
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         switch(var_440)
         {
            case class_112.ASSIGN:
               _loc1_ = right.getAny();
               left.method_590(_loc1_);
               return _loc1_;
            case class_112.ASSIGN_ADD:
               _loc1_ = left.getAny();
               _loc4_ = right.getAny();
               if((_loc1_ is XML || _loc1_ is XMLList) && (_loc4_ is XML || _loc4_ is XMLList))
               {
                  if(_loc1_ is XML)
                  {
                     _loc1_ = new XMLList("") + _loc1_;
                  }
                  _loc1_ = _loc1_ + _loc4_;
               }
               else if(_loc1_ is String || _loc4_ is String)
               {
                  _loc1_ = _loc1_.toString() + _loc4_.toString();
               }
               else
               {
                  _loc1_ = Number(_loc1_) + Number(_loc4_);
               }
               left.method_590(_loc1_);
               return _loc1_;
            case class_112.ASSIGN_AND:
            case class_112.ASSIGN_OR:
               _loc5_ = left.getBoolean();
               _loc6_ = right.getBoolean();
               if(var_440 == class_112.ASSIGN_AND)
               {
                  _loc5_ = _loc5_ && _loc6_;
               }
               else
               {
                  _loc5_ = _loc5_ || _loc6_;
               }
               left.method_590(_loc5_);
               return _loc5_;
            default:
               var _loc2_:Number = left.getNumber();
               var _loc3_:Number = right.getNumber();
               switch(var_440)
               {
                  case class_112.ASSIGN_BITOR:
                     _loc2_ = _loc2_ | _loc3_;
                     break;
                  case class_112.ASSIGN_BITXOR:
                     _loc2_ = _loc2_ ^ _loc3_;
                     break;
                  case class_112.ASSIGN_BITAND:
                     _loc2_ = _loc2_ & _loc3_;
                     break;
                  case class_112.ASSIGN_LSH:
                     _loc2_ = _loc2_ << _loc3_;
                     break;
                  case class_112.ASSIGN_RSH:
                     _loc2_ = _loc2_ >> _loc3_;
                     break;
                  case class_112.ASSIGN_URSH:
                     _loc2_ = _loc2_ >>> _loc3_;
                     break;
                  case class_112.ASSIGN_ADD:
                     _loc2_ = _loc2_ + _loc3_;
                     break;
                  case class_112.ASSIGN_SUB:
                     _loc2_ = _loc2_ - _loc3_;
                     break;
                  case class_112.ASSIGN_MUL:
                     _loc2_ = _loc2_ * _loc3_;
                     break;
                  case class_112.ASSIGN_DIV:
                     _loc2_ = _loc2_ / _loc3_;
                     break;
                  case class_112.ASSIGN_MOD:
                     _loc2_ = _loc2_ % _loc3_;
               }
               left.method_590(_loc2_);
               return _loc2_;
         }
      }
      
      public function get method_638() : class_133
      {
         return var_445;
      }
   }
}
