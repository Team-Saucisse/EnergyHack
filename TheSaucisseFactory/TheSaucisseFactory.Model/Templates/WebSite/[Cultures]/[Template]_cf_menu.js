[%@ template language="CSharp"%]
[%@ namespace name="CodeFluent.Model.UI" %]
// ---------------------------------------------------------------------------
// JSMenuFluent V1.1 Copyright (c) 2005-2013 SOFTFLUENT S.A.S. All rights reserved.
// Please contact support@softfluent.com for any information.
// http://www.softfluent.com
// ---------------------------------------------------------------------------
[%
Writer.Write("var SFRootMenu ");
Writer.WriteLine(" =[");
foreach(Category category in Producer.Producer.Project.Categories)
{
	if (category.AllEntities.Count > 0)
	{
		bool first = true;
		foreach(Entity entity in category.AllEntities)
		{
			if (!entity.UIEnabled)
				continue;

			if (!entity.IsPersistent)
				continue;

			CodeFluent.Model.UI.ControlDefinitions.Window window = Producer.GetWindow(entity, "manager", "true");
			if (window == null)
			{
				continue;
			}
				
			if (!first)
			{
				Writer.WriteLine(",");
			}
			else
			{
				Writer.WriteLine("['" + category.GetMessageValue(Culture.CultureInfo).Replace("'", "\\'") + "', 'l1', null,");
				Writer.WriteLine("[");
				first = false;
			}

			Writer.Write("['" + entity.GetMessageValue(Culture.CultureInfo).Replace("'", "\\'") + "', 'l2', '" +
				window.Title + ".aspx"
				+ "', null]");
		}
		if (!first)
		{
			Writer.WriteLine("]],");
		}
	}
}
Writer.WriteLine("['', 'pad', 'default.aspx', null]");
Writer.WriteLine("];");
%]