package package_29
{
   public class class_131 extends class_130
   {
       
      
      private var var_386:Boolean;
      
      private var expr:class_115;
      
      private var var_345:Array;
      
      public function class_131(param1:Boolean, param2:class_115)
      {
         var_345 = [];
         super();
         this.expr = param2;
         this.var_386 = param1;
      }
      
      private static function method_593(param1:Class, param2:Array) : Object
      {
         switch(param2.length)
         {
            case 0:
               return new param1();
            case 1:
               return new param1(param2[0]);
            case 2:
               return new param1(param2[0],param2[1]);
            case 3:
               return new param1(param2[0],param2[1],param2[2]);
            case 4:
               return new param1(param2[0],param2[1],param2[2],param2[3]);
            case 5:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4]);
            case 6:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
            case 7:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6]);
            case 8:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7]);
            case 9:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8]);
            case 10:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9]);
            case 11:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10]);
            case 12:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11]);
            case 13:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12]);
            case 14:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13]);
            case 15:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14]);
            case 16:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14],param2[15]);
            case 17:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14],param2[15],param2[16]);
            case 18:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14],param2[15],param2[16],param2[17]);
            case 19:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14],param2[15],param2[16],param2[17],param2[18]);
            case 20:
               return new param1(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5],param2[6],param2[7],param2[8],param2[9],param2[10],param2[11],param2[12],param2[13],param2[14],param2[15],param2[16],param2[17],param2[18],param2[19]);
            default:
               throw new Error("Number of parameters exceeds limit of 20.");
         }
      }
      
      public function method_459(param1:class_115) : void
      {
         var_345.push(param1);
      }
      
      override public function getAny() : Object
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:* = [];
         for each(_loc2_ in var_345)
         {
            if(_loc2_ is class_115)
            {
               _loc2_ = (_loc2_ as class_115).getAny();
            }
            _loc3_.push(_loc2_);
         }
         if(var_386)
         {
            _loc1_ = expr.getAny();
            if(!_loc1_)
            {
               throw new class_141("msg.rt.no.class");
            }
            if(!(_loc1_ is Class))
            {
               throw new class_141("msg.rt.not.class");
            }
            return method_593(_loc1_ as Class,_loc3_);
         }
         if(expr is class_160)
         {
            _loc4_ = expr as class_160;
            _loc5_ = [null,null,false];
            _loc4_.method_594(_loc5_);
            _loc2_ = _loc5_[0];
            _loc1_ = _loc5_[1];
            if(_loc5_[2])
            {
               _loc3_.unshift(_loc2_);
               _loc2_ = null;
            }
         }
         else
         {
            _loc2_ = null;
            _loc1_ = expr.getAny();
         }
         if(_loc1_ != null)
         {
            if(_loc1_ is Function)
            {
               return (_loc1_ as Function).apply(_loc2_,_loc3_);
            }
            if(_loc1_ is Class)
            {
               if(_loc3_.length <= 0)
               {
                  return null;
               }
               return _loc3_[0] as (_loc1_ as Class);
            }
            if(_loc1_ is class_116)
            {
               return (_loc1_ as class_116).method_431(_loc3_);
            }
         }
         throw new class_141("msg.rt.no.function");
      }
   }
}
