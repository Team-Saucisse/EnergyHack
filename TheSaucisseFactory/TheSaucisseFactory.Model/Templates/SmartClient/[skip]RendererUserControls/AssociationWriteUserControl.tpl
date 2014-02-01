[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Model" %]
[%@ namespace name="System" %]
[%@ namespace name="System.IO" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
[%@ namespace name="CodeFluent.Runtime.Utilities" %]
[%@ namespace name="CodeFluent.Producers.SmartClient" %]
[%
	string ObjectName = Path.GetFileNameWithoutExtension(TargetPath);
	TypedObject typedObject = (TypedObject)Context["TypedObject"];
%]
<UserControl x:Class="[%=Producer.Project.DefaultNamespace%].SmartClient.Controls.[%=ObjectName%]"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
	[%if ((typedObject.UIType == UIType.Relation) && 
		(typedObject.ChoiceMethod != null) && 
		(typedObject.ProjectEntity != null  && 
		typedObject.ProjectEntity.Set != null))
		{
   %]xmlns:cf[%=typedObject.ProjectEntity.Set.Name%]="clr-namespace:[%=typedObject.ProjectEntity.Set.ProxyClrFullTypeName.Replace("."+typedObject.ProjectEntity.Set.Name, "")%];assembly=[%=Producer.ServiceModelAssembly%]"[%
		}%]>
    
    <UserControl.Resources>
	[%if ((typedObject.UIType == UIType.Relation) && 
		(typedObject.ChoiceMethod != null) && 
		(typedObject.ProjectEntity != null  && 
		typedObject.ProjectEntity.Set != null))
		{
%]		<ObjectDataProvider x:Key="[%=typedObject.ProjectEntity.Set.Name%][%=typedObject.ChoiceMethod.Name%]" MethodName="[%=typedObject.ChoiceMethod.Name%]" 
					ObjectType="{x:Type cf[%=typedObject.ProjectEntity.Set.Name%]:[%=typedObject.ProjectEntity.Set.Name%]}"/>[%
		}%]
    </UserControl.Resources>
	<DockPanel>
		 <Button Name="[%=typedObject.Name%]RelationEdit" Content="Edit..." Click="[%=typedObject.Name%]RelationEdit_Click"/>
	</DockPanel>
    <x:Code>
        <![CDATA[
        
		[%
			Property property = typedObject.BaseObject as Property;
			Entity entity = property.Entity;
     
		if (typedObject.IsSet)
		{   %]
		private void [%=property.Name%]RelationEdit_Click(object sender, RoutedEventArgs e)
        {
			[%=entity.ProxyClrFullTypeName%] AssociatedEntity = DataContext as [%=entity.ProxyClrFullTypeName%];
            CodeFluent.Runtime.SmartClient.RelationEditorWindow win = new CodeFluent.Runtime.SmartClient.RelationEditorWindow();
			AssociatedEntity.[%=property.Name%].RaiseCollectionChangedEvents = true;
			AssociatedEntity.[%=property.Name%].RaiseListChangedEvents= true;

		
            [%=property.ProjectSet.ItemEntity.Name%]View view = new [%=property.ProjectSet.ItemEntity.Name%]View();
			view.ViewList.ItemsSource = [%=property.ProjectSet.ProxyClrFullTypeName%].[%=property.ProjectSet.ItemEntity.LoadAllMethod.Name%]();
        	win.SetView(view);
        	    
			foreach ([%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%] selectedElement in AssociatedEntity.[%=property.Name%])
                view.ViewList.SelectedItems.Add(selectedElement);
                
        	win.Owner = Application.Current.MainWindow;
			win.WindowStartupLocation = WindowStartupLocation.CenterOwner;        
			win.Title = "[%=property.Name%] Relation Editor";
			
			bool? result = win.ShowDialog();
		
			if (result != null && result == true)
			{
				System.Collections.Generic.List<[%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%]> toRemove = new System.Collections.Generic.List<[%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%]>();
                foreach ([%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%] item in AssociatedEntity.[%=property.Name%])
                {
                    if (!view.ViewList.SelectedItems.Contains(item))
                    {
                        toRemove.Add(item);
                    }
                }
                foreach ([%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%] item in toRemove)
                {
                    AssociatedEntity.[%=property.Name%].Remove(item);
                    item.Save();                            
                }

                foreach ([%=property.ProjectSet.ItemEntity.ProxyClrFullTypeName%] selectedElement in view.ViewList.SelectedItems)
                {
                    if (!AssociatedEntity.[%=property.Name%].Contains(selectedElement))
                    {
                        AssociatedEntity.[%=property.Name%].Add(selectedElement);
                        selectedElement.Save();
                    }
                }
			}
			else if (result != null && result == false)
			{
			
			}
			return;
        }
        [%}%]
        
        
        public [%=ObjectName%]()
        {
            InitializeComponent();
        }
        ]]>
    </x:Code>
</UserControl>
