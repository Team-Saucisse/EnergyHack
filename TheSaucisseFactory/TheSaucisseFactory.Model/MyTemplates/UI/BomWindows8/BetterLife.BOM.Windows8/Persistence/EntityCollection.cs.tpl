[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "Collection" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
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
	string l_loadSuffix = l_isDerived ? "2" : "";

	System.Func<Property, bool> ShoudGenerateProperty = (Property p_property) => 
	{
		if (p_property.Relations != null && p_property.Relations.Count > 0 && p_property.Relations[0].RelationType == RelationType.ManyToMany)
			return false;
		return !p_property.IsBinaryLargeObject && !p_property.IsMetaData;
	};
%]
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using TheSaucisseFactory.BOM.Windows8.Components.Resources;
using TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]Proxy;
using SQLiteWinRT;

namespace TheSaucisseFactory.BOM.Windows8
{
    /// <summary>
    /// Représente une collection d'instances de l'entité [%=entity.Name%] ([%=l_displayName%])
    /// </summary>
    public partial class [%=entity.Name%]Collection : System.Collections.ObjectModel.ObservableCollection<[%=entity.Name%]>
    {
        /// <summary>
        /// Construit une collection vide
        /// </summary>
        public [%=entity.Name%]Collection() 
        {
        }

        /// <summary>
        /// Charge, à partir de la base de données, l'ensemble des entités
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, null sinon</returns>
        public static async Task<[%=entity.Name%]Collection> LoadAll()
        {
			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();

            // TODO : supprimer une fois la synchro Ok
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge la collection d'entités à partir du service web correspondant 
				[%=entity.Name%]Collection l_temp = await RemoteLoadAll().ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

				// et la sauvegarde en bdd
				foreach([%=entity.Name%] l_entity in l_temp)
				{
					await l_entity.Save().ConfigureAwait(false);
				}
			}

            // Exécution de la requête SQL de chargement à partir de la base de données
			SQLiteConnection l_connection = SQLiteConnection.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources SQLiteQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]LoadAll"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

                // Tant qu'il y a des lignes à lire...
				Dictionary<string, int> l_columnIndexes = null;
                while (await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false))
                {
					// Si nécessaire, construction du dico avec les noms des colonnes (facilite le mapping)
					if (l_columnIndexes == null)
					{
						l_columnIndexes = SQLiteConnection.GetColumnIndexes(l_command); 
					}

					// ... on crée l'entité associée à la ligne lue
                    [%=entity.Name%] l_item = new [%=entity.Name%]();
                    l_item.ReadRecord(l_command, l_columnIndexes);
                    l_result.Add(l_item);
				}
            }
            catch (Exception e)
            {
                var l_error = SQLiteWinRT.Database.GetSqliteErrorCode(e.HResult);
                throw new Exception(l_error.ToString(), e);
            }
            finally
            {
				// La requête étant "disposable", on libère les ressources associées
                if (l_command != null)
                {
                    l_command.Dispose();
                }
            }

            return l_result;
        }

		#region Chargement par entité liée

  [%foreach(Property l_relatedProperty in entity.Properties)
  {
	if (!ShoudGenerateProperty(l_relatedProperty)) continue;
    if (l_relatedProperty.IsEntity)
    {
    %]
        /// <summary>
        /// Charge, à partir de la base de données, l'ensemble des entités liée à l'instance 
		/// de _ns_[%=l_relatedProperty.TypeName%] spécifiée
        /// <param name="p_[%=l_relatedProperty.Name%]">Instance _ns_[%=l_relatedProperty.TypeName%] servant de critère</param>
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, null sinon</returns>
        public static async Task<[%=entity.Name%]Collection> LoadBy[%=l_relatedProperty.Name%](_ns_[%=l_relatedProperty.TypeName%] p_[%=l_relatedProperty.Name%])
        {
			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();

            // TODO : supprimer une fois la synchro Ok
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge la collection d'entités à partir du service web correspondant 
				[%=entity.Name%]Collection l_temp = await RemoteLoadBy[%=l_relatedProperty.Name%](p_[%=l_relatedProperty.Name%].Id).ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

				foreach([%=entity.Name%] l_entity in l_temp)
				{
					await l_entity.Save().ConfigureAwait(false);
				}
			}

            // Exécution de la requête SQL de chargement à partir de la base de données
			SQLiteConnection l_connection = SQLiteConnection.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources SQLiteQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]LoadBy[%=l_relatedProperty.Name%]"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

                SQLiteConnection.BindParameterWithName(l_command, "@[%=l_relatedProperty.Name%]Id", p_[%=l_relatedProperty.Name%].Id);

                // Tant qu'il y a des lignes à lire...
				Dictionary<string, int> l_columnIndexes = null;
                while (await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false))
                {
					// Si nécessaire, construction du dico avec les noms des colonnes (facilite le mapping)
					if (l_columnIndexes == null)
					{
						l_columnIndexes = SQLiteConnection.GetColumnIndexes(l_command); 
					}

					// ... on crée l'entité associée à la ligne lue
                    [%=entity.Name%] l_item = new [%=entity.Name%]();
                    l_item.ReadRecord(l_command, l_columnIndexes);
                    l_result.Add(l_item);
				}
            }
            catch (Exception e)
            {
                var l_error = SQLiteWinRT.Database.GetSqliteErrorCode(e.HResult);
                throw new Exception(l_error.ToString(), e);
            }
            finally
            {
				// La requête étant "disposable", on libère les ressources associées
                if (l_command != null)
                {
                    l_command.Dispose();
                }
            }

            return l_result;
        }[%
  }
  }%]
		#endregion

		/// <summary>
        /// Charge à partir du service web toutes les instances de l'entité
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, lève une exception sinon</returns>
        public static async Task<[%=entity.Name%]Collection> RemoteLoadAll()
        {
            // L'appel de ce WS necéssite l'ajout d'un header standard
            [%=entity.Name%]Proxy.[%=entity.Name%]Collection l_proxyResult = await [%=entity.Name%]ServiceClient.CallLoadAll[%=l_loadSuffix%]Async().ConfigureAwait(false);

			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();
            foreach([%=entity.Name%]Proxy.[%=entity.Name%] l_entity in l_proxyResult)
			{
				l_result.Add(new [%=entity.Name%](l_entity));
			}

            return l_result;
        }

  [%foreach(Property l_relatedProperty in entity.Properties)
  {
	if (!ShoudGenerateProperty(l_relatedProperty)) continue;
    if (l_relatedProperty.IsEntity)
    {
    %]	
		/// <summary>
        /// Charge, à partir du service webl'ensemble des entités liée à l'instance 
		/// de _ns_[%=l_relatedProperty.TypeName%] spécifiée
        /// </summary>
        /// <param name="p_id">Identifiant de l'instance _ns_[%=l_relatedProperty.TypeName%] servant de critère</param>
        /// <returns>Collection d'instances de l'entité en cas de succès, lève une exception sinon</returns>
        public static async Task<[%=entity.Name%]Collection> RemoteLoadBy[%=l_relatedProperty.Name%](Guid p_id)
        {
            // L'appel de ce WS necéssite l'ajout d'un header standard
            [%=entity.Name%]Proxy.[%=entity.Name%]Collection l_proxyResult = await [%=entity.Name%]ServiceClient.CallLoadBy[%=l_relatedProperty.Name%]Async(p_id).ConfigureAwait(false);

			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();
            foreach([%=entity.Name%]Proxy.[%=entity.Name%] l_entity in l_proxyResult)
			{
				l_result.Add(new [%=entity.Name%](l_entity));
			}

            return l_result;
        }[%
	}
  }%]
    }
}

