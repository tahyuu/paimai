package package_1
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import package_7.class_35;
   
   public class class_36 extends class_35
   {
       
      
      private var otTimer:uint;
      
      public function class_36(param1:*, param2:Boolean = true, param3:Boolean = false)
      {
         var type:* = param1;
         var name_8:Boolean = param2;
         var name_9:Boolean = param3;
         super();
         switch(type)
         {
            case 1:
               this.myPriceResult.text = "输入价格不能为空";
               break;
            case 2:
               this.myPriceResult.text = "出价金额必须为100元的正整数倍";
               break;
            case 3:
               this.myPriceResult.text = "两次输入的出价金额不一致";
               break;
            case 4:
               this.myPriceResult.text = "校验码不能为空";
               break;
            case 5:
               this.myPriceResult.text = "图像校验码错误！";
               break;
            case 6:
               this.myPriceResult.text = "正在等待出价入列";
               break;
            case 7:
               this.myPriceResult.text = "没有正在举行的拍卖会，请注意拍卖公告！";
               break;
            case 8:
               this.myPriceResult.text = "出价成功";
               break;
            case 9:
               this.myPriceResult.text = "你的操作过于频繁，请稍后再尝试";
               break;
            case 10:
               this.myPriceResult.text = "拍卖会已结束！";
               break;
            case 11:
               this.myPriceResult.text = "拍卖会已终止！";
               break;
            case 12:
               this.myPriceResult.text = "拍卖会已暂停！";
               break;
            case 13:
               this.myPriceResult.text = "加价幅度必须为100元的整数倍";
               break;
            default:
               this.myPriceResult.text = String(type);
         }
         if(!name_9)
         {
            this.otTimer = setTimeout(this.method_171,15000);
         }
         this.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
         {
            clearTimeout(otTimer);
         });
         okBut.visible = name_8;
         okBut.addEventListener(MouseEvent.CLICK,this.method_172);
      }
      
      private function method_172(param1:MouseEvent) : void
      {
         this.parent.removeChild(this);
      }
      
      private function method_171() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}
