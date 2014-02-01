[%@ template language="CSharp" output="false" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Model.UI.ControlDefinitions" %]
[%@ namespace name="System.IO" %]
[%
ControlDefinition controlDefinition = null;
if (Context["inTemplate"] == null)
{
	Context["inTemplate"] = true; // anything would do, other than null
	foreach(ControlDefinition cd in Producer.Application.ControlDefinitions)
	{			
		// we are not interested in windows
		Window w = cd as Window;
		if (w != null)
			continue;

		if (cd.Namespace == "asp")
			continue;

		// build a new target path 
		string targetPath = Path.Combine(
			Path.GetDirectoryName(TargetPath),
			Path.GetFileName(TargetPath).Replace("_CommonControl", cd.Name));

		// is there a mapping for this definition?
		if (!Producer.WriteControlDefinition(cd, Context, targetPath))
		{
			// no so we re-run ourselves
			using (GeneratedFile file = new GeneratedFile(Producer.Project, targetPath))
			{
				if ((file.HasBeenChanged) && ((cd.ProductionFlags & ProductionFlags.Overwrite) == 0))
				{
					Producer.RaiseProduction(Producer, file.CreateFileSkipEvent("_CommonControl.ascx"));
					continue;
				}
				// note: we don't care about the output="false" here
				Producer.RaiseProduction(Producer, ProductionEventArgs.CreateFileTemplateGenerateEvent(targetPath, Template.FilePath));
				file.Open(Producer, Producer.OutputEncoding);
				
				// add the control definition to the context
				Context["controlDefinition"] = cd;
				
				// update targetPath
				Context["TargetPath"] = targetPath;

				// go recursive, and this will jump to the else part of this file
				Template.Run(file.Writer, Context);
			}
		}
	}
}
else
{
	controlDefinition = (ControlDefinition)Context["controlDefinition"];
%]<%@ Control Language="C#" %>
<%@ Register TagPrefix="_cfwc" Namespace="CodeFluent.Runtime.Web.UI.WebControls" Assembly="CodeFluent.Runtime.Web"%>
[%Producer.WriteReferences(Writer, Culture, TargetPath, controlDefinition);
foreach(Control control in controlDefinition.Controls)
{
	Producer.WriteControl(Writer, Context, control, TargetPath);
}%]
[%}%]
