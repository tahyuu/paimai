package package_1
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   import package_3.class_4;
   import package_4.class_12;
   
   public class class_13 extends class_12
   {
      
      public static var var_46:Sprite;
       
      
      public var left_container:Sprite;
      
      public var right_container:Sprite;
      
      public var var_47:Sprite;
      
      private var var_48:Sprite;
      
      public function class_13()
      {
         super();
         this.x = 23;
         this.left_container = new Sprite();
         addChild(this.left_container);
         this.right_container = new Sprite();
         addChild(this.right_container);
         this.var_47 = new Sprite();
         this.var_47.x = 403;
         addChild(this.var_47);
         var_46 = new Sprite();
         var_46.x = 403;
         addChild(var_46);
         this.var_48 = new Sprite();
         this.var_48.addChild(new class_29());
         addChild(this.var_48);
         this.method_5();
      }
      
      public static function method_62() : void
      {
         var_46.removeChildren();
      }
      
      public static function method_12(param1:DisplayObject) : void
      {
         var_46.removeChildren();
         var_46.addChild(param1);
      }
      
      public function method_5() : void
      {
         class_4.method_18.method_63();
         this.right_container.addChild(new class_15());
         this.left_container.addChild(new class_34());
      }
      
      public function method_64(param1:String, param2:Boolean = false) : void
      {
         this.var_47.removeChildren();
         this.var_47.addChild(new class_36(param1,true,param2));
      }
      
      public function method_65(param1:int, param2:int = 0) : void
      {
         var value:int = param1;
         var time:int = param2;
         setTimeout(function():*
         {
            if(value == 0)
            {
               left_container.removeChildren();
               left_container.addChild(new class_34());
            }
            else
            {
               right_container.removeChildren();
               right_container.addChild(new class_15());
            }
         },time);
      }
   }
}
