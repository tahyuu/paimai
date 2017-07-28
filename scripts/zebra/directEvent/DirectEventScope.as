package zebra.directEvent
{
   import flash.utils.Dictionary;
   
   public class DirectEventScope
   {
       
      
      private var var_144:Dictionary;
      
      public function DirectEventScope()
      {
         super();
         this.var_144 = new Dictionary();
      }
      
      public function add(param1:String) : void
      {
         if(this.var_144[param1] == null)
         {
            this.var_144[param1] = new DirectEventScopePool();
         }
      }
      
      public function method_243(param1:String) : Boolean
      {
         return this.var_144[param1] != null;
      }
      
      public function method_136(param1:String) : DirectEventScopePool
      {
         return DirectEventScopePool(this.var_144[param1]);
      }
      
      public function method_91(param1:String) : void
      {
         delete this.var_144[param1];
      }
   }
}

class DirectEventScopePool
{
    
   
   private var var_145:DirectEventScopeModel;
   
   private var var_146:DirectEventScopeModel;
   
   function DirectEventScopePool()
   {
      super();
      this.var_145 = new DirectEventScopeModel();
      this.var_146 = new DirectEventScopeModel();
   }
   
   public function get method_244() : DirectEventScopeModel
   {
      return this.var_145;
   }
   
   public function get method_245() : DirectEventScopeModel
   {
      return this.var_146;
   }
}

class DirectEventScopeModel
{
    
   
   private var var_147:Vector.<String>;
   
   private var var_148:Array;
   
   function DirectEventScopeModel()
   {
      super();
      this.var_147 = new Vector.<String>();
      this.var_148 = new Array();
   }
   
   public function get method_246() : Vector.<String>
   {
      return this.var_147;
   }
   
   public function get method_247() : Array
   {
      return this.var_148;
   }
}
