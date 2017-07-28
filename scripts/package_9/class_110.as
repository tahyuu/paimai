package package_9
{
   import package_19.AssetLoaderEvent;
   import package_20.class_124;
   import package_20.class_57;
   
   class class_110
   {
       
      
      private var var_309:class_57;
      
      function class_110(param1:class_57)
      {
         super();
         this.var_309 = param1;
         if(this.var_309.state == class_124.const_31)
         {
            this.var_309.loader.completeHandler(null);
         }
         if(this.var_309.state == class_124.const_29 || this.var_309.state == class_124.const_30)
         {
            this.var_309.loader.addEventListener(AssetLoaderEvent.COMPLETE,this.completeHandler);
         }
      }
      
      private function completeHandler(param1:AssetLoaderEvent) : void
      {
         this.var_309.loader.removeEventListener(AssetLoaderEvent.COMPLETE,this.completeHandler);
         this.var_309.loader.completeHandler(null);
      }
   }
}
