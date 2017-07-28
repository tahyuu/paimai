package zebra.directEvent
{
   import package_16.class_48;
   import package_3.class_4;
   
   class DirectEventSendAction extends class_48
   {
       
      
      private var var_92:DirectEventListenerPool;
      
      private var var_147:String;
      
      private var var_151:DirectEventParameter;
      
      private var var_150:String;
      
      function DirectEventSendAction(param1:DirectEventListenerPool, param2:String, param3:DirectEventParameter, param4:String)
      {
         this.var_92 = param1;
         this.var_147 = param2;
         this.var_150 = param4;
         param3.name_10 = param2;
         param3.name_6 = param4;
         this.var_151 = param3;
         super();
      }
      
      override public function execute() : void
      {
         var _loc2_:* = null;
         super.execute();
         var _loc1_:int = this.var_92.method_250(this.var_150);
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            try
            {
               if(this.var_92.method_134(this.var_150)[_loc3_] == this.var_147)
               {
                  if(this.var_92.method_135(this.var_150)[_loc3_] is Function)
                  {
                     _loc2_ = "Function";
                     this.var_92.method_135(this.var_150)[_loc3_](this.var_151);
                  }
                  if(this.var_92.method_135(this.var_150)[_loc3_] is DirectEventAction)
                  {
                     _loc2_ = "DirectEventAction";
                     DirectEventAction(this.var_92.method_135(this.var_150)[_loc3_]).var_152 = this.var_151;
                     DirectEventAction(this.var_92.method_135(this.var_150)[_loc3_]).execute();
                  }
                  if(!class_4.method_22)
                  {
                  }
               }
            }
            catch(e:*)
            {
            }
            _loc3_++;
         }
         this.finish();
      }
      
      public function get name_10() : String
      {
         return this.var_147;
      }
      
      public function get method_252() : DirectEventParameter
      {
         return this.var_151;
      }
      
      public function get name_6() : String
      {
         return this.var_150;
      }
      
      public function set name_6(param1:String) : void
      {
         this.var_150 = param1;
      }
   }
}
