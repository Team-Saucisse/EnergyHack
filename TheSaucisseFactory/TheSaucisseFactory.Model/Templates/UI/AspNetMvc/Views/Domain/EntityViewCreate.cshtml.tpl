[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + @"\Create" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
@model [%=entity.ClrFullTypeName%]

[%
	// Si l'attribut custom 'displayName' a été ajouté, on l'exploite pour afficher le type d'entité. 
	// Sinon, on décamélise le type réel de l'entité
	string l_displayName = entity.GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", Decamelize(entity.Name));

	// Nom du contrôleur MVC pour cette vue
	string l_controllerName = entity.Name + entity.GetAttributeValue<string>("controllerSuffix", "http://www.c2s.fr/codefluent/uicustomization/betterlife", "");
%]
@{
    ViewBag.Title = "[%=l_displayName%] - Création";
}

<h2>[%=l_displayName%] - Création</h2>

<script src="@Url.Content("~/Scripts/jquery.validate.min.js")" type="text/javascript"></script>
<script src="@Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js")" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$(".datepicker").datepicker();
	});
</script>

@Html.Partial("_Error")

@using (Html.BeginRouteForm("[%=entity.ClrFullTypeName%]", new {controller = "[%=l_controllerName%]", action = "Create"}, 
		FormMethod.Post, new { autocomplete = "off"[% 
	if (entity.HasPublicBinaryLargeObjectProperties || entity.HasInheritedPublicBinaryLargeObjectProperties) 
	{ %], enctype = "multipart/form-data"[% 
	} %] })) {
    @Html.ValidationSummary(true)
    <fieldset>
        <legend>[%=l_displayName%]</legend>

		[%WriterOptions.Mode = FormMode.Insert;Write(entity.CreateForm);%]
		
        <p>
            <input type="submit" value="@Resources.WebResources.Save" />
        </p>
    </fieldset>
}

<div>
    @if (Request.UrlReferrer == null)
    {
		@Html.RouteLink("Retour", "[%=entity.ClrFullTypeName%]", new {controller = "[%=l_controllerName%]", action = "Index"})
	}
	else
	{
		<a href="@Request.UrlReferrer" title="@Resources.WebResources.GoBack">Retour</a>
	}
</div>