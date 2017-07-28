package package_7
{
   import flash.display.MovieClip;
   import package_22.class_71;
   import package_22.class_74;
   
   public dynamic class class_28 extends MovieClip
   {
       
      
      public var closeBut:MovieClip;
      
      public var localSaveBut:class_71;
      
      public var log:class_74;
      
      public var sentLogDataBut:class_71;
      
      public function class_28()
      {
         super();
         this.method_140();
         this.method_141();
      }
      
      function method_140() : *
      {
         try
         {
            this.sentLogDataBut["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.sentLogDataBut.method_142 = false;
         this.sentLogDataBut.enabled = true;
         this.sentLogDataBut.label = "提交到服务器";
         this.sentLogDataBut.labelPlacement = "right";
         this.sentLogDataBut.selected = false;
         this.sentLogDataBut.toggle = false;
         this.sentLogDataBut.visible = true;
         try
         {
            this.sentLogDataBut["componentInspectorSetting"] = false;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      function method_141() : *
      {
         try
         {
            this.localSaveBut["componentInspectorSetting"] = true;
         }
         catch(e:Error)
         {
         }
         this.localSaveBut.method_142 = false;
         this.localSaveBut.enabled = true;
         this.localSaveBut.label = "保持到本地";
         this.localSaveBut.labelPlacement = "right";
         this.localSaveBut.selected = false;
         this.localSaveBut.toggle = false;
         this.localSaveBut.visible = true;
         try
         {
            this.localSaveBut["componentInspectorSetting"] = false;
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
   }
}
