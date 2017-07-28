package package_29
{
   import flash.system.ApplicationDomain;
   
   public class class_135 extends class_134
   {
       
      
      private var var_410:Array;
      
      public function class_135(param1:Array, param2:int)
      {
         super(param2);
         this.var_410 = param1;
      }
      
      override public function method_567() : void
      {
         var var_411:String = null;
         var x:* = undefined;
         var var_412:ApplicationDomain = ApplicationDomain.currentDomain;
         for each(var_411 in var_410)
         {
            try
            {
               x = var_412.getDefinition(var_411);
               if(x != null && x is Class)
               {
                  class_118.method_430(x as Class,var_411);
                  continue;
               }
               throw new class_141("msg.rt.no.class");
            }
            catch(e:Error)
            {
               throw new class_141("msg.rt.no.class");
            }
         }
      }
   }
}
