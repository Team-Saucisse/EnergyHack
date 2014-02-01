<DockPanel>
  <DockPanel.Children>
    [%
    if (TypedObject.IsSet)
    {
    ViewProperty prop = (ViewProperty)(TypedObject.BaseObject); 
    string ControlName = Producer.CreateRendererUserControl(Context, TypedObject, RendererType, prop.Entity.Name + prop.Name);
    %]
    <nsRendererControl:[%=ControlName%] DataContext="{Binding Path=.}" Focusable="False"/>
    [%}
    else if (TypedObject.IsEntity)
    {%]
    <Label Content="{Binding Path=[%=TypedObject.Name%], Mode=OneWay}" DockPanel.Dock="Left" />
    [%}%]
  </DockPanel.Children>
</DockPanel>
