[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "ServiceClient" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
[%@ namespace name="System.CodeDom" %]
[%@ namespace name="System.CodeDom.Compiler" %]
[%@ namespace name="System.Collections.Generic" %]
[%@ namespace name="CodeFluent.Model.Code" %]
[%@ namespace name="CodeFluent.Producers.CodeDom" %]
[%@ namespace name="CodeFluent.Runtime.Model" %]
[%@ namespace name="CodeFluent.Runtime.Utilities" %]
[%
	// Si l'attribut custom 'displayName' a été ajouté, on l'exploite pour afficher le nom de l'entité. 
	// Sinon, on décamélise le type réel de l'entité
	string l_displayName = entity.GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", Decamelize(entity.Name)); 
	bool l_isDerived = entity.BaseEntity != null && !entity.BaseEntity.Name.Equals(entity.Name);
	string l_remoteLoadSuffix = l_isDerived ? "2" : "";

	System.Func<Property, bool> ShoudGenerateProperty = (Property p_property) => 
	{
		if (p_property.Relations != null && p_property.Relations.Count > 0 && p_property.Relations[0].RelationType == RelationType.ManyToMany)
			return false;
		return !p_property.IsBinaryLargeObject && !p_property.IsMetaData;
	};
%]
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TheSaucisseFactory.BOM.Windows8.ServiceClientProxy;

// ATTENTION : le namespace doit être identique à celui
// de la classe partielle générée
namespace TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]Proxy
{
    /// <summary>
    /// Complément de la classe partielle [%=entity.Name%]ServiceClient. Ceci permet de configurer le proxy client.
    /// </summary>
    public partial class [%=entity.Name%]ServiceClient
    {
        /// <summary>
        /// Configure l'accès à ce service
        /// </summary>
        /// <param name="p_serviceEndpoint">Le endpoint (service) à configurer</param>
        /// <param name="p_clientCredentials">Les infos d'ident/authent</param>
        static partial void ConfigureEndpoint(System.ServiceModel.Description.ServiceEndpoint p_serviceEndpoint, System.ServiceModel.Description.ClientCredentials p_clientCredentials)
        {
            p_serviceEndpoint.Address = new System.ServiceModel.EndpointAddress(
                ServiceClientSettings.TheSaucisseFactory.ServiceBaseUrl + "/[%=entity.Name%].svc");
        }

        /// <summary>
        /// Wrap l'appel à LoadAll[%=l_remoteLoadSuffix%]Async en passant le header standard.
        /// </summary>
        /// <returns>Résultat de la méthode wrappée</returns>
        public static Task<[%=entity.Name%]Collection> CallLoadAll[%=l_remoteLoadSuffix%]Async()
        {
            [%=entity.Name%]ServiceClient l_serviceClient = new [%=entity.Name%]ServiceClient();

            // L'appel de ce WS necéssite l'ajout d'un header standard
            using (var l_scope = new System.ServiceModel.OperationContextScope(l_serviceClient.InnerChannel))
            {
                ServiceClientSettings.TheSaucisseFactory.AddCommonHeader();
                return l_serviceClient.LoadAll[%=l_remoteLoadSuffix%]Async();
            }
        }

        /// <summary>
        /// Wrap l'appel à LoadById[%=l_remoteLoadSuffix%]Async en passant le header standard.
        /// </summary>
        /// <param name="p_id">Id de [%=entity.Name%]</param>
        /// <returns>Résultat de la méthode wrappée</returns>
        public static Task<[%=entity.Name%]> CallLoadById[%=l_remoteLoadSuffix%]Async(Guid p_id)
        {
            [%=entity.Name%]ServiceClient l_serviceClient = new [%=entity.Name%]ServiceClient();

            // L'appel de ce WS necéssite l'ajout d'un header standard
            using (var l_scope = new System.ServiceModel.OperationContextScope(l_serviceClient.InnerChannel))
            {
                ServiceClientSettings.TheSaucisseFactory.AddCommonHeader();
                return l_serviceClient.LoadById[%=l_remoteLoadSuffix%]Async(p_id);
            }
        }

  [%foreach(Property l_relatedProperty in entity.Properties)
  {
	if (!ShoudGenerateProperty(l_relatedProperty)) continue;
    if (l_relatedProperty.IsEntity)
    {
    %]
        /// <summary>
        /// Wrap l'appel à LoadBy[%=l_relatedProperty.Name%]Async en passant le header standard.
        /// </summary>
        /// <param name="p_id">Id de [%=l_relatedProperty.Name%]</param>
        /// <returns>Résultat de la méthode wrappée</returns>
        public static Task<[%=entity.Name%]Collection> CallLoadBy[%=l_relatedProperty.Name%]Async(Guid p_id)
        {
            [%=entity.Name%]ServiceClient l_serviceClient = new [%=entity.Name%]ServiceClient();

            // L'appel de ce WS necéssite l'ajout d'un header standard
            using (var l_scope = new System.ServiceModel.OperationContextScope(l_serviceClient.InnerChannel))
            {
                ServiceClientSettings.TheSaucisseFactory.AddCommonHeader();
                return l_serviceClient.LoadBy[%=l_relatedProperty.Name%]Async(p_id.ToString());
            }
        }[%
	}
  }%]
    }
}
