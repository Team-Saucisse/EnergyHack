[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
<table width="100%" class="fields">
[%
	//Entité
	CodeFluent.Model.Entity l_entity = Source[0].TypedObject.Entity;

	// Vue à utiliser pour générer les champs de la vue MVC
	CodeFluent.Model.View l_sourceView = null;
	if (l_entity.Views != null && l_entity.Views.Count > 0)
	{
		for(int i = 0; i < l_entity.Views.Count; i++)
		{
			// S'il s'agit du mode création, on cherche la vue GeneratedCreateView, en édition ce sera GeneratedEditView
			if ((WriterOptions.Mode == CodeFluent.Producers.UI.FormMode.Insert && l_entity.Views[i].Key == "GeneratedCreateView")
			||  (WriterOptions.Mode == CodeFluent.Producers.UI.FormMode.Edit && l_entity.Views[i].Key == "GeneratedEditView"))
			{
				l_sourceView = l_entity.Views[i];
				break;
			}
		}

		// Si aucune vue n'a été trouvé, on prend la vue par défaut
		if (l_sourceView == null && l_entity.Views.Count > 0)
		{
			l_sourceView = l_entity.Views[0];
		}
	} 

	int count = 0;

	// Pour chaque propriété du la vue CF...
	foreach(ViewProperty l_property in l_sourceView.Properties)
	{
		// ... on récupère le champ dont on est censé effectuer le rendu...
		Field l_field = Source[l_property.Name];
		if (l_field == null)
		{
			// Si on le trouve pas (ne devrait pas arriver), on ne fait rien
			continue;
		}

		// En mode création, pas de propriété readOnly
		if(WriterOptions.Mode == CodeFluent.Producers.UI.FormMode.Insert && !IsVisible(l_field, WriterOptions.Mode))
		{
			continue;
		}
			
		// On comptabilise le champ à rendre et on génère
		count++;
	%]<tr>[%Write(l_field);%]</tr>
[%	}
	if (count == 0){%]<tr><td>@Resources.WebResources.NoEditableData</td></tr>[%}%]</table>
