﻿[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
Entity entity = Source.Project.Entities[Source.ClrFullTypeName];
if (entity == null) entity = Source.Project.Sets[Source.ClrFullTypeName].ItemEntity;
if (entity.IsLightWeight) {WriteLightWeight(Source, entity);} else {%]<asp:DropDownList runat="server" ID="[%=GetId(Source)%]" />[%}%]