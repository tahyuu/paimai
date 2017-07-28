package package_8
{
   import flash.display.Stage;
   import flash.geom.Point;
   import package_16.class_48;
   
   class class_51 extends class_48
   {
       
      
      private var var_62:Stage;
      
      public var var_66:Point;
      
      function class_51(param1:Stage)
      {
         super();
         this.var_62 = param1;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.var_66 = new Point(this.var_62.mouseX,this.var_62.mouseY);
         this.finish();
      }
   }
}
