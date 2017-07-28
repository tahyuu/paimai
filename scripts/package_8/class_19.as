package package_8
{
   import flash.display.Stage;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import package_19.GameMouseEvent;
   import package_19.class_52;
   import package_3.class_4;
   
   public class class_19 extends EventDispatcher
   {
       
      
      private var var_61:Boolean;
      
      private var var_62:Stage;
      
      private var var_63:class_51;
      
      public var var_64:Point;
      
      public var var_65:Point;
      
      public function class_19(param1:Stage)
      {
         super();
         this.var_61 = true;
         this.var_62 = param1;
         this.var_63 = new class_51(this.var_62);
         this.var_63.addEventListener(class_52.COMPLETE,this.method_85);
         class_4.method_18.method_82(this.var_63);
      }
      
      public function dispose() : void
      {
         class_4.method_18.method_77(this.var_63);
      }
      
      private function method_85(param1:class_52) : void
      {
         var _loc2_:* = null;
         if(this.var_61)
         {
            if(this.var_64 == null && this.var_65 == null)
            {
               this.var_65 = class_51(param1.target).var_66;
            }
            else
            {
               this.var_64 = this.var_65;
               this.var_65 = class_51(param1.target).var_66;
               if(!this.var_65.equals(this.var_64))
               {
                  _loc2_ = new GameMouseEvent(GameMouseEvent.const_1);
                  _loc2_.var_64 = this.var_64;
                  _loc2_.var_65 = this.var_65;
                  this.dispatchEvent(_loc2_);
               }
            }
         }
      }
      
      public function get method_86() : Point
      {
         if(this.var_64 == null)
         {
            return new Point(0,0);
         }
         return new Point(this.var_65.x - this.var_64.x,this.var_65.y - this.var_64.y);
      }
      
      public function get enabled() : Boolean
      {
         return this.var_61;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.var_61 = param1;
         if(param1)
         {
            this.var_65 = new Point(this.var_62.mouseX,this.var_62.mouseY);
         }
         else
         {
            this.var_65 = null;
            this.var_64 = null;
         }
      }
      
      public function reset() : void
      {
         this.var_64 = new Point(this.var_62.mouseX,this.var_62.mouseY);
         this.var_65 = new Point(this.var_62.mouseX,this.var_62.mouseY);
      }
   }
}
