package package_16
{
   import flash.events.EventDispatcher;
   import package_19.class_52;
   
   public class class_48 extends EventDispatcher implements class_47
   {
      
      static var var_123:int = 0;
       
      
      private var var_124:String;
      
      private var var_125:Boolean;
      
      private var var_126:Boolean;
      
      var var_127:class_88;
      
      public function class_48()
      {
         super();
         this.var_124 = String(var_123++);
      }
      
      public function get method_207() : Boolean
      {
         return this.var_125;
      }
      
      public function get method_208() : Boolean
      {
         return this.var_126;
      }
      
      public function finish() : void
      {
         this.var_126 = true;
         this.dispatchEvent(new class_52(class_52.COMPLETE));
      }
      
      function method_209() : void
      {
      }
      
      public function set id(param1:String) : void
      {
         this.var_124 = param1 + "-" + this.var_124;
      }
      
      public function get id() : String
      {
         return this.var_124;
      }
      
      public function get package_17() : class_88
      {
         return this.var_127;
      }
      
      public function execute() : void
      {
         this.var_125 = true;
         this.var_126 = false;
      }
      
      public function dispose() : void
      {
         this.dispatchEvent(new class_52(class_52.DISPOSE));
      }
      
      public function stop() : void
      {
         this.dispatchEvent(new class_52(class_52.STOP));
      }
   }
}
