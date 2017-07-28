package package_1
{
   import package_3.class_4;
   import package_7.class_78;
   
   public class class_79 extends class_78
   {
       
      
      public function class_79()
      {
         super();
         class_4.method_7.method_26(this);
         this.method_78(1);
      }
      
      public function method_78(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               light.gotoAndStop(1);
               networkText.visible = true;
               break;
            case 2:
               light.gotoAndStop(2);
               networkText.visible = false;
               break;
            case 3:
               light.gotoAndStop(3);
               networkText.visible = false;
         }
      }
   }
}
