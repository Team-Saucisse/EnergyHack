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
    /// Représente l'entité [%=entity.Name%] ([%=l_displayName%])
    /// </summary>
    public partial class [%=entity.Name%][%if (l_isDerived) {%] : [%=entity.BaseEntity.Name%] [%}%]
    {
        #region Propriétés
		[% if (!l_isDerived){%]
        /// <summary>
        /// Type réél de l'entité
        /// </summary>
        public String TypeName
		{
			get
			{
				return m_TypeName;
			}
			set
			{
				m_TypeName = value;
				
			}
		}
		protected String m_TypeName;
		[%}%]
		[% foreach(Property l_property in entity.Properties)
		{
			if (!ShoudGenerateProperty (l_property)) continue;
		%]
        /// <summary>
        /// [%=l_property.Name%]
        /// </summary>
        public _ns_[%=l_property.TypeName%] [%=l_property.Name%]
		{
			get
			{
				[%if (l_property.IsClrSimpleType) {%]return m_[%=l_property.Name%];[%} 
				else 
				{
				%]if (m_[%=l_property.Name%] == null)
				{
					[%if (l_property.IsEntity) 
					{
					%]m_[%=l_property.Name%] = _ns_[%=l_property.TypeName%].LoadById(m_[%=l_property.Name%]Id).Result;[%
					}
					else 
					{
						if (string.IsNullOrEmpty(l_property.RelationPropertyName)) 
						{
						%]// TODO : [%
						}
					%]m_[%=l_property.Name%] = _ns_[%=l_property.TypeName%].LoadBy[%=l_property.RelationPropertyName%](this).Result;[%
					}
				%]
				}
				return m_[%=l_property.Name%];[%
				}%]
			}
			set
			{
				m_[%=l_property.Name%] = value;
				[% if (l_property.IsEntity) {%]if (m_[%=l_property.Name%] != null)
				{
					m_[%=l_property.Name%]Id = m_[%=l_property.Name%].Id;
				}
				else
				{
					m_[%=l_property.Name%]Id = Guid.Empty;
				}[%}%]
			}
		}
		protected _ns_[%=l_property.TypeName%] m_[%=l_property.Name%];
		[% if (l_property.IsEntity) {%]protected Guid m_[%=l_property.Name%]Id;[%}%]
		[%
		}%]
        
        #endregion

        #region Construction

        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public [%=entity.Name%]() 
        {
			m_TypeName = "TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]";
        }

        /// <summary>
        /// Construit une instance à partir du résultat d'un Load du WS correspondant à cette entité
        /// </summary>
        /// <param name="p_proxy">Instance de l'entité chargée par WS</param>
        public [%=entity.Name%](TheSaucisseFactory.BOM.Windows8.[%=entity.Name%]Proxy.[%=entity.Name%] p_proxy)
            : this()
        {
			// Initialisation des données membre à partir de l'entité chargée par le WS[%
			if (l_isDerived)
			{%]
			// Initialisations des données membre du parent[%
				foreach(Property l_property in entity.BaseEntity.Properties)
				{
					if (!ShoudGenerateProperty (l_property)) continue;
					if (l_property.IsClrSimpleType)
					{%]
			m_[%=l_property.Name%] = p_proxy.[%=l_property.Name%];[%
					} 
					else 
					{
						if (l_property.IsEntity) 
						{%]
			m_[%=l_property.Name%]Id = p_proxy.[%=l_property.Name%]Id;[%
						}
					}
				}
			}
			 
			foreach(Property l_property in entity.Properties)
			{
				if (!ShoudGenerateProperty (l_property)) continue;

				if (l_property.IsClrSimpleType)
				{%]
			m_[%=l_property.Name%] = p_proxy.[%=l_property.Name%];[%
				} 
				else 
				{
					if (l_property.IsEntity) 
					{%]
			m_[%=l_property.Name%]Id = p_proxy.[%=l_property.Name%]Id;[%
					}
				}
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
            if (p_id == null || p_id.Equals(Guid.Empty))
            {
                return null;
            }

			[%=entity.Name%] l_result = null;

            // TODO : supprimer une fois la synchro Ok
            if (DbUtilities.ConnectivityMode != DataConnectivityMode.LocalOnly)
            {
                // Charge l'entité à partir du service web correspondant et la sauvegarde en bdd
				[%=entity.Name%] l_temp = await RemoteLoadById(p_id).ConfigureAwait(false);
                if (DbUtilities.ConnectivityMode == DataConnectivityMode.RemoteOnly)
                {
                    return l_temp;
                }

				await l_temp.Save().ConfigureAwait(false);
            }

            // Exécution de la requête SQL de chargement à partir de la base de données
			SQLiteConnection l_connection = SQLiteConnection.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources SQLiteQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]LoadById"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

                SQLiteConnection.BindParameterWithName(l_command, "@Id", p_id);

                // Si la requête est exécutée avec succès...
				bool l_executionResult = await (l_command.StepAsync().AsTask<bool>()).ConfigureAwait(false);
                if (l_executionResult)
                {
					// Construction du dico avec les noms des colonnes (facilite le mapping)
					Dictionary<string, int> l_columnIndexes = SQLiteConnection.GetColumnIndexes(l_command); 

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

            SQLiteConnection l_connection = SQLiteConnection.GetConnection();
            Statement l_command = null;

            try
            {
				// On prépare la requête à partir du script correspondant dans le dico de ressources SQLiteQueries.xaml
                Task<Statement> l_commandTask = l_connection.Database
					.PrepareStatementAsync(ResourcesSQLiteHelper.GetString("[%=entity.Name%]Save"))
					.AsTask<Statement>();
                l_command = await l_commandTask.ConfigureAwait(false);

				// Ajout des paramètres nécessaires à l'exécution de la requête
				[%if (l_isDerived) {%]SQLiteConnection.BindParameterWithName(l_command, "@Id", m_Id);[%} 
				else {%]SQLiteConnection.BindParameterWithName(l_command, "@TypeName", m_TypeName);[%}%]
				[% foreach(Property l_property in entity.Properties)
				{
					if (!ShoudGenerateProperty (l_property)) continue;

					if (l_property.IsClrSimpleType)
					{%]
				SQLiteConnection.BindParameterWithName(l_command, "@[%=l_property.Name%]", m_[%=l_property.Name%]);[%
					} 
					else 
					{
						if (l_property.IsEntity) 
						{%]
				SQLiteConnection.BindParameterWithName(l_command, "@[%=l_property.Name%]Id", m_[%=l_property.Name%]Id);[%
						}
					}
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
        /// <param name="p_statement">Objet Statement en cours (équivalent d"un DataReader)</param>
        /// <param name="p_columnIndexes">Dico permettant d'obtenir l'index d'une colonne dans le résultat à partir de son nom</param>
        public [%if (l_isDerived) {%]override[%}else{%]virtual[%}%] void ReadRecord(Statement p_statement, Dictionary<string, int> p_columnIndexes)
        {[%if (l_isDerived) {%]
            // Map le parent au préalable
            base.ReadRecord(p_statement, p_columnIndexes);[%}%]
            
			[% if (!l_isDerived) {%]
			// Enregistrement du type réél de l'entité
            SQLiteConnection.CopyResult(ref m_TypeName, p_statement, p_columnIndexes["TypeName"]);
			[%}%]
			// Mapping
			[% foreach(Property l_property in entity.Properties)
			{
				if (!ShoudGenerateProperty (l_property)) continue;

				if (l_property.IsClrSimpleType)
				{%]
			SQLiteConnection.CopyResult(ref m_[%=l_property.Name%], p_statement, p_columnIndexes["[%=l_property.Name%]"]);[%
				} 
				else 
				{
					if (l_property.IsEntity) 
					{%]
			SQLiteConnection.CopyResult(ref m_[%=l_property.Name%]Id, p_statement, p_columnIndexes["[%=l_property.Name%]Id"]);[%
					}
				}
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
            [%=entity.Name%]Proxy.[%=entity.Name%] l_result = await [%=entity.Name%]ServiceClient.CallLoadById[%=l_loadSuffix%]Async(p_id).ConfigureAwait(false);

            return new [%=entity.Name%](l_result);
        }

        #endregion
    }
}

