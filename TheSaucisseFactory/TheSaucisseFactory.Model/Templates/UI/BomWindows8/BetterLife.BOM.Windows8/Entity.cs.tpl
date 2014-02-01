[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
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
    /// Représente une instance de l'ensemble des [%=l_displayName%]
    /// </summary>
    public partial class [%=entity.Name%][%if (l_isDerived) {%] : [%=entity.BaseEntity.Name%] [%}%]
    {
		public const string ModelTypeName = "[%=entity.Namespace%].[%=entity.Name%]";

        #region Propriétés
	[%if (!l_isDerived){%]
        /// <summary>
        /// Type réel de l'entité
        /// </summary>
        public String TypeName
		{
			get
			{
				return m_typeName;
			}
			set
			{
				m_typeName = value;
			}
		}
		protected String m_typeName;
	[%}%]
	[% foreach(Property l_property in entity.Properties)
	{
		if (!ShouldGenerateProperty (l_property) || !l_property.IsClrSimpleType) continue;
	%]
        /// <summary>
        /// [%=GetDisplayName(l_property)%]
        /// </summary>
        public _ns_[%=l_property.TypeName%] [%=l_property.Name%]
		{
			get
			{
				return [%=GetDataMemberName("m_", l_property)%];
			}

			set
			{
				[%=GetDataMemberName("m_", l_property)%] = value;
			}
		}
		protected _ns_[%=l_property.TypeName%] [%=GetDataMemberName("m_", l_property)%];
		[%
	}%]
[% foreach(Property l_property in entity.Properties)
	{
		if (!ShouldGenerateProperty (l_property) || l_property.IsClrSimpleType) continue;
	%]
        /// <summary>
        /// [%=GetDisplayName(l_property)%]
        /// </summary>
        public async Task<_ns_[%=l_property.TypeName%]> Get[%=l_property.Name%]Async()
		{
			return await _ns_[%=l_property.TypeName%].LoadBy[%=GetLoadCriteria(l_property)%]([%=GetLoadParam(l_property)%]);
		}
		[% if (l_property.IsEntity) {%]
        /// <summary>
        /// Obtient l'dentifiant de [%=GetDisplayName(l_property)%]
        /// </summary>
		public Guid [%=l_property.Name%]Id
		{
			get
			{
				return [%=GetDataMemberKey("m_", l_property)%];
			}
		}
		protected Guid [%=GetDataMemberKey("m_", l_property)%];
		[%}
	}%]        
        #endregion

        #region Construction

        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public [%=entity.Name%]() 
        {
			m_typeName = "TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]";
        }

        /// <summary>
        /// Construit une instance à partir d'une instance résultat d'un LoadBy[...] du WS correspondant
        /// </summary>
        /// <param name="p_proxy">Instance de l'entité chargée par WS</param>
        public [%=entity.Name%](TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]Proxy.[%=entity.Name%] p_proxy)
            : this()
        {[%
		if (l_isDerived)
		{%]
			// Initialisation des données membre du parent[%
			foreach(Property l_property in entity.BaseEntity.Properties)
			{
				if (!ShouldGenerateField(l_property)) continue;%]
			[%=GetDataMemberKey("m_", l_property)%] = p_proxy.[%=l_property.Name%][%if (l_property.IsEntity){%]Id[%}%];[%
			}%]
			[%
		}
		else
		{%]
			m_typeName = p_proxy.TypeName;
			[%
		}
			 
		foreach(Property l_property in entity.Properties)
		{
			if (!ShouldGenerateField(l_property)) continue;%]
			[%=GetDataMemberKey("m_", l_property)%] = p_proxy.[%=l_property.Name%][%if (l_property.IsEntity){%]Id[%}%];[%
		}%]

			// Implémenter cette méthode partielle si un traitement supplémentaire est nécessaire
			OnRemoteLoaded();
        }

        #endregion

		partial void OnReadRecord();
		partial void OnRemoteLoaded();

        #region Persistence

        /// <summary>
        /// Charge, à partir de la base de données, l'entité ayant l'identifiant spécifié
        /// </summary>
        /// <param name="p_id">Identifiant de l'entité</param>
        /// <returns>Instance de l'entité en cas de succès, null sinon</returns>
        public [%if (l_isDerived) {%]new [%}%]static async Task<[%=entity.Name%]> LoadById(Guid p_id)
        {
			// Intégrité des paramètres
            if (p_id.Equals(Guid.Empty))
            {
                return null;
            }

			[%=entity.Name%] l_result = null;

            // En phase projet ou TMA, on peut avoir besoin d'un mode de connectivité différent
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge l'entité à partir du service web correspondant...
				[%=entity.Name%] l_temp = await RemoteLoadById(p_id).ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

				// ... et la sauvegarde en la base de données
				await l_temp.Save().ConfigureAwait(false);
            }

            // Exécution de la requête SQL de chargement à partir de la base de données
			DbUtilities l_connection = DbUtilities.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources DbQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]LoadById"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

                DbUtilities.BindParameterWithName(l_command, "@Id", p_id);

                // Si la requête est exécutée avec succès...
				bool l_executionResult = await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false);
                if (l_executionResult)
                {
					// Construction du dico avec les noms des colonnes (facilite le mapping)
					Dictionary<string, int> l_columnIndexes = DbUtilities.GetColumnIndexes(l_command); 

					// ... alors, on crée l'entité associée
                    l_result = new [%=entity.Name%]();
                    l_result.ReadRecord(l_command, l_columnIndexes);
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

        /// <summary>
        /// Sauvegarde cette instance en base de données
        /// </summary>
        /// <remarks>Pour le moment, ceci ne gère pas les relations n-n</remarks>
        public [%if (l_isDerived) {%]override[%}else{%]virtual[%}%] async Task Save()
        {[%if (l_isDerived) {%]
            // Enregistre le parent au préalable
            await base.Save().ConfigureAwait(false);[%}%]

            DbUtilities l_connection = DbUtilities.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources DbQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]Save"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

				// Ajout des paramètres nécessaires à l'exécution de la requête
				[%if (l_isDerived) {%]DbUtilities.BindParameterWithName(l_command, "@Id", m_id);[%} 
				else {%]DbUtilities.BindParameterWithName(l_command, "@TypeName", m_typeName);[%}%]
				[% foreach(Property l_property in entity.Properties)
				{
					if (!ShouldGenerateField(l_property)) continue;%]
				DbUtilities.BindParameterWithName(l_command, "@[%=GetField(l_property)%]", [%=GetDataMemberKey("m_", l_property)%]);[%
				}%]

                // Exécution
				await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false);
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
        }

        /// <summary>
        /// Map les propriétés du résultat de la requête spécifiée
		/// </summary>
        /// <param name="p_statement">Objet Statement en cours (équivalent d'un DataReader)</param>
        /// <param name="p_columnIndexes">Dico permettant d'obtenir l'index d'une colonne dans le résultat à partir de son nom</param>
        public [%if (l_isDerived) {%]override[%}else{%]virtual[%}%] void ReadRecord(Statement p_statement, Dictionary<string, int> p_columnIndexes)
        {[%if (l_isDerived) {%]
            // Map le parent au préalable
            base.ReadRecord(p_statement, p_columnIndexes);[%}%]
            
			[% if (!l_isDerived) {%]
			// Enregistrement du type réél de l'entité
            DbUtilities.CopyResult(ref m_typeName, p_statement, p_columnIndexes["TypeName"]);
			[%}%]
			// Mapping
			[% foreach(Property l_property in entity.Properties)
			{
				if (!ShouldGenerateField(l_property)) continue;%]
			DbUtilities.CopyResult(ref [%=GetDataMemberKey("m_", l_property)%], p_statement, p_columnIndexes["[%=GetField(l_property)%]"]);[%
			}%]

			// Implémenter cette méthode partielle si un traitement supplémentaire est nécessaire
			OnReadRecord();
        }

        #endregion

        #region Liaison services web

		/// <summary>
        /// Charge à partir du service web l'instance de l'entité ayant l'id spécifié
        /// </summary>
        /// <param name="p_id">Identifiant de l'instance à charger</param>
        /// <returns>Instance de l'entité chargée en cas de succès, lève une exception sinon</returns>
        public static async Task<[%=entity.Name%]> RemoteLoadById(Guid p_id)
        {
            // L'appel de ce WS necéssite l'ajout d'un header standard
            [%=entity.Name%]Proxy.[%=entity.Name%] l_result = await [%=entity.Name%]ServiceClient.CallLoadById[%=l_remoteLoadSuffix%]Async(p_id).ConfigureAwait(false);

            return new [%=entity.Name%](l_result);
        }

        #endregion
    }
}

