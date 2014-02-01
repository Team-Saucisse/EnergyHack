[%@ template language="CSharp" output="false" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Model.UI.ControlDefinitions" %]
[%@ namespace name="CodeFluent.Producers.CodeDom.UI" %]
[%@ namespace name="System.IO" %]
[%
if ((Producer.WebServiceTypes & WebServiceTypes.PerEntity) == 0)
	return;
	
Entity entity = null;
if (Context["inTemplate"] == null)
{
	Context["inTemplate"] = true; // anything would do, other than null
	foreach(Entity e in Producer.Project.Entities)
	{
		if (!CodeFluent.Producers.CodeDom.UI.Web.WebServiceProducer.IsEnabled(e))
			continue;
			
		// build a new target path & re-run ourselves
		string targetPath = Path.Combine(
			Path.GetDirectoryName(TargetPath),
			Path.GetFileName(TargetPath).Replace("entity", e.ClrFullTypeName));
		using (GeneratedFile file = new GeneratedFile(Producer.Project, targetPath))
		{
			if ((file.HasBeenChanged) && ((e.ProductionFlags & ProductionFlags.Overwrite) == 0))
			{
				Producer.RaiseProduction(Producer, file.CreateFileSkipEvent("entity.asmx"));
				continue;
			}

			// note: we don't care about the output="false" here
			Producer.RaiseProduction(Producer, ProductionEventArgs.CreateFileTemplateGenerateEvent(targetPath, Template.FilePath));
			file.Open(Producer, Producer.OutputEncoding);
			
			// add the entity to the context
			Context["entity"] = e;
			
			// update targetPath
			Context["TargetPath"] = targetPath;
			
			// go recursive, and this will jump to the else part of this file
			Template.Run(file.Writer, Context);
		}
	}
}
else
{
	entity = (Entity)Context["entity"];
%]<%@ WebService Class="[%=Producer.GetFullClassName(entity.Name)%]Service" %>[%}%]
