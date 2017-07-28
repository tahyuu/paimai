package package_20
{
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class class_121 extends class_120
   {
       
      
      private var var_383:URLLoader;
      
      public function class_121(param1:class_89)
      {
         super(param1);
         this.var_383 = new URLLoader();
      }
      
      override public function load(param1:URLRequest) : void
      {
         super.load(param1);
         this.var_383.load(param1);
      }
      
      override public function get type() : String
      {
         return class_111.TEXT;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         try
         {
            this.var_383.close();
            return;
         }
         catch(error:*)
         {
            return;
         }
      }
      
      public function get method_445() : URLLoader
      {
         return this.var_383;
      }
      
      override public function get content() : *
      {
         return this.var_383.data;
      }
   }
}
