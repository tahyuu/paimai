package package_1
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.net.SharedObject;
   import flash.system.ApplicationDomain;
   import flash.text.TextField;
   import package_3.class_4;
   import package_5.class_14;
   import package_6.errorInfo;
   
   public class class_1 extends Sprite
   {
       
      
      private var var_14:String;
      
      private var var_15:TextField;
      
      private var var_16:int = 0;
      
      public function class_1()
      {
         this.var_14 = class_14.method_5();
         this.var_15 = new TextField();
         super();
         var _loc1_:SharedObject = SharedObject.getLocal("browserSO");
         _loc1_.data["uuid"] = this.var_14;
         _loc1_.flush();
         addChild(new class_13());
         addEventListener(Event.ENTER_FRAME,this.method_6);
      }
      
      private function method_6(param1:Event) : void
      {
         var _loc3_:* = null;
         this.var_16++;
         if(this.var_16 % 60 != 0)
         {
            return;
         }
         var _loc2_:SharedObject = SharedObject.getLocal("browserSO");
         this.var_15.text = _loc2_.data["uuid"] + "<<>>" + this.var_14 + ">>" + Math.random();
         if(_loc2_.data["uuid"] != this.var_14)
         {
            removeEventListener(Event.ENTER_FRAME,this.method_6);
            Main.var_1 = true;
            ExternalInterface.call("clearbidcookies");
            removeChildren();
            class_15(class_4.method_7.method_8(class_15)).socketControl.close();
            §§push();
            if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
            {
               return;
            }
            _loc3_ = new §§pop().errorInfo();
            _loc3_.x = 25;
            class_4.method_9.stage.addChild(_loc3_);
         }
      }
   }
}
