package package_20
{
   import flash.net.URLRequest;
   import zebra.directEvent.DirectEventParameter;
   
   public class class_120 extends DirectEventParameter implements class_57
   {
       
      
      private var var_380:Object;
      
      private var var_381:int;
      
      private var var_382:URLRequest;
      
      private var var_379:class_89;
      
      public function class_120(param1:class_89)
      {
         super();
         this.var_379 = param1;
      }
      
      public function get name_7() : URLRequest
      {
         return this.var_382;
      }
      
      public function get loader() : class_89
      {
         return this.var_379;
      }
      
      public function get type() : String
      {
         return "";
      }
      
      public function load(param1:URLRequest) : void
      {
         this.var_382 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get content() : *
      {
         return null;
      }
      
      public function get method_220() : Object
      {
         return this.var_380;
      }
      
      public function set method_220(param1:Object) : void
      {
         this.var_380 = param1;
      }
      
      public function get state() : int
      {
         return this.var_381;
      }
      
      public function set state(param1:int) : void
      {
         this.var_381 = param1;
      }
      
      public function get key() : String
      {
         return this.var_382.url;
      }
   }
}
