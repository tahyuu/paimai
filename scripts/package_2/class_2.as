package package_2
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import package_1.class_13;
   import package_1.class_15;
   import package_1.class_17;
   import package_3.class_4;
   
   public class class_2
   {
       
      
      public var var_18:String;
      
      public var iplist:Array;
      
      public var port:int = 0;
      
      public var changeCount:int = 0;
      
      private var var_19:int = 0;
      
      private var var_20:Boolean = false;
      
      private var var_17:class_5;
      
      public function class_2()
      {
         this.iplist = ["10.100.2.10"];
         this.var_17 = new class_5();
         super();
      }
      
      public function method_10() : void
      {
         this.var_20 = true;
      }
      
      public function resetAllowChangeCount() : void
      {
         this.var_20 = false;
         this.changeCount = 0;
      }
      
      public function get ip() : String
      {
         return this.iplist[this.var_19];
      }
      
      public function method_11() : void
      {
         var _loc1_:* = null;
         this.var_17.WriteLog2("Main.isReconnectBy31",String(Main.isReconnectBy31),"");
         this.var_17.WriteLog2("changeCount",String(this.changeCount),"");
         if(Main.isReconnectBy31)
         {
            if(this.changeCount > 9)
            {
               Main.isReconnectBy31 = false;
               ExternalInterface.call("clearbidcookies");
               Main.var_1 = true;
               class_15(class_4.method_7.method_8(class_15)).socketControl.close();
               _loc1_ = new class_17(2);
               class_13.method_12(_loc1_);
            }
            else
            {
               this.var_19++;
               if(this.var_19 >= this.iplist.length)
               {
                  this.var_19 = 0;
               }
               §§push(this.changeCount + 1);
               if(!new MovieClip()["@doswf__s"])
               {
                  return;
               }
               _loc2_.changeCount = §§pop();
            }
         }
         else
         {
            §§push(this.var_19 + 1);
            if(!new MovieClip()["@doswf__s"])
            {
               return;
            }
            _loc2_.var_19 = §§pop();
            if(this.var_19 >= this.iplist.length)
            {
               this.var_19 = 0;
            }
         }
      }
   }
}
