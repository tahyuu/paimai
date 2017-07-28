package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.system.ApplicationDomain;
   import package_1.class_1;
   import package_2.class_10;
   import package_2.class_3;
   import package_2.class_5;
   import package_2.class_7;
   import package_2.class_8;
   import package_2.class_9;
   import package_3.class_4;
   
   public class Main extends Sprite
   {
      
      public static var var_1:Boolean = false;
      
      public static var isReconnectBy31:Boolean = false;
      
      public static var clientui_version:String = "版本 : 7.7.1.0";
      
      public static var var_2:Number = 0;
      
      public static var var_3:Boolean = true;
      
      public static var var_4:String = "";
      
      public static var var_5:String = "ji!@p!a";
       
      
      public var var_6:class_5;
      
      public var var_7:class_8;
      
      public var var_13:Boolean = true;
      
      public function Main()
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         this.var_6 = new class_5();
         this.var_7 = new class_8(var_5);
         super();
         var _loc1_:String = "!local";
         if(loaderInfo["@doswf__u"].indexOf("file:///") != -1)
         {
            _loc1_ = "local";
         }
         §§push();
         §§push(this["@doswf__s"]);
         if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
         {
            return;
         }
         new §§pop().class_4(§§pop());
         class_4.method_1.method_2();
         if(class_4.method_1.method_3)
         {
            Main.clientui_version = "D" + Main.clientui_version;
         }
         §§push();
         if(!new MovieClip()["@doswf__s"])
         {
            return;
         }
         var _loc2_:class_9 = new §§pop().class_9();
         if(_loc1_ != "local")
         {
            _loc6_ = this["@doswf__s"].loaderInfo["@doswf__p"]["uid"];
            _loc2_.uid = _loc6_;
            _loc7_ = this["@doswf__s"].loaderInfo["@doswf__p"]["uname"];
            _loc2_.var_8 = _loc7_;
            _loc8_ = this["@doswf__s"].loaderInfo["@doswf__p"]["clientId"];
            _loc2_.clientid = _loc8_;
            _loc9_ = this["@doswf__s"].loaderInfo["@doswf__p"]["informationserverstr"];
            _loc2_.var_9 = _loc9_;
            _loc10_ = this["@doswf__s"].loaderInfo["@doswf__p"]["tradeserverstr"];
            _loc2_.var_10 = _loc10_;
            _loc11_ = this["@doswf__s"].loaderInfo["@doswf__p"]["webserverstr"];
            _loc2_.var_11 = _loc11_.split(",")[0];
            _loc12_ = this["@doswf__s"].loaderInfo["@doswf__p"]["lcserverstr"];
            _loc2_.var_12 = _loc12_;
            _loc13_ = this["@doswf__s"].loaderInfo["@doswf__p"]["auctype"];
            _loc2_.auctype = _loc13_;
            _loc14_ = this["@doswf__s"].loaderInfo["@doswf__p"]["pwd"];
            _loc2_.pwd = _loc14_;
         }
         else
         {
            _loc2_.clientid = "4d3d87126d5446248c44ff0f33cc75b3";
            _loc2_.uid = "53322676";
            _loc2_.var_10 = "10.100.2.10:8300";
            _loc2_.var_11 = "10.100.2.10".split(",")[0];
            _loc2_.auctype = "0";
         }
         var_4 = _loc2_.uid;
         §§push();
         if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
         {
            return;
         }
         §§push(new §§pop().class_7());
         if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
         {
            return;
         }
         var _loc3_:* = §§pop();
         _loc3_.bidnumber = _loc2_.uid;
         _loc3_.clientId = _loc2_.clientid;
         §§push();
         if(!new MovieClip()["@doswf__s"])
         {
            return;
         }
         var _loc4_:class_3 = new §§pop().class_3();
         if(_loc1_ != "local")
         {
            _loc4_.iplist = this.method_4(_loc2_.var_10);
         }
         var _loc5_:class_10 = new class_10();
         if(_loc1_ != "local")
         {
            _loc5_.iplist = this.method_4(_loc2_.var_9);
            this.var_13 = ExternalInterface.call("flashCallingCheck");
         }
         if(this.var_13)
         {
            §§push();
            §§push();
            if(!new MovieClip()["@doswf__s"])
            {
               return;
            }
            §§pop().addChild(new §§pop().class_1());
         }
      }
      
      private function method_4(param1:String) : Array
      {
         var _loc2_:Array = param1.split(",");
         var _loc3_:Array = new Array();
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_.push(_loc2_[_loc4_].split(":")[0]);
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
