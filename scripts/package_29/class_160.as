package package_29
{
   public class class_160 extends class_130 implements class_128
   {
      
      private static var var_449:Object = {
         "Array":function(... rest):Array
         {
            var _loc3_:* = undefined;
            var _loc2_:* = [];
            for each(_loc3_ in rest)
            {
               _loc2_.push(_loc3_);
            }
            return _loc2_;
         },
         "Boolean":function(param1:*):Boolean
         {
            return Boolean(param1);
         },
         "int":function(param1:*):int
         {
            return int(param1);
         },
         "Number":function(param1:*):Number
         {
            return Number(param1);
         },
         "Object":function(param1:*):Object
         {
            return param1;
         },
         "String":function(param1:*):String
         {
            return String(param1);
         },
         "uint":function(param1:*):uint
         {
            return uint(param1);
         },
         "XML":function(param1:*):XML
         {
            return XML(param1);
         },
         "XMLList":function(param1:*):XMLList
         {
            return XMLList(param1);
         }
      };
      
      private static var var_450:Object;
       
      
      var var_302:class_115;
      
      var index;
      
      public function class_160(param1:class_115, param2:*)
      {
         super();
         this.var_302 = param1;
         this.index = param2;
      }
      
      private static function method_639() : void
      {
         var_450 = {
            "hasOwnProperty":function(param1:Object, param2:String):Boolean
            {
               return param1.hasOwnProperty(param2);
            },
            "isPrototypeOf":function(param1:Object, param2:Object):Boolean
            {
               return param1.isPrototypeOf(param2);
            },
            "toString":function(param1:Object):String
            {
               return param1.toString();
            },
            "valueOf":function(param1:Object):XML
            {
               return param1.valueOf();
            },
            "propertyIsEnumerable":function(param1:Object, param2:String):Boolean
            {
               return param1.propertyIsEnumerable(param2);
            },
            "setPropertyIsEnumerable":function(param1:Object, param2:String, param3:Boolean = true):void
            {
               param1.setPropertyIsEnumerable(param2,param3);
            },
            "addNamespace":function(param1:XML, param2:Object):XML
            {
               return param1.addNamespace(param2);
            },
            "appendChild":function(param1:XML, param2:Object):XML
            {
               return param1.appendChild(param2);
            },
            "childIndex":function(param1:XML):int
            {
               return param1.childIndex();
            },
            "inScopeNamespaces":function(param1:XML):Array
            {
               return param1.inScopeNamespaces();
            },
            "insertChildAfter":function(param1:XML, param2:Object, param3:Object):*
            {
               return param1.insertChildAfter(param2,param3);
            },
            "insertChildBefore":function(param1:XML, param2:Object, param3:Object):*
            {
               return param1.insertChildBefore(param2,param3);
            },
            "localName":function(param1:XML):Object
            {
               return param1.localName();
            },
            "name":function(param1:XML):Object
            {
               return param1.name();
            },
            "namespace":function(param1:XML, param2:String = null):*
            {
               return param1.namespace(param2);
            },
            "namespaceDeclarations":function(param1:XML):Array
            {
               return param1.namespaceDeclarations();
            },
            "nodeKind":function(param1:XML):String
            {
               return param1.nodeKind();
            },
            "prependChild":function(param1:XML, param2:Object):XML
            {
               return param1.prependChild(param2);
            },
            "removeNamespace":function(param1:XML, param2:Namespace):XML
            {
               return param1.removeNamespace(param2);
            },
            "replace":function(param1:XML, param2:Object, param3:XML):XML
            {
               return param1.replace(param2,param3);
            },
            "setChildren":function(param1:XML, param2:Object):XML
            {
               return param1.setChildren(param2);
            },
            "setLocalName":function(param1:XML, param2:String):void
            {
               param1.setLocalName(param2);
            },
            "setName":function(param1:XML, param2:String):void
            {
               param1.setName(param2);
            },
            "setNamespace":function(param1:XML, param2:Namespace):void
            {
               param1.setNamespace(param2);
            },
            "attribute":function(param1:*, param2:*):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).attribute(param2);
               }
               return (param1 as XMLList).attribute(param2);
            },
            "attributes":function(param1:*):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).attributes();
               }
               return (param1 as XMLList).attributes();
            },
            "child":function(param1:*, param2:Object):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).child(param2);
               }
               return (param1 as XMLList).child(param2);
            },
            "children":function(param1:*):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).children();
               }
               return (param1 as XMLList).children();
            },
            "comments":function(param1:*):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).comments();
               }
               return (param1 as XMLList).comments();
            },
            "contains":function(param1:*, param2:XML):Boolean
            {
               if(param1 is XML)
               {
                  return (param1 as XML).contains(param2);
               }
               return (param1 as XMLList).contains(param2);
            },
            "copy":function(param1:*):*
            {
               if(param1 is XML)
               {
                  return (param1 as XML).copy();
               }
               return (param1 as XMLList).copy();
            },
            "descendants":function(param1:*, param2:Object = "*"):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).descendants();
               }
               return (param1 as XMLList).descendants();
            },
            "elements":function(param1:*, param2:Object = "*"):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).elements();
               }
               return (param1 as XMLList).elements();
            },
            "hasComplexContent":function(param1:*):Boolean
            {
               if(param1 is XML)
               {
                  return (param1 as XML).hasComplexContent();
               }
               return (param1 as XMLList).hasComplexContent();
            },
            "hasSimpleContent":function(param1:*):Boolean
            {
               if(param1 is XML)
               {
                  return (param1 as XML).hasSimpleContent();
               }
               return (param1 as XMLList).hasSimpleContent();
            },
            "length":function(param1:*):int
            {
               if(param1 is XML)
               {
                  return (param1 as XML).length();
               }
               return (param1 as XMLList).length();
            },
            "normalize":function(param1:*):*
            {
               if(param1 is XML)
               {
                  return (param1 as XML).normalize();
               }
               return (param1 as XMLList).normalize();
            },
            "parent":function(param1:*):*
            {
               if(param1 is XML)
               {
                  return (param1 as XML).parent();
               }
               return (param1 as XMLList).parent();
            },
            "processingInstructions":function(param1:*, param2:String = "*"):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).processingInstructions(param2);
               }
               return (param1 as XMLList).processingInstructions(param2);
            },
            "text":function(param1:*):XMLList
            {
               if(param1 is XML)
               {
                  return (param1 as XML).text();
               }
               return (param1 as XMLList).text();
            },
            "toXMLString":function(param1:*):String
            {
               if(param1 is XML)
               {
                  return (param1 as XML).toXMLString();
               }
               return (param1 as XMLList).toXMLString();
            }
         };
      }
      
      function method_594(param1:Array) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         param1[0] = null;
         var _loc2_:Object = method_640();
         if(var_302 != null)
         {
            _loc4_ = var_302.getAny();
            if(_loc4_ == null)
            {
               throw new class_141("msg.call.on.null");
            }
            param1[0] = _loc4_;
            if(_loc4_ is XML || _loc4_ is XMLList)
            {
               param1[2] = true;
               if(var_450 == null)
               {
                  method_639();
               }
               _loc3_ = var_450[_loc2_];
            }
            else
            {
               _loc3_ = _loc4_[_loc2_];
            }
         }
         else
         {
            if(class_118.method_569())
            {
               if(var_450 == null)
               {
                  method_639();
               }
               _loc3_ = var_450[_loc2_] as Function;
               if(_loc3_ != null)
               {
                  param1[0] = class_118.method_581();
                  param1[2] = true;
               }
            }
            if(_loc3_ == null)
            {
               _loc3_ = var_449[_loc2_];
            }
            if(_loc3_ == null)
            {
               _loc3_ = class_118.method_568(_loc2_);
            }
         }
         if(_loc3_ == null)
         {
            throw new class_141("msg.rt.no.method");
         }
         param1[1] = _loc3_;
      }
      
      public function method_589() : Boolean
      {
         return delete var_302.getAny()[method_640()];
      }
      
      override public function getAny() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Object = method_640();
         if(var_302 == null)
         {
            return class_118.method_568(_loc1_);
         }
         _loc2_ = var_302.getAny();
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_[_loc1_];
      }
      
      function method_641() : Boolean
      {
         return index is class_115?Boolean(index.getBoolean()):Boolean(Boolean(index));
      }
      
      function method_640() : Object
      {
         return index is class_115?index.getAny():index;
      }
      
      public function method_590(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:Object = method_640();
         if(var_302 == null)
         {
            class_118.method_576(_loc2_,param1);
         }
         else
         {
            _loc3_ = var_302.getAny();
            if(_loc3_ != null)
            {
               _loc3_[_loc2_] = param1;
            }
            else
            {
               throw new class_141("msg.rt.set.to.null");
            }
         }
      }
   }
}
