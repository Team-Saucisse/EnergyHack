[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + @"\Index" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[%@ namespace name="CodeFluent.Runtime.UI" %]
@model PagedList.IPagedList<[%=entity.ClrFullTypeName%]>
@using PagedList.Mvc;
[%
	// Si l'attribut custom 'displayName' a été ajouté, on l'exploite pour afficher le nom de l'entité. 
	// Sinon, on décamélise le type réel de l'entité
	string l_displayName = entity.GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", Decamelize(entity.Name));
	
	// Est-ce que la recherche par nom est activée
	bool l_searchEnabled = entity.GetAttributeValue<bool>("searchEnabled", "http://www.c2s.fr/codefluent/uicustomization/betterlife", false);
	
	// Nom du contrôleur MVC pour cette vue
	string l_controllerName = entity.Name + entity.GetAttributeValue<string>("controllerSuffix", "http://www.c2s.fr/codefluent/uicustomization/betterlife", "");

	// Vue à utiliser pour générer les champs de la vue MVC
	CodeFluent.Model.View l_sourceView = null;
	if (entity.Views != null && entity.Views.Count > 0)
	{
		for(int i = 0; i < entity.Views.Count; i++)
		{
			if (entity.Views[i].Key == "GeneratedIndexView")
			{
				l_sourceView = entity.Views[i];
				break;
			}
		}
		if (l_sourceView == null && entity.Views.Count > 0)
		{
			l_sourceView = entity.Views[0];
		}
	} 

	// Création autorisée
	bool l_createEnabled = entity.GetAttributeValue<bool>("createEnabled", "http://www.c2s.fr/codefluent/uicustomization/betterlife", true);
	bool l_deleteEnabled = entity.GetAttributeValue<bool>("deleteEnabled", "http://www.c2s.fr/codefluent/uicustomization/betterlife", true);
	bool l_editEnabled = entity.GetAttributeValue<bool>("editEnabled", "http://www.c2s.fr/codefluent/uicustomization/betterlife", true);
%]
<link href="/Content/PagedList.css" rel="stylesheet" type="text/css" />

@{
    ViewBag.Title = "[%=l_displayName%]";
}

<h2>[%=l_displayName%]</h2>

@Html.Partial("_Error")

<table class="entity">
	<tr>
[%	// Génération du bouton de création
	if (l_createEnabled) {%]
		<td class="indexTopRow">
            <ul>
                <li>@Html.RouteLink(Resources.WebResources.AddNew, "[%=entity.ClrFullTypeName%]", new {controller = "[%=l_controllerName%]", action = "Create"})</li>
            </ul>
        </td>
[%	}%]
		<td[%=l_createEnabled ? "" : " colspan=\"2\""%]>
[%
	if (l_searchEnabled)
	{
%]		@using (Html.BeginForm("Index", "[%=DisplayName(entity)%]", FormMethod.Get))
		{
			<p>
				@Html.TextBox("SearchString", ViewBag.CurrentFilter as string, new { placeholder = Resources.WebResources.SearchByNameWaterMark })
				<input type="submit" value="@Resources.WebResources.Search" />
			</p>
		}
[%	}%]
		</td>
	</tr>
    <tr>
        <td colspan="2">
            <table>
				<tr>
					<th></th>
[%				if (l_sourceView != null) 
				{
					foreach(ViewProperty property in l_sourceView.Properties) {%]
					<th class="indexHeader">[%=entity.AllProperties[property.Name] == null ? property.Name : entity.AllProperties[property.Name].GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", "nf_" + property.Name)%]</th>[%}%]
					[%}%]
				</tr>

			@foreach (var item in Model) {
				<tr>
					<td nowrap="nowrap">
						[%if (l_editEnabled) {%]@Html.ActionLink(" ", "Edit", "[%=l_controllerName%]", new { entityKey = item.EntityKey }, new { @class = "editItemLink" })[%}%]
						[%if (l_deleteEnabled) {%]@Html.ActionLink(" ", "Delete", "[%=l_controllerName%]", new { entityKey = item.EntityKey }, new {@class = "removeItemLink", onclick = "if (!confirm('" + Resources.WebResources.ConfirmEntityDelete + "')) return false;"})[%}%]
					</td>
					[%
					if (l_sourceView != null)
					{
						foreach(ViewProperty property in l_sourceView.Properties) {%]<td class="indexValue">
						[%Write(property, null, RendererTemplateSearchModes.NeedCategoryMatch | RendererTemplateSearchModes.NeedRendererTypeMatch, RendererType.Column);%]
					</td>
					[%}}%]
				</tr>
			}

			</table>
        </td>
    </tr>
</table>
@if (Model.PageCount > 1)
{
    <br />
    string.Format(Resources.WebResources.CurrentPage, Model.PageCount < Model.PageNumber ? 0 : Model.PageNumber, @Model.PageCount);
    @Html.PagedListPager(Model, page => Url.Action("Index", new { page, currentFilter = ViewBag.CurrentFilter }), PagedListRenderOptions.PageNumbersOnly)
}

