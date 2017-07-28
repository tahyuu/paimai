package package_29
{
   class class_150 extends class_130
   {
       
      
      var init:class_115;
      
      var name:String;
      
      function class_150(param1:String, param2:class_115 = null)
      {
         super();
         this.name = param1;
         this.init = param2;
      }
      
      override public function getAny() : Object
      {
         var _loc1_:Object = init == null?null:init.getAny();
         class_118.method_576(name,_loc1_);
         return _loc1_;
      }
   }
}
