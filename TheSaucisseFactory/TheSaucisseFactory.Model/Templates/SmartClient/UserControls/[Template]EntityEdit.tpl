﻿[%@ remark text="This file builds edition user controls for entities" %]
[%@ template language="CSharp" output="false" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model" %]
[%@ namespace name="CodeFluent.Runtime" %]
[%@ namespace name="System" %]
[%@ namespace name="System.IO" %]
[%@ namespace name="CodeFluent.Producers.SmartClient" %]
[%
if (!Context.Contains("inTemplate"))
{
	Context["inTemplate"] = null; // anything does it
	foreach(Entity e in Producer.Project.Entities)
	{
	
		if (e.UIEnabled && !e.IsLightWeight &&  e.IsPersistent)
		{

			string EntityName = e.Name;
			
			// build a new target path to re-run ourselves with a different file path
				string targetDirectory = Path.Combine(Path.GetDirectoryName(TargetPath), e.Namespace);
			
			string targetPath = Path.Combine(
				targetDirectory,
				Path.GetFileNameWithoutExtension(TargetPath).Replace("Entity", EntityName) + ".xaml.cs");

			// we prefer CF's generation wrapper object instead of raw .NET file objects
			using (GeneratedFile file = new GeneratedFile(Producer.Project, targetPath))
			{
				// check we can overwrite or not depending on node's production attributes
				if ((file.HasBeenChanged) && ((e.ProductionFlags & ProductionFlags.Overwrite) == 0))
				{
					// show some useful information
					Producer.RaiseProduction(Producer, file.CreateFileSkipEvent(e.ClrFullTypeName));
					continue;
				}

				// note: we don't care about the output="false" here
				Producer.RaiseProduction(Producer, ProductionEventArgs.CreateFileTemplateGenerateEvent(targetPath, Template.FilePath));
				file.Open(Producer, Producer.OutputEncoding);
				
				// add the type to the context
				Context["CurrentEntity"] = e;
				
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
	Entity entity = Context["CurrentEntity"] as Entity;
	if (entity != null)
	{%]//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:[%=System.Environment.Version%]
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System;
using System.IO;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CodeFluent.Runtime.SmartClient;


namespace [%=Producer.Project.DefaultNamespace %].SmartClient.Controls
{
    /// <summary>
    /// Interaction logic for [%=entity.Name%]Edit.xaml
    /// </summary>
    public partial class [%=entity.Name%]Edit : UserControl, IEntityEdit
    {
		private [%=entity.ProxyClrFullTypeName%] _associatedEntity;
		
		public [%=entity.ProxyClrFullTypeName%] AssociatedEntity
		{
			get 
			{
				return _associatedEntity;
			}
			set 
			{
				_associatedEntity = value;
				DataContext = _associatedEntity; 
			}
		}
		
        public [%=entity.Name%]Edit()
        {
            InitializeComponent();
        }
        
		public void ValidateFields()
		{
			[%foreach (Property property in entity.Properties)
			{
				if ((property.UIEnabled) && 
					(!property.IsNullable) && 
					(!property.IsGenerated) && 
					(property.IsValueType != UnknownBoolean.True))
				{%]
			if ( _associatedEntity.[%=property.Name%] == null)
			{
				throw new Exception("Field: [%=property.Name%] can not be null");
			}
				
				[%}
			}%]			
		
		}
		
		public void Save()
		{
			ValidateFields();
		
			[%foreach (Property property in entity.Properties)
			{
				if (property.IsBinaryLargeObject)
				{%]
			string [%=property.Name%]FileName = AssociatedEntity.[%=property.Name%].FileName;
				[%}
			}%]			
			bool result = AssociatedEntity.Save();				
			[% foreach (Property property in entity.Properties)
			{
				if (property.IsBinaryLargeObject)
				{%]
				if ([%=property.Name%]FileName != null && 
					(([%=property.Name%]FileName != AssociatedEntity.[%=property.Name%].FileName && result) || result == false) &&
					File.Exists([%=property.Name%]FileName))
				{
					AssociatedEntity.[%=property.Name%].Save([%=property.Name%]FileName);
				}
				[%}
			}%]	AssociatedEntity.Reload(CodeFluent.Runtime.CodeFluentReloadOptions.Everything);
		}
		
		
		public void Cancel()
		{
			AssociatedEntity.Reload(CodeFluent.Runtime.CodeFluentReloadOptions.Everything);
		}
    }
}


[%Producer.AddFileName(TargetPath);
	Producer.AddToGeneratedFiles(TargetPath);
	return;
	}
}%]