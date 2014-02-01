[%@ template language="CSharp"%]
[%@ namespace name="CodeFluent.Model.UI"%]
<%@ Control Language="C#"%>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="cf-dark">&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
				<td class="cf-dark" height=2></td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><table width="100%" cellspacing="0" cellpadding="0" border="0" class="cf-footer">
			<tr valign="top">
				<td>[%=Producer.Project.AllMessages.GetMessageValue("web_footer_description", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]<br><br></td>
				<td nowrap align="right"><p>[%=Producer.Project.AllMessages.GetMessageValue("web_footer_copyright", Culture.CultureInfo, Producer.Project.DefaultNamespace)%]
				<br>[%foreach(Culture culture in Producer.Application.Cultures) {
						if (culture.Name == Culture.Name)
							continue;
						%]
					<br><a href="<%=CodeFluent.Runtime.Web.Utilities.UrlHelper.NewUrl("../[%=culture.Name%]/" + CodeFluent.Runtime.Web.Utilities.UrlHelper.Current.FileName)%>" style="font-weight:bolder">[%=culture.CultureInfo.NativeName%]</a>
					[%}%]
				<br>[%foreach(CodeFluent.Model.UI.Stylesheet sheet in Producer.Application.Stylesheets) {%]
					<br><a href='<%=CodeFluent.Runtime.Web.Utilities.UrlHelper.Current.AddParameters("cf-css", "[%=sheet.Name%]")%>' style="font-weight:bolder">[%=sheet.GetMessageValue(Culture.CultureInfo)%]</a>
					[%}%]
				</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
	</div></div>
	</body>
</html>
<!-- powered by CodeFluent Entities (C) 2005-2013 SoftFluent S.A.S. www.softfluent.com . All rights reserved. -->