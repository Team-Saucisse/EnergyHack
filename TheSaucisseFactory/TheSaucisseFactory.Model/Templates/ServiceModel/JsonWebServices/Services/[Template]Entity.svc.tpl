[%@ template enumerable='Producer.Project.Entities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), entity.ClrFullTypeName) + ".svc"' %]
<%@ServiceHost language="C#" Debug="true" Service="[%=entity.ServiceClrFullTypeName%]" Factory="System.ServiceModel.Activation.WebServiceHostFactory" %>		
	


