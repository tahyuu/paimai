package package_9
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.text.Font;
   import flash.utils.getQualifiedClassName;
   import package_18.class_59;
   import package_20.class_57;
   import package_3.class_4;
   
   public class class_20
   {
       
      
      private var var_67:class_60;
      
      private var var_68:class_54;
      
      private var var_69:class_58;
      
      private var var_70:class_55;
      
      private var var_71:class_56;
      
      private var var_72:class_59;
      
      public function class_20()
      {
         super();
         this.var_67 = new class_60(this);
         this.var_68 = new class_54(this);
         this.var_69 = new class_58(this);
         this.var_70 = new class_55(this);
         this.var_71 = new class_56(this);
         this.var_72 = new class_59("@zebraGame");
      }
      
      public function method_87(param1:*) : void
      {
         this.var_71.add(param1);
      }
      
      public function method_88(param1:*) : *
      {
         return this.var_71.method_89(param1);
      }
      
      public function method_90(param1:*) : void
      {
         this.var_71.method_91(param1);
      }
      
      public function method_61(param1:*) : void
      {
         this.var_67.add(param1);
      }
      
      public function method_26(param1:*) : void
      {
         var _loc2_:String = this.method_92(param1);
         if(this.var_67.method_93(_loc2_))
         {
            this.var_67.method_94(param1);
         }
         else
         {
            this.var_67.add(param1);
         }
      }
      
      public function method_8(param1:*) : *
      {
         return this.var_67.method_89(param1);
      }
      
      public function method_95(param1:*) : void
      {
         this.var_67.method_91(param1);
      }
      
      public function method_13(param1:*) : void
      {
         var _loc2_:String = this.method_92(param1);
         this.var_68.add(param1);
      }
      
      public function method_76(param1:*) : *
      {
         return this.var_68.method_89(param1);
      }
      
      public function method_96(param1:*) : void
      {
         this.var_68.method_91(param1);
      }
      
      public function method_97(param1:String, param2:Object) : void
      {
         this.var_69.add(param1,param2);
      }
      
      public function method_98(param1:String) : void
      {
         return this.var_69.method_91(param1);
      }
      
      public function method_99(param1:String) : *
      {
         return this.var_69.method_89(param1);
      }
      
      public function method_100(param1:String, param2:class_57) : void
      {
         this.var_70.add(param1,param2);
      }
      
      public function method_101(param1:String) : void
      {
         return this.var_70.method_91(param1);
      }
      
      public function method_102(param1:String) : class_57
      {
         return this.var_70.method_89(param1);
      }
      
      public function clear() : void
      {
         this.var_69.clear();
         this.var_68.clear();
         this.var_67.clear();
         this.var_70.clear();
      }
      
      private function method_92(param1:*) : String
      {
         return getQualifiedClassName(param1).split("::").join(".");
      }
      
      public function method_103(param1:String) : Class
      {
         return class_4.method_15.getDefinition(param1) as Class;
      }
      
      public function method_104(param1:String) : *
      {
         var _loc2_:Class = this.method_103(param1);
         return new _loc2_();
      }
      
      public function method_105(param1:String) : MovieClip
      {
         var _loc2_:Class = this.method_103(param1);
         return MovieClip(new _loc2_());
      }
      
      public function method_106(param1:String) : SimpleButton
      {
         var _loc2_:Class = this.method_103(param1);
         return SimpleButton(new _loc2_());
      }
      
      public function method_107(param1:String) : BitmapData
      {
         var _loc2_:Class = this.method_103(param1);
         return BitmapData(new _loc2_());
      }
      
      public function method_108(param1:String) : Font
      {
         var _loc2_:Class = this.method_103(param1) as Class;
         Font.registerFont(_loc2_);
         return Font(new _loc2_());
      }
      
      public function get method_109() : class_59
      {
         return this.var_72;
      }
   }
}
