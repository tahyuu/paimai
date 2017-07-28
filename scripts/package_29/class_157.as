package package_29
{
   import r1.deval.parser.class_112;
   
   class class_157 extends class_146
   {
       
      
      function class_157(param1:class_115, param2:*, param3:*)
      {
         super(param1,param2,param3);
      }
      
      override public function getNumber() : Number
      {
         return Number(getBoolean());
      }
      
      override public function method_452() : String
      {
         return getBoolean().toString();
      }
      
      override public function getBoolean() : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc1_:class_115 = var_435;
         var _loc2_:Object = _loc1_.getAny();
         var _loc3_:int = 0;
         loop0:
         while(true)
         {
            if(_loc3_ >= var_436.length)
            {
               return true;
            }
            _loc4_ = var_437[_loc3_] as int;
            _loc5_ = (var_436[_loc3_] as class_115).getAny();
            if(_loc2_ is Number || _loc5_ is Number)
            {
               _loc6_ = Number(_loc2_);
               _loc7_ = Number(_loc5_);
               switch(_loc4_)
               {
                  case class_112.EQ:
                  case class_112.SHEQ:
                     if(_loc6_ != _loc7_)
                     {
                        return false;
                     }
                     break;
                  case class_112.NE:
                  case class_112.SHNE:
                     if(_loc6_ == _loc7_)
                     {
                        return false;
                     }
                     break;
                  case class_112.LE:
                     if(_loc6_ > _loc7_)
                     {
                        return false;
                     }
                     break;
                  case class_112.LT:
                     if(_loc6_ >= _loc7_)
                     {
                        return false;
                     }
                     break;
                  case class_112.GE:
                     if(_loc6_ < _loc7_)
                     {
                        return false;
                     }
                     break;
                  case class_112.GT:
                     if(_loc6_ <= _loc7_)
                     {
                        return false;
                     }
                     break;
               }
            }
            else
            {
               switch(_loc4_)
               {
                  case class_112.EQ:
                     if(_loc2_ != _loc5_)
                     {
                        return false;
                     }
                     break;
                  case class_112.NE:
                     if(_loc2_ == _loc5_)
                     {
                        return false;
                     }
                     break;
                  case class_112.SHEQ:
                     if(_loc2_ !== _loc5_)
                     {
                        return false;
                     }
                     break;
                  case class_112.SHNE:
                     if(_loc2_ === _loc5_)
                     {
                        return false;
                     }
                     break;
                  case class_112.LE:
                  case class_112.LT:
                  case class_112.GE:
                  case class_112.GT:
                     break loop0;
               }
            }
            _loc2_ = _loc5_;
            _loc3_++;
         }
         return false;
      }
      
      override public function getAny() : Object
      {
         return getBoolean();
      }
   }
}
