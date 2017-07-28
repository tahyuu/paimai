package package_13
{
   import package_16.class_48;
   import package_3.class_4;
   import package_5.class_40;
   
   class class_93 extends class_48
   {
       
      
      private var var_137:Vector.<class_40>;
      
      private var var_31:class_27;
      
      private var var_251:int = 2;
      
      function class_93(param1:Vector.<class_40>, param2:class_27)
      {
         super();
         this.var_137 = param1;
         this.var_31 = param2;
      }
      
      override public function execute() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = 0;
         if(this.var_137.length >= this.var_251)
         {
            _loc1_ = this.var_251;
         }
         else
         {
            _loc1_ = this.var_137.length;
         }
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.var_137.shift();
            class_4.method_17.send(_loc3_.method_191 + "-" + _loc3_.method_192,new class_45(_loc3_,this.var_31),this.var_31.name_5);
            _loc2_++;
         }
      }
   }
}
