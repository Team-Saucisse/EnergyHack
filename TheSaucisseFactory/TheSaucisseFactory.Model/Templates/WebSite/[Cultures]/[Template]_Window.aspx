[%@ template language="CSharp" output="false" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model.UI" %]
[%@ namespace name="CodeFluent.Model.UI.ControlDefinitions" %]
[%@ namespace name="System.IO" %]
[%
Window window = null;
if (Context["inTemplate"] == null)
{
	Context["inTemplate"] = true; // anything would do, other than null
	foreach(ControlDefinition cd in Producer.Application.ControlDefinitions)
	{
		// we are only interested in windows
		Window w = cd as Window;
		if (w == null)
			continue;
			
		// master pages are handled by another template
		if (w.IsMaster)
			continue;
			
		// build a new target path & re-run ourselves
		string targetPath = Path.Combine(
			Path.GetDirectoryName(TargetPath),
			Path.GetFileName(TargetPath).Replace("_Window", w.Title));
		using (GeneratedFile file = new GeneratedFile(Producer.Project, targetPath))
		{
			if ((file.HasBeenChanged) && ((cd.ProductionFlags & ProductionFlags.Overwrite) == 0))
			{
				Producer.RaiseProduction(Producer, file.CreateFileSkipEvent("_Window.aspx"));
				continue;
			}

			// note: we don't care about the output="false" here
			Producer.RaiseProduction(Producer, ProductionEventArgs.CreateFileTemplateGenerateEvent(targetPath, Template.FilePath));
			file.Open(Producer, Producer.OutputEncoding);
			
			// add the window to the context
			Context["window"] = w;
			
			// update targetPath
			Context["TargetPath"] = targetPath;
			
			// go recursive, and this will jump to the else part of this file
			Template.Run(file.Writer, Context);
		}
	}
}
else
{
	window = (Window)Context["window"];
	Entity entity = window.Node as Entity;
	string masterAttribute = null;
	ContentWindow contentWindow = window as ContentWindow;
	if ((contentWindow != null) && (contentWindow.MasterWindow != null))
	{
		masterAttribute = "masterpagefile=\"" + contentWindow.MasterWindow.Title + ".master\"";
	}
%]<%@ Page Trace="[%=Producer.MustTracePages%]" Language="C#" responseEncoding="[%=Producer.OutputEncoding.WebName%]" uiCulture="[%=Culture.Name%]" culture="[%=Culture.Name%]" validateRequest="[%=Producer.MustValidateRequest(window)%]" [%Writer.Write(masterAttribute);%]%>
<%@ Register TagPrefix="_cfwc" Namespace="CodeFluent.Runtime.Web.UI.WebControls" Assembly="CodeFluent.Runtime.Web"%>
[%Producer.WriteReferences(Writer, Culture, TargetPath, window);%]
[%foreach(Control control in window.Controls)
{
	Producer.WriteControl(Writer, Context, control, TargetPath);
}%]
[%}%]
