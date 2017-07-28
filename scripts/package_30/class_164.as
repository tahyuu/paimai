package package_30
{
   import flash.utils.getDefinitionByName;
   
   public class class_164
   {
       
      
      protected var _class:Class;
      
      protected var var_424;
      
      protected var var_423:XML;
      
      protected var _names:Vector.<String>;
      
      public function class_164(param1:*, param2:XML)
      {
         super();
         this.var_424 = param1;
         this._class = getDefinitionByName(class_144.method_623(this.var_424)) as Class;
         this.var_423 = param2;
         this._names = new Vector.<String>();
      }
      
      public function get names() : Vector.<String>
      {
         return this._names;
      }
   }
}
