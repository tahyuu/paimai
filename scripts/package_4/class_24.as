package package_4
{
   import flash.events.Event;
   import flash.utils.getTimer;
   import package_16.class_48;
   import package_3.class_4;
   
   public class class_24
   {
       
      
      private var var_78:Vector.<class_25>;
      
      public function class_24()
      {
         super();
         this.var_78 = new Vector.<class_25>();
      }
      
      private function method_121(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_78.length)
         {
            _loc2_ = this.var_78[_loc3_];
            _loc2_.var_79 = getTimer();
            if(_loc2_.var_79 - _loc2_.var_80 >= _loc2_.var_81)
            {
               _loc2_.taskAction.execute();
               _loc2_.var_80 = _loc2_.var_79;
               if(_loc2_.var_82)
               {
                  this.method_77(_loc2_.taskAction);
               }
            }
            _loc3_++;
         }
      }
      
      public function method_63() : void
      {
         this.var_78 = new Vector.<class_25>();
      }
      
      public function method_82(param1:class_48, param2:uint = 0) : void
      {
         if(param2 == 0)
         {
            param2 = 1000 / class_4.method_9.method_110;
         }
         this.method_122(param1,param2,false);
      }
      
      public function method_123(param1:class_48, param2:uint = 0) : void
      {
         if(param2 == 0)
         {
            param2 = 1000 / class_4.method_9.method_110;
         }
         this.method_122(param1,param2,true);
      }
      
      private function method_122(param1:class_48, param2:uint, param3:Boolean) : void
      {
         var _loc4_:* = null;
         if(!this.method_124(param1))
         {
            _loc4_ = new class_25();
            _loc4_.var_80 = getTimer();
            _loc4_.var_79 = _loc4_.var_80;
            _loc4_.var_81 = param2;
            _loc4_.taskAction = param1;
            _loc4_.var_82 = param3;
            this.var_78.push(_loc4_);
            if(this.var_78.length == 1)
            {
               class_4.method_9.stage.addEventListener(Event.ENTER_FRAME,this.method_121);
            }
         }
      }
      
      public function method_124(param1:class_48) : Boolean
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_78)
         {
            if(_loc2_.taskAction == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function method_77(param1:class_48) : void
      {
         var _loc2_:int = this.var_78.length - 1;
         while(_loc2_ >= 0)
         {
            if(this.var_78[_loc2_].taskAction == param1)
            {
               param1.dispose();
               this.var_78.splice(_loc2_,1);
               if(this.var_78.length == 0)
               {
                  class_4.method_9.stage.removeEventListener(Event.ENTER_FRAME,this.method_121);
               }
            }
            _loc2_--;
         }
      }
   }
}

import package_16.class_48;

class class_25
{
    
   
   private var var_80:uint;
   
   private var var_79:uint;
   
   private var var_81:uint;
   
   private var taskAction:class_48;
   
   private var var_82:Boolean;
   
   function class_25()
   {
      super();
   }
}
