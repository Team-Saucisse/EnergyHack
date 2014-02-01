<TextBox Style="{DynamicResource EditTextStyle}"  Text="{Binding Path=[%=TypedObject.Name%],
												UpdateSourceTrigger=PropertyChanged,
												ValidatesOnDataErrors=True,
												ValidatesOnExceptions=True}" 
												[% if (TypedObject.IsGenerated) {%]IsEnabled="False" [%}%]Grid.Column="1" 
												 Grid.Row="[%=currentRowNumber%]"
												 Language="[%=Culture.CultureInfo%]"
												 Width="{Binding ElementName=[%=TypedObject.Name%]Border, Path=ActualWidth}"/>