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
  xmlns:sys="clr-namespace:System;assembly=mscorlib"
  xmlns:cf[%=typedObject.ProjectEnumeration.Name%]="clr-namespace:[%=typedObject.ProjectEnumeration.ProxyClrFullTypeName.Replace("."+typedObject.ProjectEnumeration.Name, "")%];assembly=[%=Producer.ServiceModelAssembly%]"
  xmlns:cftools="clr-namespace:CodeFluent.Runtime.SmartClient">
  <UserControl.Resources>
    <ObjectDataProvider x:Key="[%=typedObject.ProjectEnumeration.Name%]Datas" MethodName="GetNames"
									ObjectType="{x:Type sys:Enum}">
      <ObjectDataProvider.MethodParameters>
        <x:Type TypeName="cf[%=typedObject.ProjectEnumeration.Name%]:[%=typedObject.ProjectEnumeration.Name%]"/>
      </ObjectDataProvider.MethodParameters>
    </ObjectDataProvider>
    <cftools:EnumerationIntConverter x:Key="EnumConverter"/>
  </UserControl.Resources>
  <DockPanel>
    <DockPanel.Children>
      <ComboBox ItemsSource="{Binding  Source={StaticResource [%=typedObject.ProjectEnumeration.Name%]Datas}}"
			    SelectedIndex="{Binding Path=[%=typedObject.Name%], Converter={StaticResource EnumConverter}}"/>
    </DockPanel.Children>
  </DockPanel>

  <x:Code>
    <![CDATA[
        public [%=ObjectName%]()
        {
            InitializeComponent();
        }
        ]]>
  </x:Code>
</UserControl>