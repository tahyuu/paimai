package package_2
{
   import flash.utils.ByteArray;
   import package_14.class_30;
   import package_4.class_6;
   import package_5.class_14;
   import package_5.class_31;
   
   public class class_77 extends class_6
   {
       
      
      public var var_32:class_8;
      
      public var var_34 = "0";
      
      public var var_35;
      
      public var var_36;
      
      public var bidnumber:String = "70000004";
      
      public var clientId:String = "4d3d87126d5446248c44ff0f33cc75b3";
      
      public var var_37:String = "";
      
      public var name_1:String = "1.0";
      
      public var var_236:String = "shcarbid";
      
      public var var_235:ByteArray;
      
      public var var_39:String = "";
      
      public function class_77()
      {
         this.var_32 = new class_8(Main.var_5);
         this.var_235 = new ByteArray();
         super();
      }
      
      public function get uid() : String
      {
         return this.bidnumber;
      }
      
      public function get requestid() : String
      {
         return this.bidnumber + ".e" + this.var_39;
      }
      
      public function method_27() : void
      {
         var _loc1_:Date = new Date();
         this.var_39 = String(_loc1_.getHours()) + String(_loc1_.getMinutes()) + String(_loc1_.getSeconds()) + String(_loc1_.getMilliseconds());
      }
      
      public function data() : String
      {
         return "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\"}";
      }
      
      public function get method_28() : class_31
      {
         this.method_27();
         this.var_37 = class_30.method_29(this.bidnumber + this.clientId + this.requestid + this.var_39 + this.name_1).toLowerCase();
         var _loc1_:class_31 = new class_31();
         var _loc2_:* = "{requestid:\"" + this.requestid + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\"}";
         var _loc3_:String = this.var_32.method_30(_loc2_);
         _loc1_.method_32(_loc3_);
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
         var _loc3_:String = param1;
         this.var_37 = class_30.method_29(_loc3_ + this.bidnumber + this.clientId + this.requestid + this.var_39 + this.name_1);
         _loc2_.method_32("{requestid:" + this.requestid + ",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + this.var_37 + "\",version:\"" + this.name_1 + "\",request:{bidamount:" + _loc3_ + "}}");
         return _loc2_;
      }
      
      public function method_35(param1:String, param2:String) : class_31
      {
         this.method_27();
         var _loc3_:class_31 = new class_31();
         var _loc4_:String = param1;
         var _loc5_:String = param2;
         param2 = class_30.method_29(_loc4_ + this.bidnumber + this.clientId + _loc5_ + this.requestid + this.var_39 + this.name_1);
         _loc3_.method_32("{requestid:" + this.requestid + ",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + param2 + "\",version:\"" + this.name_1 + "\",request:{bidamount:\"" + _loc4_ + "\",imagenumber:\"" + _loc5_ + "\"}}");
         return _loc3_;
      }
      
      public function method_36() : *
      {
         this.method_27();
         var _loc1_:String = class_14.method_5().toLowerCase();
         var _loc2_:String = this.uid + "." + this.var_39;
         var _loc3_:String = class_30.method_29(_loc2_ + this.var_39 + _loc1_ + this.name_1).toLowerCase();
         var _loc4_:* = "{requestid:\"" + _loc2_ + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.uid + "\",checkcode:\"" + _loc3_ + "\",version:\"" + this.name_1 + "\",request:{uniqueid:\"" + _loc1_ + "\"}}";
         var _loc5_:* = "{\"method\":\"getimagecode\",\"cmd\":\"" + escape(_loc4_) + "\"}";
         return _loc5_;
      }
      
      public function method_38(param1:String) : String
      {
         this.method_27();
         var _loc2_:String = class_14.method_5().toLowerCase();
         var _loc3_:String = this.uid + "." + this.var_39;
         var _loc4_:String = param1;
         param1 = class_30.method_29(this.bidnumber + this.clientId + _loc4_ + _loc3_ + this.var_39 + _loc2_ + this.name_1).toLowerCase();
         var _loc5_:* = "{requestid:\"" + _loc3_ + "\",timestamp:\"" + this.var_39 + "\",bidnumber:\"" + this.bidnumber + "\",checkcode:\"" + param1 + "\",version:\"" + this.name_1 + "\",request:{uniqueid:\"" + _loc2_ + "\",bidnumber:\"" + this.bidnumber + "\",imagenumber:\"" + _loc4_ + "\"}}";
         var _loc6_:* = "{\"method\":\"bidcheck\",\"cmd\":\"" + escape(_loc5_) + "\"}";
         return _loc6_;
      }
   }
}
