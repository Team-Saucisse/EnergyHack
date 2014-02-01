[%@ template inherits="CodeFluent.Producers.UI.AspNetTemplate" %]
[%
// Ce renderer gère le nom des champs dans les formulaires
// 'Source' est l'instance CodeFluent.Model.UI.Field correspondant au champ

// Par défaut on prend le nom du champ décamelisé
string l_displayName = Decamelize(Source.Name); 

// Si l'attribut custom 'displayName' a été ajouté à la propriété correspondant à ce champ, on tente de l'exploiter
if (Source.TypedObject != null)
{
	// il faut obtenir la propriété de ce champ
	Property l_property =  Source.TypedObject.Entity != null ? Source.TypedObject.Entity.Properties[Source.Name] : null;
	
	// Si l'attribut custom 'displayName' a été ajouté, on l'exploite pour afficher le nom de la propriété. 
	// Sinon, on laisse CF afficher le nom brute de la propriété
	if (l_property != null)
	{
		l_displayName = l_property.GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", l_displayName);
	}
}
if (Source.TypedObject == null)
{%]
	<!-- Source.TypedObject == null --><td colspan="2">[%=l_displayName%]</td>
[%
}
else
{%]
	<td>[%=l_displayName%]</td><td>[%Write(Source.TypedObject);%]</td>
[%
}%]
