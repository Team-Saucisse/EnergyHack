[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%foreach(Command command in Source){%]
<asp:Button ID="button-[%=command.Name%]" class="form-button" style="font-size:80%" runat="server" CausesValidation="[%=command.CausesValidation%]" CommandName="[%=command.Name%]" Text="[%=command.DisplayName%]" />
[%}%]