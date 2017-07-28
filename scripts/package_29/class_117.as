package package_29
{
   import r1.deval.parser.class_114;
   
   public class class_117
   {
      
      private static var var_353:int = 0;
       
      
      private var var_355:class_117;
      
      private var var_356:class_115;
      
      private var var_357:Array = null;
      
      public var name:String;
      
      private var var_358:Array = null;
      
      private var var_354:Boolean = false;
      
      public var stmts:Array;
      
      private var var_362:int;
      
      private var var_361:class_117;
      
      private var var_360:Boolean = false;
      
      public function class_117(param1:String = null, param2:Boolean = true)
      {
         super();
         if(class_114.var_316 || !param2)
         {
            if(param2)
            {
               if(param1 == null)
               {
                  param1 = "";
               }
               this.name = param1 + "/" + ++var_353;
            }
            else
            {
               this.name = param1;
            }
         }
         var_354 = !param2;
      }
      
      public function method_562() : Boolean
      {
         return var_356 == null;
      }
      
      public function info(param1:int = 0) : String
      {
         var _loc6_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ = _loc2_ + "  ";
            _loc3_++;
         }
         var _loc4_:String = "\n" + _loc2_;
         if(this is class_140)
         {
            if(this == class_140.const_80)
            {
               return _loc2_ + "<EXIT name=\"" + name + "\" />";
            }
            return null;
         }
         if(method_563())
         {
            return _loc2_ + method_564(true);
         }
         var _loc5_:* = _loc2_ + "<Block name=\"" + name + "\" optimized=\"" + var_354 + "\">";
         for each(_loc6_ in stmts)
         {
            _loc5_ = _loc5_ + (_loc4_ + "  <stmt");
            if(_loc6_.name_13 > 0)
            {
               _loc5_ = _loc5_ + (" line=\"" + _loc6_.name_13 + "\"");
            }
            _loc5_ = _loc5_ + (">" + String(_loc6_) + "</stmt>");
         }
         return _loc5_ + _loc4_ + "  " + method_564() + _loc4_ + "</Block>";
      }
      
      public function method_517(param1:Object, param2:int = 0) : void
      {
         if(stmts == null)
         {
            stmts = [];
         }
         if(!(param1 is class_133))
         {
            if(param1 is class_115)
            {
               param1 = new class_142(param1 as class_115,param2);
            }
         }
         stmts.push(param1);
      }
      
      public function method_552() : Boolean
      {
         return method_562() && (stmts == null || stmts.length == 0) && !(this is class_140);
      }
      
      private function method_565(param1:class_117, param2:Boolean = true) : void
      {
         if(param2)
         {
            if(var_358 == null)
            {
               var_358 = [];
            }
            var_358.push(param1);
         }
         else
         {
            if(var_357 == null)
            {
               var_357 = [];
            }
            var_357.push(param1);
         }
      }
      
      public function set method_535(param1:class_117) : void
      {
         if(var_355 != null)
         {
            var_355.method_566(this);
         }
         var_355 = param1;
         if(param1 != null)
         {
            param1.method_565(this);
         }
      }
      
      public function method_563() : Boolean
      {
         return (stmts == null || stmts.length == 0) && var_356 != null;
      }
      
      public function method_553() : class_115
      {
         return var_356;
      }
      
      public function method_431(param1:class_117 = null) : void
      {
         if(param1 == null)
         {
            param1 = class_140.const_80;
         }
         var _loc2_:* = {};
         var _loc3_:* = 0;
         while(_loc2_ != null && _loc2_ != param1)
         {
            _loc2_ = _loc2_.method_567();
            if(_loc3_ > class_118.var_359)
            {
               throw new class_141("msg.rt.infinite.loop");
            }
            _loc3_++;
         }
      }
      
      public function get method_518() : Boolean
      {
         return var_360 || var_355 is class_140;
      }
      
      public function method_567() : class_117
      {
         var s:class_133 = null;
         if(stmts != null)
         {
            for each(s in stmts)
            {
               try
               {
                  s.method_567();
               }
               catch(e:Error)
               {
                  if(e is class_141)
                  {
                     (e as class_141).name_13 = s.name_13;
                  }
                  throw e;
               }
            }
         }
         if(var_356 == null || var_356.getBoolean())
         {
            return var_355;
         }
         return var_361;
      }
      
      public function get method_535() : class_117
      {
         return var_355;
      }
      
      public function method_536(param1:class_115, param2:int = -1) : void
      {
         var_356 = param1;
         if(param2 >= 0)
         {
            var_362 = param2;
         }
      }
      
      public function set method_537(param1:class_117) : void
      {
         if(var_361 != null)
         {
            var_361.method_566(this,false);
         }
         var_361 = param1;
         if(param1 != null)
         {
            param1.method_565(this,false);
         }
      }
      
      public function method_564(param1:Boolean = false) : String
      {
         if(method_535 is class_140)
         {
            return "<return/>";
         }
         var _loc2_:String = var_356 == null?"<goto ":"<test ";
         if(param1 && name != null)
         {
            _loc2_ = _loc2_ + ("name=\"" + name + "\" ");
         }
         if(var_356 != null)
         {
            _loc2_ = _loc2_ + ("expr=\"" + String(var_356) + "\" ");
         }
         if(var_362 > 0)
         {
            _loc2_ = _loc2_ + ("line=\"" + var_362 + "\" ");
         }
         if(var_355 != null)
         {
            _loc2_ = _loc2_ + ("trueNext=\"" + var_355.name + "\" ");
         }
         if(var_361 != null && var_356 != null)
         {
            _loc2_ = _loc2_ + ("falseNext=\"" + var_361.name + "\" ");
         }
         return _loc2_ + "/>";
      }
      
      private function method_566(param1:class_117, param2:Boolean = true) : void
      {
         if(param2)
         {
            if(var_358 != null)
            {
               var_358.splice(var_358.indexOf(this));
            }
         }
         else if(var_357 != null)
         {
            var_357.splice(var_357.indexOf(this));
         }
      }
      
      public function method_515(param1:Object, param2:int = 0) : void
      {
         if(param1[name] != null)
         {
            return;
         }
         param1[name] = true;
         var _loc3_:String = info(param2);
         if(_loc3_ != null)
         {
            trace("\n" + _loc3_);
         }
         if(method_535 != null)
         {
            method_535.method_515(param1,param2);
         }
         if(method_537 != null)
         {
            method_537.method_515(param1,param2);
         }
      }
      
      public function method_549() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_354)
         {
            return;
         }
         var_354 = true;
         if(var_355 != null && !(var_355 is class_140))
         {
            var_355.method_549();
            if(var_355.method_552())
            {
               method_535 = var_355.method_535;
            }
            else if(method_562())
            {
               _loc1_ = var_355 as class_117;
               if(_loc1_.method_541() == 1 && _loc1_.method_562())
               {
                  if(stmts == null)
                  {
                     stmts = _loc1_.stmts;
                  }
                  else
                  {
                     for each(_loc2_ in _loc1_.stmts)
                     {
                        stmts.push(_loc2_);
                     }
                  }
                  method_535 = _loc1_.method_535;
               }
            }
         }
         if(var_361 != null && !(var_361 is class_140))
         {
            var_361.method_549();
            if(var_361.method_552())
            {
               method_537 = var_361.method_535;
            }
         }
         if(method_552())
         {
            for each(_loc3_ in var_358)
            {
               if(_loc3_ != null)
               {
                  _loc3_.var_355 = var_355;
               }
            }
            for each(_loc3_ in var_357)
            {
               if(_loc3_ != null)
               {
                  _loc3_.var_361 = var_355;
               }
            }
            method_535 = method_537 = null;
            var_358 = var_357 = null;
         }
      }
      
      public function get method_537() : class_117
      {
         return var_361;
      }
      
      public function method_541() : int
      {
         return (var_358 == null?0:var_358.length) + (var_357 == null?0:var_357.length);
      }
      
      public function set method_518(param1:Boolean) : void
      {
         var_360 = param1;
      }
   }
}
