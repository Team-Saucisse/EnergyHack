[%
bool RelationLess = false;
if (Producer.GetTypedObjectRelation(TypedObject) == null)
{
  RelationLess = true;
}
if (TypedObject.IsSet)
{
	Property prop = (Property)(TypedObject.BaseObject); 
    string ControlName = Producer.CreateRendererUserControl(Context, TypedObject, RendererType, prop.Entity.Name + prop.Name);
    %]<nsRendererControl:[%=ControlName%] DataContext="{Binding Path=.}" Grid.Column="1" Grid.Row="[%=currentRowNumber%]" Width="{Binding ElementName=[%=TypedObject.Name%]Border, Path=ActualWidth}"/>

[%}
else if (TypedObject.IsEntity)
{
	if (!TypedObject.ProjectEntity.IsLightWeight)
	{
		Property prop = (Property)(TypedObject.BaseObject); 
	    string ControlName = Producer.CreateRendererUserControl(Context, TypedObject, RendererType, prop.Entity.Name + prop.Name);
	    %]<nsRendererControl:[%=ControlName%] DataContext="{Binding Path=.}" Grid.Column="1" Grid.Row="[%=currentRowNumber%]" Width="{Binding ElementName=[%=TypedObject.Name%]Border, Path=ActualWidth}"/>
	[%}
	
}
  // Write the default renderer in this case. 
else if (RelationLess == true)
{%]
  <TextBox Style="{DynamicResource EditTextStyle}" 
         Text="{Binding Path=[%=TypedObject.Name%]}" 
        [% if (TypedObject.IsGenerated) {%]IsEnabled="False" [%}%]
         Grid.Column="1" 
         Grid.Row="[%=currentRowNumber%]" Width="{Binding ElementName=[%=TypedObject.Name%]Border, Path=ActualWidth}"/>
[%}%]