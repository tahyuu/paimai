package package_20
{
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.net.URLRequest;
   import package_9.class_102;
   
   public class class_123 extends class_120
   {
       
      
      private var var_383:Loader;
      
      public function class_123(param1:class_89)
      {
         super(param1);
         this.var_383 = new Loader();
      }
      
      override public function load(param1:URLRequest) : void
      {
         super.load(param1);
         this.var_383.load(param1,class_102.method_422);
      }
      
      override public function get content() : *
      {
         return this.var_383.content;
      }
      
      public function get contentLoaderInfo() : LoaderInfo
      {
         return this.var_383.contentLoaderInfo;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_383.unloadAndStop();
      }
      
      override public function get type() : String
      {
         return class_111.DISPLAYOBJECT;
      }
   }
}
