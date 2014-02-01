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
	string l_remoteLoadSuffix = l_isDerived ? "2" : "";

	System.Func<Property, bool> ShouldGenerateProperty = (Property p_property) => 
	{
		if (p_property.Relations != null && p_property.Relations.Count > 0 && p_property.Relations[0].RelationType == RelationType.ManyToMany)
			return false;
		return !p_property.IsBinaryLargeObject && !p_property.IsMetaData;
	};

	System.Func<Property, bool> ShouldGenerateLoadBy = (Property p_property) => 
	{
		return p_property.IsEntity && ShouldGenerateProperty(p_property);
	};

	System.Func<Property, bool> ShouldGenerateField = (Property p_property) => 
	{
		return (p_property.IsClrSimpleType || p_property.IsEntity) && ShouldGenerateProperty(p_property);
	};

	System.Func<string, Property, string> GetDataMemberName = (string p_scope, Property p_property) => 
	{
		return p_scope + p_property.Name.Substring(0,1).ToLower() + p_property.Name.Remove(0, 1);
	};

	System.Func<string, Property, string> GetDataMemberKey = (string p_scope, Property p_property) => 
	{
		if (p_property.IsClrSimpleType)
			return GetDataMemberName(p_scope, p_property);
		return GetDataMemberName(p_scope, p_property) + "Id";
	};

	System.Func<Property, string> GetField = (Property p_property) => 
	{
		if (p_property.IsClrSimpleType)
			return p_property.Name;
		return p_property.Name + "Id";
	};

	System.Func<Property, string> GetLoadCriteria = (Property p_property) => 
	{
		if (p_property.IsEntity) 
			return "Id";

		if (string.IsNullOrEmpty(p_property.RelationPropertyName)) 
			return "_MANQUE_UN_NOM_A_CETTE_RELATION";

		return p_property.RelationPropertyName;
	};

	System.Func<Property, string> GetLoadParam = (Property p_property) => 
	{
		if (p_property.IsEntity) 
			return GetDataMemberKey("m_", p_property);
		
		return "this";
	};

	System.Func<Property, string> GetDisplayName = (Property p_property) => 
	{
		return p_property.GetAttributeValue<string>("displayName", "http://www.c2s.fr/codefluent/uicustomization/betterlife", Decamelize(p_property.Name));
	};
%]using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using TheSaucisseFactory.BOM.Windows8.Components.Resources;
using TheSaucisseFactory.BOM.Windows8.Persistence;
using TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]Proxy;
using SQLiteWinRT;

namespace TheSaucisseFactory.BOM.Windows8
{
    /// <summary>
    /// Représente l'ensemble des [%=l_displayName%]
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
        /// Charge, à partir de la base de données (en mode LocalOnly), l'ensemble des entités
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, vide sinon</returns>
        public static async Task<[%=entity.Name%]Collection> LoadAll()
        {
			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();

            // En phase projet ou TMA, on peut avoir besoin d'un mode de connectivité différent
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge la collection d'entités à partir du service web correspondant 
				[%=entity.Name%]Collection l_temp = await RemoteLoadAll().ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

				// et la sauvegarde en bdd
                await DbUtilities.GetConnection().Database.ExecuteStatementAsync("BEGIN TRANSACTION");
                
                try
                {
					foreach([%=entity.Name%] l_entity in l_temp)
					{
						await l_entity.Save().ConfigureAwait(false);
					}

                    await DbUtilities.GetConnection().Database.ExecuteStatementAsync("COMMIT TRANSACTION");
                }
                catch
                {
                    DbUtilities.GetConnection().Database.ExecuteStatementAsync("ROLLBACK TRANSACTION");
                    throw;
                }
			}

            // Exécution de la requête SQL de chargement à partir de la base de données
			DbUtilities l_connection = DbUtilities.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources DbQueries.xaml
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
						l_columnIndexes = DbUtilities.GetColumnIndexes(l_command); 
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
	if (!ShouldGenerateLoadBy(l_relatedProperty)) continue;
    %]
        /// <summary>
        /// Charge, à partir de la base de données, l'ensemble des entités liée à l'instance 
		/// de _ns_[%=l_relatedProperty.TypeName%] spécifiée
        /// <param name="[%=GetDataMemberName("p_", l_relatedProperty)%]">Instance _ns_[%=l_relatedProperty.TypeName%] servant de critère</param>
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, vide sinon</returns>
        public static async Task<[%=entity.Name%]Collection> LoadBy[%=l_relatedProperty.Name%](_ns_[%=l_relatedProperty.TypeName%] [%=GetDataMemberName("p_", l_relatedProperty)%])
        {
			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();

            // En phase projet ou TMA, on peut avoir besoin d'un mode de connectivité différent
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge la collection d'entités à partir du service web correspondant 
				[%=entity.Name%]Collection l_temp = await RemoteLoadBy[%=l_relatedProperty.Name%]([%=GetDataMemberName("p_", l_relatedProperty)%].Id).ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

                await DbUtilities.GetConnection().Database.ExecuteStatementAsync("BEGIN TRANSACTION");
                
                try
                {
					foreach([%=entity.Name%] l_entity in l_temp)
					{
						await l_entity.Save().ConfigureAwait(false);
					}

                    await DbUtilities.GetConnection().Database.ExecuteStatementAsync("COMMIT TRANSACTION");
                }
                catch
                {
                    DbUtilities.GetConnection().Database.ExecuteStatementAsync("ROLLBACK TRANSACTION");
                    throw;
                }
			}

            // Exécution de la requête SQL de chargement à partir de la base de données
			DbUtilities l_connection = DbUtilities.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources DbQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]LoadBy[%=l_relatedProperty.Name%]"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

                DbUtilities.BindParameterWithName(l_command, "@[%=GetField(l_relatedProperty)%]", [%=GetDataMemberName("p_", l_relatedProperty)%].Id);

                // Tant qu'il y a des lignes à lire...
				Dictionary<string, int> l_columnIndexes = null;
                while (await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false))
                {
					// Si nécessaire, construction du dico avec les noms des colonnes (facilite le mapping)
					if (l_columnIndexes == null)
					{
						l_columnIndexes = DbUtilities.GetColumnIndexes(l_command); 
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
  }%]
		#endregion

		/// <summary>
        /// Charge à partir du service web toutes les instances de l'entité
        /// </summary>
        /// <returns>Collection d'instances de l'entité en cas de succès, lève une exception sinon</returns>
        public static async Task<[%=entity.Name%]Collection> RemoteLoadAll()
        {
            // L'appel de ce WS necéssite l'ajout d'un header standard
            [%=entity.Name%]Proxy.[%=entity.Name%]Collection l_proxyResult = await [%=entity.Name%]ServiceClient.CallLoadAll[%=l_remoteLoadSuffix%]Async().ConfigureAwait(false);

			[%=entity.Name%]Collection l_result = new [%=entity.Name%]Collection();
            foreach([%=entity.Name%]Proxy.[%=entity.Name%] l_entity in l_proxyResult)
			{
				l_result.Add(new [%=entity.Name%](l_entity));
			}

            return l_result;
        }

  [%foreach(Property l_relatedProperty in entity.Properties)
  {
	if (!ShouldGenerateLoadBy(l_relatedProperty)) continue;
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

