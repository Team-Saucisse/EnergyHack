[%
Property prop = (Property)(TypedObject.BaseObject);
string ControlName = Producer.CreateRendererUserControl(Context, TypedObject, RendererType, prop.Entity.Name + prop.Name);
%]<nsRendererControl:[%=ControlName%] DataContext="{Binding Path=.}" Grid.Column="1" Grid.Row="[%=currentRowNumber%]" Width="{Binding ElementName=[%=TypedObject.Name%]Border, Path=ActualWidth}"/>
