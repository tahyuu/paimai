package package_29
{
   class class_156 extends class_130
   {
       
      
      var var_446:class_115;
      
      var name:class_115;
      
      function class_156(param1:class_115, param2:class_115)
      {
         super();
         this.var_446 = param1;
         this.name = param2;
      }
      
      override public function getAny() : Object
      {
         return new QName(var_446.getAny() as Namespace,name.method_452());
      }
   }
}
