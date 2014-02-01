<CheckBox IsChecked="{Binding Path=[%=TypedObject.Name%], UpdateSourceTrigger=PropertyChanged,
												ValidatesOnDataErrors=True,
												ValidatesOnExceptions=True}"
												[% if (TypedObject.IsGenerated) {%]IsEnabled="False=" [%}%]Grid.Column="1"
												 Grid.Row="[%=currentRowNumber%]"
												 Language="[%=Culture.CultureInfo%]"
                        VerticalAlignment="Center"/>