[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%foreach(Command command in Source){%]
<input type="submit" class="form-button" value="[%=command.DisplayName%]" />
[%}%]