package package_29
{
   import r1.deval.parser.class_112;
   
   public class class_137 extends class_134
   {
       
      
      private var value:class_115;
      
      private var type:int;
      
      public function class_137(param1:int, param2:*, param3:int)
      {
         super(param3);
         this.type = param1;
         this.value = param2;
      }
      
      override public function method_567() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         switch(type)
         {
            case class_112.DEFAULT_NS:
               if(value != null)
               {
                  _loc2_ = value.getAny() as Namespace;
                  default xml namespace = _loc2_;
                  break;
               }
               break;
            case class_112.THROW:
               _loc1_ = value.getAny();
               if(_loc1_ is Error)
               {
                  throw _loc1_ as Error;
               }
               throw new Error(_loc1_.toString());
         }
      }
   }
}
