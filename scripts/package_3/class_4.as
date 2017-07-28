package package_3
{
   import flash.display.MovieClip;
   import flash.display.Stage;
   import flash.system.ApplicationDomain;
   import package_10.class_21;
   import package_11.class_23;
   import package_12.class_26;
   import package_13.class_27;
   import package_4.class_24;
   import package_8.class_19;
   import package_8.class_22;
   import package_9.class_20;
   import zebra.directEvent.DirectEventManager;
   import zebra.directEvent.class_18;
   
   public class class_4
   {
      
      private static var var_21:Boolean;
      
      private static var var_22:class_20;
      
      private static var var_23:class_21;
      
      private static var var_24:class_19;
      
      private static var var_25:class_23;
      
      private static var var_26:class_24;
      
      private static var var_27:class_18;
      
      private static var var_28:class_22;
      
      private static var var_29:class_26;
      
      private static var var_30:Boolean;
      
      private static var var_31:class_27;
       
      
      public function class_4(param1:Stage)
      {
         super();
         var_25 = new class_23();
         var_25.method_2();
         var_23 = new class_21(param1);
         var_26 = new class_24();
         var_22 = new class_20();
         var_24 = new class_19(param1);
         var_27 = new DirectEventManager();
         §§push();
         §§push();
         if(!new MovieClip()["@doswf__s"])
         {
            return;
         }
         §§pop().var_28 = new §§pop().class_22();
         var_29 = new class_26();
         var_31 = new class_27();
         var_30 = true;
         var_21 = true;
      }
      
      public static function get method_14() : Boolean
      {
         return var_21;
      }
      
      public static function get method_7() : class_20
      {
         return var_22;
      }
      
      public static function get method_15() : ApplicationDomain
      {
         return var_23.stage.loaderInfo.applicationDomain;
      }
      
      public static function get method_9() : class_21
      {
         return var_23;
      }
      
      public static function get method_16() : class_26
      {
         return var_29;
      }
      
      public static function get method_1() : class_23
      {
         return var_25;
      }
      
      public static function get method_17() : class_18
      {
         return var_27;
      }
      
      public static function get method_18() : class_24
      {
         return var_26;
      }
      
      public static function get method_19() : class_19
      {
         return var_24;
      }
      
      public static function get method_20() : class_22
      {
         return var_28;
      }
      
      public static function get method_21() : class_27
      {
         return var_31;
      }
      
      public static function get method_22() : Boolean
      {
         return false;
      }
   }
}
