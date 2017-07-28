package package_2
{
   import flash.display.MovieClip;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import package_14.class_30;
   import package_3.class_4;
   import package_4.class_6;
   import package_5.class_14;
   import package_5.class_31;
   
   public class class_7 extends class_6
   {
       
      
      public var var_33:String;
      
      public var var_34 = "0";
      
      public var var_35;
      
      public var var_36;
      
      public var bidnumber:String = "70000004";
      
      public var clientId:String = "4d3d87126d5446248c44ff0f33cc75b3";
      
      public var var_37:String = "";
      
      public var name_1:String = "1.0";
      
      public var var_38:String = "shcarbid";
      
      public var key:ByteArray;
      
      public var var_32:class_8;
      
      public var logappliction:class_5;
      
      public var var_39:String = "";
      
      public function class_7()
      {
         this.key = new ByteArray();
         this.var_32 = new class_8(Main.var_5);
         §§push(this);
         §§push();
         if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
         {
            return;
         }
         §§pop().logappliction = new §§pop().class_5();
         super();
         class_4.method_7.method_26(this);
      }
      
      public function get uid() : String
      {
         return this.bidnumber;
      }
      
      public function get requestid() : String
      {
         return this.bidnumber + ".f" + this.var_39;
      }
      
      public function method_27() : String
      {
         var _loc1_:Date = new Date();
         this.var_39 = String(_loc1_.getHours()) + String(_loc1_.getMinutes()) + String(_loc1_.getSeconds()) + String(_loc1_.getMilliseconds());
         return this.var_39;
      }
      
      public function data() : String
      {
         return "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\"}";
      }
      
      public function get method_28() : class_31
      {
         this.method_27();
         this.var_37 = class_30.method_29(this.clientId + this.bidnumber + this.name_1 + this.requestid + this.name_1 + this.var_39).toLowerCase();
         var _loc1_:class_31 = new class_31();
         var _loc2_:* = "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\"}";
         var _loc3_:String = this.var_32.method_30(_loc2_);
         var _loc4_:String = this.var_32.method_31(_loc3_);
         _loc1_.method_32(_loc3_);
         this.logappliction.method_23("投标板块","上线1-1",this.requestid);
         return _loc1_;
      }
      
      public function get method_33() : class_31
      {
         this.method_27();
         var _loc1_:class_31 = new class_31();
         var _loc2_:* = "{ts:\"" + this.var_39 + "\"}";
         var _loc3_:String = this.var_32.method_30(_loc2_);
         _loc1_.method_32(_loc3_);
         return _loc1_;
      }
      
      public function method_34(param1:String) : class_31
      {
         this.method_27();
         var _loc2_:class_31 = new class_31();
         §§push(param1);
         if(!new MovieClip()["@doswf__s"])
         {
            return;
         }
         var _loc3_:* = §§pop();
         this.var_37 = class_30.method_29(this.clientId + _loc3_ + this.var_39 + this.bidnumber + this.bidnumber + this.name_1);
         var _loc4_:* = "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\",request:{bidamount:" + _loc3_ + "}}";
         var _loc5_:String = this.var_32.method_30(_loc4_);
         _loc2_.method_32(_loc5_);
         this.logappliction.method_23("投标板块","请求校验码2-1",this.requestid);
         return _loc2_;
      }
      
      public function method_35(param1:String, param2:String, param3:String = "") : class_31
      {
         this.method_27();
         var _loc4_:class_31 = new class_31();
         var _loc5_:String = param1;
         var _loc6_:String = param2;
         if(param3 == "")
         {
            param2 = class_30.method_29(_loc6_ + this.bidnumber + _loc5_ + this.name_1 + this.bidnumber + this.clientId + this.var_39);
         }
         else
         {
            param2 = class_30.method_29(this.name_1 + this.clientId + this.requestid + this.bidnumber + _loc6_ + _loc5_ + param3 + this.var_39);
         }
         this.var_33 = this.requestid;
         var _loc7_:* = "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + param2 + "\",version:\"" + this.name_1 + "\",request:{bidamount:\"" + _loc5_ + "\",imagenumber:\"" + _loc6_ + "\"}}";
         var _loc8_:String = this.var_32.method_30(_loc7_);
         _loc4_.method_32(_loc8_);
         this.logappliction.method_23("投标板块","请求进入队列2-2",this.requestid);
         return _loc4_;
      }
      
      public function method_36(param1:* = null) : *
      {
         this.method_27();
         var _loc2_:String = class_14.method_5().toLowerCase();
         if(param1 != null)
         {
            _loc2_ = param1.toLowerCase();
         }
         §§push(this.uid + "." + this.var_39);
         if(!ApplicationDomain.currentDomain.hasDefinition("Ͳ"))
         {
            return;
         }
         var _loc3_:* = §§pop();
         var _loc4_:String = class_30.method_29(_loc3_ + this.var_39 + _loc2_ + this.name_1).toLowerCase();
         var _loc5_:* = "{requestid:\"" + _loc3_ + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + _loc4_ + "\",version:\"" + this.name_1 + "\",request:{}}";
         var _loc6_:String = _loc5_;
         var _loc7_:* = "{\"method\":\"getimagecode\",\"cmd\":\"" + escape(_loc6_) + "\"}";
         return _loc7_;
      }
      
      public function method_37() : *
      {
         this.method_27();
         var _loc1_:String = this.uid + "." + this.var_39;
         var _loc2_:String = class_30.method_29(_loc1_ + this.var_39 + this.name_1).toLowerCase();
         var _loc3_:* = "{requestid:\"" + _loc1_ + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + _loc2_ + "\",version:\"" + this.name_1 + "\"}";
         var _loc4_:String = _loc3_;
         var _loc5_:* = "{\"method\":\"getimagecode\",\"cmd\":\"" + escape(_loc4_) + "\"}";
         return _loc5_;
      }
      
      public function method_38(param1:String, param2:*) : String
      {
         this.method_27();
         var _loc3_:String = this.uid + "." + this.var_39;
         var _loc4_:String = param1;
         param1 = class_30.method_29(this.bidnumber + this.clientId + _loc4_ + _loc3_ + this.var_39 + param2 + this.name_1).toLowerCase();
         var _loc5_:* = "{requestid:\"" + _loc3_ + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + param1 + "\",version:\"" + this.name_1 + "\",request:{uniqueid:\"" + param2 + "\",bidnumber:\"" + this.bidnumber + "\",imagenumber:\"" + _loc4_ + "\"}}";
         var _loc6_:String = _loc5_;
         var _loc7_:* = "{\"method\":\"bidcheck\",\"cmd\":\"" + escape(_loc6_) + "\"}";
         return _loc7_;
      }
      
      public function method_39(param1:*) : *
      {
         var _loc2_:String = param1;
         var _loc3_:* = "{\"cmd\":\"" + param1 + "\"}";
         return _loc3_;
      }
   }
}
