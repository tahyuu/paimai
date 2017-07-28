package package_1
{
   import flash.events.MouseEvent;
   import package_18.class_50;
   import package_2.class_9;
   import package_3.class_4;
   import package_7.class_16;
   
   public class class_17 extends class_16
   {
       
      
      public function class_17(param1:*)
      {
         super();
         switch(param1)
         {
            case 1:
               this.myPriceResult.text = "该投标号已在其他地方登录，请检查投标号并重新登录。";
               break;
            case 2:
               this.myPriceResult.text = "您与服务器的连接已经断开，请重新登录";
         }
         okBut.addEventListener(MouseEvent.CLICK,this.closeHandler);
      }
      
      private function closeHandler(param1:MouseEvent) : void
      {
         this.parent.removeChild(this);
         var _loc2_:class_9 = class_9(class_4.method_7.method_76(class_9));
         if(!class_4.method_1.method_3)
         {
            if(_loc2_.auctype == "0")
            {
               class_50.method_83("http://" + _loc2_.var_11 + "/bid/");
            }
            else
            {
               class_50.method_83("http://" + _loc2_.var_11 + "/pubbid/");
            }
         }
      }
   }
}
