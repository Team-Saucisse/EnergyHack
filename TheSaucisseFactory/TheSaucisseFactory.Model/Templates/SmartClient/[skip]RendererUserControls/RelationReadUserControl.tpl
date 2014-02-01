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
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml">
	<DockPanel>
	  <DockPanel.Children>
		<TextBlock>
		  <TextBlock Text="Count :" Style="{DynamicResource ViewTextBlockStyle}"/>
		  <TextBlock Text="{Binding Path=[%=typedObject.Name%].Count, Mode=OneWay}" Style="{DynamicResource ViewTextBlockStyle}"/>
		</TextBlock>
		<Button Content="Details" HorizontalAlignment="Right" Name="[%=typedObject.Name%]Details" Click="[%=typedObject.Name%]Details_Click"/>
	  </DockPanel.Children>
	</DockPanel>

    <x:Code>
        <![CDATA[
        
		private void [%=typedObject.Name%]Details_Click(object sender, RoutedEventArgs e)
		{
			[%ViewProperty property = typedObject.BaseObject as ViewProperty;
			  Entity entity = property.Entity;
			%]
			
			DependencyObject depObj = e.OriginalSource as DependencyObject;
			DependencyObject current = depObj;
			[%=entity.ProxyClrFullTypeName%] ClickedEntity = DataContext as [%=entity.ProxyClrFullTypeName%];
			[%=property.ProjectSet.ItemEntity.Name%]View view = new [%=property.ProjectSet.ItemEntity.Name%]View();	
			Binding b = new Binding();
            b.Path = new PropertyPath("[%=property.Name%]");
			b.Source = ClickedEntity;
			CodeFluent.Runtime.SmartClient.EditDialogWindow dlg = new CodeFluent.Runtime.SmartClient.EditDialogWindow();									
			dlg.setEditForm(view);
			dlg.Owner = Application.Current.MainWindow;
			dlg.WindowStartupLocation = WindowStartupLocation.CenterOwner;
			dlg.SetReadOnly();
			dlg.Title = "[%=ConvertUtilities.Decamelize(entity.Name)%] [%=property.Name%] Relation View";
			BindingOperations.ClearBinding(view.ViewList, ListView.ItemsSourceProperty);
			view.ViewList.SetBinding(ListView.ItemsSourceProperty, b);
			dlg.ShowDialog();
			return;
		}
    
        public [%=ObjectName%]()
        {
            InitializeComponent();
        }
        ]]>
    </x:Code>
</UserControl>
