﻿[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + ".aspx.designer" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace [%=Producer.WebNamespace(entity)%] {
    
    
    public partial class [%=entity.Name%] {
    }
}