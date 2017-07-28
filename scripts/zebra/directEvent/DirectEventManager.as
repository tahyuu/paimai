package zebra.directEvent
{
   import package_19.class_52;
   import package_3.class_4;
   
   public class DirectEventManager implements class_18
   {
       
      
      private var var_92:DirectEventListenerPool;
      
      private var var_93:DirectEventDestroyPool;
      
      private var var_91:DirectEventScope;
      
      public function DirectEventManager()
      {
         super();
         this.var_91 = new DirectEventScope();
         this.var_92 = new DirectEventListenerPool(this.var_91);
         this.var_93 = new DirectEventDestroyPool(this.var_91,this.var_92);
      }
      
      public function receive(param1:String, param2:*, param3:String = "Global") : void
      {
         this.var_91.add(param3);
         this.var_92.add(param1,param2,param3);
      }
      
      public function method_133(param1:String = "Global") : Array
      {
         var _loc2_:Vector.<String> = this.var_92.method_134(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_92.method_135(param1);
         return [_loc2_,_loc3_];
      }
      
      public function send(param1:String, param2:DirectEventParameter = null, param3:String = "Global") : void
      {
         var _loc4_:* = null;
         if(param2 == null)
         {
            param2 = new DirectEventParameter();
         }
         if(this.var_91.method_136(param3) == null)
         {
            return;
         }
         if(this.var_92.method_137(param1,param3))
         {
            if(!class_4.method_22)
            {
            }
            _loc4_ = new DirectEventSendAction(this.var_92,param1,param2,param3);
            _loc4_.addEventListener(class_52.COMPLETE,this.method_138);
            _loc4_.execute();
         }
         else if(!class_4.method_22)
         {
         }
      }
      
      public function method_84(param1:String, param2:*, param3:String = "Global") : void
      {
         if(this.var_91.method_136(param3) == null)
         {
            return;
         }
         if(this.var_92.method_139(param1,param2,param3))
         {
            this.var_93.add(param1,param2,param3);
         }
      }
      
      private function method_138(param1:class_52) : void
      {
         var _loc2_:DirectEventSendAction = DirectEventSendAction(param1.target);
         this.var_93.method_91(_loc2_.name_6);
         _loc2_.removeEventListener(class_52.COMPLETE,this.method_138);
      }
   }
}
