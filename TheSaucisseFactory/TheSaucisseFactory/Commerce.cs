﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheSaucisseFactory
{
    using CodeFluent.Runtime;
    using CodeFluent.Runtime.Utilities;
    
    
    // CodeFluent Entities generated (http://www.softfluent.com). Date: .
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    [System.SerializableAttribute()]
    [System.ComponentModel.DataObjectAttribute()]
    [System.Diagnostics.DebuggerDisplayAttribute("EK={EntityKey}, Nom={Nom}, Id={Id}")]
    [System.ComponentModel.TypeConverterAttribute(typeof(CodeFluent.Runtime.Design.NameTypeConverter))]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://schemas.thesaucissefactory.com")]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(CodeFluent.Runtime.CodeFluentRelationType))]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(TheSaucisseFactory.Media))]
    public partial class Commerce : System.ICloneable, System.IComparable, System.IComparable<TheSaucisseFactory.Commerce>, CodeFluent.Runtime.ICodeFluentCollectionEntity<System.Guid>, System.ComponentModel.IDataErrorInfo, CodeFluent.Runtime.ICodeFluentMemberValidator, CodeFluent.Runtime.ICodeFluentSummaryValidator, System.IEquatable<TheSaucisseFactory.Commerce>
    {
        
        private bool _raisePropertyChangedEvents = true;
        
        private System.Guid _id = CodeFluentPersistence.DefaultGuidValue;
        
        private string _nom = default(string);
        
        private string _url = default(string);
        
        [System.NonSerializedAttribute()]
        private TheSaucisseFactory.MediaCollection _publicites;
        
        [System.NonSerializedAttribute()]
        private bool _isSerializing;
        
        [System.NonSerializedAttribute()]
        private bool _isDeserializing;
        
#if SILVERLIGHT
[System.Runtime.Serialization.DataMemberAttribute(Order=2147483647)]
[System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
public CodeFluent.Runtime.CodeFluentEntityState _entityState;
#else
[System.Runtime.Serialization.DataMemberAttribute(Order=2147483647)]
private CodeFluent.Runtime.CodeFluentEntityState _entityState;
#endif
#if SILVERLIGHT
[System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false)]
[System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
public System.Collections.Hashtable _cf_rt_publicitesRelations = null;
#else
[System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false)]
private System.Collections.Hashtable _cf_rt_publicitesRelations = null;
#endif
        
        public Commerce()
        {
            this._id = System.Guid.NewGuid();
            this._entityState = CodeFluent.Runtime.CodeFluentEntityState.Created;
        }
        
        [System.ComponentModel.BrowsableAttribute(false)]
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public virtual bool RaisePropertyChangedEvents
        {
            get
            {
                return this._raisePropertyChangedEvents;
            }
            set
            {
                this._raisePropertyChangedEvents = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public virtual string EntityKey
        {
            get
            {
                return this.Id.ToString();
            }
            set
            {
                this.Id = ((System.Guid)(ConvertUtilities.ChangeType(value, typeof(System.Guid), CodeFluentPersistence.DefaultGuidValue)));
            }
        }
        
        public virtual string EntityDisplayName
        {
            get
            {
                return this.Nom;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute(IsNullable=false, Type=typeof(System.Guid))]
        [System.ComponentModel.DataObjectFieldAttribute(true)]
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=100)]
        public System.Guid Id
        {
            get
            {
                return this._id;
            }
            set
            {
                if ((System.Collections.Generic.EqualityComparer<System.Guid>.Default.Equals(value, this._id) == true))
                {
                    return;
                }
                System.Guid oldKey = this._id;
                if ((value.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
                {
                    this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Created;
                    this._id = System.Guid.NewGuid();
                }
                else
                {
                    this._id = value;
                }
                try
                {
                    this.OnCollectionKeyChanged(oldKey);
                }
                catch (System.ArgumentException )
                {
                    this._id = oldKey;
                    return;
                }
                this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Modified;
                this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("Id"));
            }
        }
        
        [System.ComponentModel.DataAnnotations.Required()]
        [System.ComponentModel.DefaultValueAttribute(default(string))]
        [System.Xml.Serialization.XmlElementAttribute(IsNullable=true, Type=typeof(string))]
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=200)]
        public string Nom
        {
            get
            {
                return this._nom;
            }
            set
            {
                this._nom = value;
                this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Modified;
                this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("Nom"));
            }
        }
        
        [System.ComponentModel.DataAnnotations.Required()]
        [System.ComponentModel.DefaultValueAttribute(default(string))]
        [System.Xml.Serialization.XmlElementAttribute(IsNullable=true, Type=typeof(string))]
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=300)]
        public string Url
        {
            get
            {
                return this._url;
            }
            set
            {
                this._url = value;
                this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Modified;
                this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("Url"));
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public TheSaucisseFactory.MediaCollection Publicites
        {
            get
            {
                if ((this._publicites == null))
                {
                    if (((this.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true) 
                                || (this.EntityState.Equals(CodeFluent.Runtime.CodeFluentEntityState.Created) == true)))
                    {
                        this._publicites = new TheSaucisseFactory.MediaCollection(this);
                        return this._publicites;
                    }
                    this._publicites = TheSaucisseFactory.MediaCollection.LoadPublicitesCommercesByCommerce(this);
                }
                return this._publicites;
            }
        }
        
        string System.ComponentModel.IDataErrorInfo.Error
        {
            get
            {
                return this.Validate(System.Globalization.CultureInfo.CurrentCulture);
            }
        }
        
        string System.ComponentModel.IDataErrorInfo.this[string columnName]
        {
            get
            {
                return CodeFluentPersistence.ValidateMember(System.Globalization.CultureInfo.CurrentCulture, this, columnName, null);
            }
        }
        
        System.Guid CodeFluent.Runtime.Utilities.IKeyable<System.Guid>.Key
        {
            get
            {
                return this.Id;
            }
        }
        
        public virtual CodeFluent.Runtime.CodeFluentEntityState EntityState
        {
            get
            {
                return this._entityState;
            }
            set
            {
                if ((System.Collections.Generic.EqualityComparer<CodeFluent.Runtime.CodeFluentEntityState>.Default.Equals(value, this.EntityState) == true))
                {
                    return;
                }
                this._entityState = value;
                this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("EntityState"));
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        protected virtual bool IsSerializing
        {
            get
            {
                return this._isSerializing;
            }
            set
            {
                this._isSerializing = value;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        protected virtual bool IsDeserializing
        {
            get
            {
                return this._isDeserializing;
            }
            set
            {
                this._isDeserializing = value;
            }
        }
        
        [field:System.NonSerializedAttribute()]
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        [field:System.NonSerializedAttribute()]
        public event CodeFluent.Runtime.CodeFluentEntityActionEventHandler EntityAction;
        
        [field:System.NonSerializedAttribute()]
        public event System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>> KeyChanged;
        
        protected virtual void OnPropertyChanged(System.ComponentModel.PropertyChangedEventArgs e)
        {
            if ((this.RaisePropertyChangedEvents == false))
            {
                return;
            }
            if ((this.PropertyChanged != null))
            {
                this.PropertyChanged(this, e);
            }
        }
        
        protected virtual void OnEntityAction(CodeFluent.Runtime.CodeFluentEntityActionEventArgs e)
        {
            if ((this.EntityAction != null))
            {
                this.EntityAction(this, e);
            }
        }
        
        public virtual bool Equals(TheSaucisseFactory.Commerce commerce)
        {
            if ((commerce == null))
            {
                return false;
            }
            if ((this.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                return base.Equals(commerce);
            }
            return (this.Id.Equals(commerce.Id) == true);
        }
        
        public override int GetHashCode()
        {
            return this.Id.GetHashCode();
        }
        
        public override bool Equals(object obj)
        {
            TheSaucisseFactory.Commerce commerce = null;
			commerce = obj as TheSaucisseFactory.Commerce;
            return this.Equals(commerce);
        }
        
        internal void SavePublicitesRelations()
        {
            if ((this._publicites == null))
            {
                return;
            }
            System.Collections.IEnumerator enumerator = ((CodeFluent.Runtime.ICodeFluentSet)(this._publicites)).Relations.GetEnumerator();
            bool b;
            for (b = enumerator.MoveNext(); b; b = enumerator.MoveNext())
            {
                System.Collections.DictionaryEntry entry = ((System.Collections.DictionaryEntry)(enumerator.Current));
                TheSaucisseFactory.Media media = ((TheSaucisseFactory.Media)(entry.Key));
                CodeFluent.Runtime.CodeFluentRelationType relationType = ((CodeFluent.Runtime.CodeFluentRelationType)(entry.Value));
                if (((relationType == CodeFluent.Runtime.CodeFluentRelationType.Added) 
                            && ((media.EntityState == CodeFluent.Runtime.CodeFluentEntityState.ToBeUnlinked) 
                            == false)))
                {
                    CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
                    persistence.CreateStoredProcedureCommand(null, "Media", "SaveCommercePublicites");
                    persistence.AddParameter("@Id", this.Id, CodeFluentPersistence.DefaultGuidValue);
                    persistence.AddParameter("@Id2", media.Id, CodeFluentPersistence.DefaultGuidValue);
                    persistence.ExecuteNonQuery();
                }
                else
                {
                    CodeFluent.Runtime.CodeFluentPersistence persistence1 = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
                    persistence1.CreateStoredProcedureCommand(null, "Media", "DeleteCommercePublicites");
                    persistence1.AddParameter("@Id", this.Id, CodeFluentPersistence.DefaultGuidValue);
                    persistence1.AddParameter("@Id2", media.Id, CodeFluentPersistence.DefaultGuidValue);
                    persistence1.ExecuteNonQuery();
                }
                if ((media.EntityState == CodeFluent.Runtime.CodeFluentEntityState.ToBeUnlinked))
                {
                    media.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                }
            }
            ((CodeFluent.Runtime.ICodeFluentSet)(this._publicites)).Relations.Clear();
        }
        
        int System.IComparable.CompareTo(object value)
        {
            TheSaucisseFactory.Commerce commerce = null;
commerce = value as TheSaucisseFactory.Commerce;
            if ((commerce == null))
            {
                throw new System.ArgumentException("value");
            }
            int localCompareTo = this.CompareTo(commerce);
            return localCompareTo;
        }
        
        public virtual int CompareTo(TheSaucisseFactory.Commerce commerce)
        {
            if ((commerce == null))
            {
                throw new System.ArgumentNullException("commerce");
            }
            int localCompareTo = this.Id.CompareTo(commerce.Id);
            return localCompareTo;
        }
        
        public virtual string Validate(System.Globalization.CultureInfo culture)
        {
            return CodeFluentPersistence.Validate(culture, this, null);
        }
        
        public virtual void Validate(System.Globalization.CultureInfo culture, System.Collections.Generic.IList<CodeFluent.Runtime.CodeFluentValidationException> results)
        {
            CodeFluent.Runtime.CodeFluentEntityActionEventArgs evt = new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Validating, true, results);
            evt.Culture = culture;
            this.OnEntityAction(evt);
            if ((evt.Cancel == true))
            {
                string externalValidate;
                if ((evt.Argument != null))
                {
                    externalValidate = evt.Argument.ToString();
                }
                else
                {
                    externalValidate = TheSaucisseFactory.Resources.Manager.GetStringWithDefault(culture, "TheSaucisseFactory.Commerce.ExternalValidate", "Type \'TheSaucisseFactory.Commerce\' cannot be validated.", null);
                }
                CodeFluentPersistence.AddValidationError(results, externalValidate);
            }
            CodeFluentPersistence.ValidateMember(culture, results, this, null);
            if ((this.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                string localValidate = TheSaucisseFactory.Resources.Manager.GetStringWithDefault(culture, "TheSaucisseFactory.Commerce.Id.NullException", "\'Id\' property cannot be set to \'00000000-0000-0000-0000-000000000000\' for type \'T" +
                        "heSaucisseFactory.Commerce\'", null);
                CodeFluentPersistence.AddValidationError(results, localValidate);
            }
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Validated, false, results));
        }
        
        public void Validate()
        {
            string var = this.Validate(System.Globalization.CultureInfo.CurrentCulture);
            if ((var != null))
            {
                throw new CodeFluent.Runtime.CodeFluentValidationException(var);
            }
        }
        
        string CodeFluent.Runtime.ICodeFluentValidator.Validate(System.Globalization.CultureInfo culture)
        {
            string localValidate = this.Validate(culture);
            return localValidate;
        }
        
        void CodeFluent.Runtime.ICodeFluentMemberValidator.Validate(System.Globalization.CultureInfo culture, string memberName, System.Collections.Generic.IList<CodeFluent.Runtime.CodeFluentValidationException> results)
        {
            this.ValidateMember(culture, memberName, results);
        }
        
        public virtual bool Delete()
        {
            bool ret = false;
            CodeFluent.Runtime.CodeFluentEntityActionEventArgs evt = new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Deleting, true);
            this.OnEntityAction(evt);
            if ((evt.Cancel == true))
            {
                return ret;
            }
            if ((this.EntityState == CodeFluent.Runtime.CodeFluentEntityState.Deleted))
            {
                return ret;
            }
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Commerce", "Delete");
            persistence.AddParameter("@Id", this.Id, CodeFluentPersistence.DefaultGuidValue);
            persistence.ExecuteNonQuery();
            this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Deleted;
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Deleted, false, false));
            ret = true;
            return ret;
        }
        
        protected virtual void ReadRecord(System.Data.IDataReader reader, CodeFluent.Runtime.CodeFluentReloadOptions options)
        {
            if ((reader == null))
            {
                throw new System.ArgumentNullException("reader");
            }
            if ((((options & CodeFluent.Runtime.CodeFluentReloadOptions.Properties) 
                        == 0) 
                        == false))
            {
                this._id = CodeFluentPersistence.GetReaderValue(reader, "Id", ((System.Guid)(CodeFluentPersistence.DefaultGuidValue)));
                this._nom = CodeFluentPersistence.GetReaderValue(reader, "Nom", ((string)(default(string))));
                this._url = CodeFluentPersistence.GetReaderValue(reader, "Url", ((string)(default(string))));
            }
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.ReadRecord, false, false));
        }
        
        void CodeFluent.Runtime.ICodeFluentEntity.ReadRecord(System.Data.IDataReader reader)
        {
            this.ReadRecord(reader, CodeFluent.Runtime.CodeFluentReloadOptions.Default);
        }
        
        protected virtual void ReadRecordOnSave(System.Data.IDataReader reader)
        {
            if ((reader == null))
            {
                throw new System.ArgumentNullException("reader");
            }
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.ReadRecordOnSave, false, false));
        }
        
        void CodeFluent.Runtime.ICodeFluentEntity.ReadRecordOnSave(System.Data.IDataReader reader)
        {
            this.ReadRecordOnSave(reader);
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.Commerce Load(System.Guid id)
        {
            if ((id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                return null;
            }
            TheSaucisseFactory.Commerce commerce = new TheSaucisseFactory.Commerce();
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Commerce", "Load");
            persistence.AddParameter("@Id", id, CodeFluentPersistence.DefaultGuidValue);
            System.Data.IDataReader reader = null;
            try
            {
                reader = persistence.ExecuteReader();
                if ((reader.Read() == true))
                {
                    commerce.ReadRecord(reader, CodeFluent.Runtime.CodeFluentReloadOptions.Default);
                    commerce.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                    return commerce;
                }
            }
            finally
            {
                if ((reader != null))
                {
                    reader.Dispose();
                }
                persistence.CompleteCommand();
            }
            return null;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
        public static TheSaucisseFactory.Commerce LoadById(System.Guid id)
        {
            if ((id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                return null;
            }
            TheSaucisseFactory.Commerce commerce = new TheSaucisseFactory.Commerce();
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Commerce", "LoadById");
            persistence.AddParameter("@Id", id, CodeFluentPersistence.DefaultGuidValue);
            System.Data.IDataReader reader = null;
            try
            {
                reader = persistence.ExecuteReader();
                if ((reader.Read() == true))
                {
                    commerce.ReadRecord(reader, CodeFluent.Runtime.CodeFluentReloadOptions.Default);
                    commerce.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                    return commerce;
                }
            }
            finally
            {
                if ((reader != null))
                {
                    reader.Dispose();
                }
                persistence.CompleteCommand();
            }
            return null;
        }
        
        public virtual bool Reload(CodeFluent.Runtime.CodeFluentReloadOptions options)
        {
            bool ret = false;
            if ((this.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                return ret;
            }
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Commerce", "Load");
            persistence.AddParameter("@Id", this.Id);
            System.Data.IDataReader reader = null;
            try
            {
                reader = persistence.ExecuteReader();
                if ((reader.Read() == true))
                {
                    this.ReadRecord(reader, options);
                    this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                    ret = true;
                }
                else
                {
                    this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Deleted;
                }
            }
            finally
            {
                if ((reader != null))
                {
                    reader.Dispose();
                }
                persistence.CompleteCommand();
            }
            return ret;
        }
        
        protected virtual bool BaseSave(bool force)
        {
            if ((this.EntityState == CodeFluent.Runtime.CodeFluentEntityState.ToBeDeleted))
            {
                this.Delete();
                return false;
            }
            CodeFluent.Runtime.CodeFluentEntityActionEventArgs evt = new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Saving, true);
            this.OnEntityAction(evt);
            if ((evt.Cancel == true))
            {
                return false;
            }
            CodeFluentPersistence.ThrowIfDeleted(this);
            this.Validate();
            if (((force == false) 
                        && (this.EntityState == CodeFluent.Runtime.CodeFluentEntityState.Unchanged)))
            {
                return false;
            }
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Commerce", "Save");
            persistence.AddParameter("@Id", this.Id, CodeFluentPersistence.DefaultGuidValue);
            persistence.AddParameter("@Nom", this.Nom, default(string));
            persistence.AddParameter("@Url", this.Url, default(string));
            System.Data.IDataReader reader = null;
            try
            {
                reader = persistence.ExecuteReader();
                if ((reader.Read() == true))
                {
                    this.ReadRecordOnSave(reader);
                }
                CodeFluentPersistence.NextResults(reader);
            }
            finally
            {
                if ((reader != null))
                {
                    reader.Dispose();
                }
                persistence.CompleteCommand();
            }
            this.SavePublicitesRelations();
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.Saved, false, false));
            this.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
            return true;
        }
        
        public virtual bool Save()
        {
            bool localSave = this.BaseSave(false);
            return localSave;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static bool Save(TheSaucisseFactory.Commerce commerce)
        {
            if ((commerce == null))
            {
                return false;
            }
            bool ret = commerce.Save();
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public static bool Insert(TheSaucisseFactory.Commerce commerce)
        {
            bool ret = TheSaucisseFactory.Commerce.Save(commerce);
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static bool Delete(TheSaucisseFactory.Commerce commerce)
        {
            if ((commerce == null))
            {
                return false;
            }
            bool ret = commerce.Delete();
            return ret;
        }
        
        public string Trace()
        {
            System.Text.StringBuilder stringBuilder = new System.Text.StringBuilder();
            System.IO.StringWriter stringWriter = new System.IO.StringWriter(stringBuilder, System.Globalization.CultureInfo.CurrentCulture);
            System.CodeDom.Compiler.IndentedTextWriter writer = new System.CodeDom.Compiler.IndentedTextWriter(stringWriter);
            this.BaseTrace(writer);
            writer.Flush();
            ((System.IDisposable)(writer)).Dispose();
            ((System.IDisposable)(stringWriter)).Dispose();
            string sr = stringBuilder.ToString();
            return sr;
        }
        
        void CodeFluent.Runtime.ICodeFluentObject.Trace(System.CodeDom.Compiler.IndentedTextWriter writer)
        {
            this.BaseTrace(writer);
        }
        
        protected virtual void BaseTrace(System.CodeDom.Compiler.IndentedTextWriter writer)
        {
            writer.Write("[");
            writer.Write("Id=");
            writer.Write(this.Id);
            writer.Write(",");
            writer.Write("Nom=");
            writer.Write(this.Nom);
            writer.Write(",");
            writer.Write("Url=");
            writer.Write(this.Url);
            writer.Write(",");
            writer.Write("Publicites=");
            if ((this._publicites != null))
            {
                ((CodeFluent.Runtime.ICodeFluentObject)(this._publicites)).Trace(writer);
            }
            else
            {
                writer.Write("<null>");
            }
            writer.Write(", EntityState=");
            writer.Write(this.EntityState);
            writer.Write("]");
        }
        
        public virtual void SetPublicites(System.Collections.IDictionary values)
        {
            if ((values == null))
            {
                throw new System.ArgumentNullException("values");
            }
            this.Publicites.Clear();
            System.Collections.IEnumerator enumerator = values.GetEnumerator();
            bool b;
            for (b = enumerator.MoveNext(); b; b = enumerator.MoveNext())
            {
                System.Collections.DictionaryEntry entry = ((System.Collections.DictionaryEntry)(enumerator.Current));
                if ((entry.Key != null))
                {
                    this.Publicites.AddByEntityKey(entry.Key.ToString());
                }
            }
        }
        
        public virtual void SetPublicites(object values)
        {
            if ((values == null))
            {
                return;
            }
            System.Collections.IDictionary dictionary = null;
dictionary = values as System.Collections.IDictionary;
            if ((dictionary != null))
            {
                this.SetPublicites(dictionary);
                return;
            }
            TheSaucisseFactory.MediaCollection publicites = null;
publicites = values as TheSaucisseFactory.MediaCollection;
            if ((publicites != null))
            {
                this._publicites = publicites;
                return;
            }
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.Commerce LoadByEntityKey(string key)
        {
            if ((key == string.Empty))
            {
                return null;
            }
            TheSaucisseFactory.Commerce commerce;
            System.Guid var = ((System.Guid)(ConvertUtilities.ChangeType(key, typeof(System.Guid), CodeFluentPersistence.DefaultGuidValue)));
            commerce = TheSaucisseFactory.Commerce.Load(var);
            return commerce;
        }
        
        protected virtual void ValidateMember(System.Globalization.CultureInfo culture, string memberName, System.Collections.Generic.IList<CodeFluent.Runtime.CodeFluentValidationException> results)
        {
        }
        
        public TheSaucisseFactory.Commerce Clone(bool deep)
        {
            TheSaucisseFactory.Commerce commerce = new TheSaucisseFactory.Commerce();
            this.CopyTo(commerce, deep);
            return commerce;
        }
        
        public TheSaucisseFactory.Commerce Clone()
        {
            TheSaucisseFactory.Commerce localClone = this.Clone(true);
            return localClone;
        }
        
        object System.ICloneable.Clone()
        {
            object localClone = this.Clone();
            return localClone;
        }
        
        public virtual void CopyFrom(System.Collections.IDictionary dict, bool deep)
        {
            if ((dict == null))
            {
                throw new System.ArgumentNullException("dict");
            }
            if ((dict.Contains("Id") == true))
            {
                this.Id = ((System.Guid)(ConvertUtilities.ChangeType(dict["Id"], typeof(System.Guid), CodeFluentPersistence.DefaultGuidValue)));
            }
            if ((dict.Contains("Url") == true))
            {
                this.Url = ((string)(ConvertUtilities.ChangeType(dict["Url"], typeof(string), default(string))));
            }
            if ((dict.Contains("Nom") == true))
            {
                this.Nom = ((string)(ConvertUtilities.ChangeType(dict["Nom"], typeof(string), default(string))));
            }
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.CopyFrom, false, dict));
        }
        
        public virtual void CopyTo(TheSaucisseFactory.Commerce commerce, bool deep)
        {
            if ((commerce == null))
            {
                throw new System.ArgumentNullException("commerce");
            }
            commerce.Id = this.Id;
            commerce.Url = this.Url;
            commerce.Nom = this.Nom;
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.CopyTo, false, commerce));
        }
        
        public virtual void CopyTo(System.Collections.IDictionary dict, bool deep)
        {
            if ((dict == null))
            {
                throw new System.ArgumentNullException("dict");
            }
            dict["Id"] = this.Id;
            dict["Url"] = this.Url;
            dict["Nom"] = this.Nom;
            this.OnEntityAction(new CodeFluent.Runtime.CodeFluentEntityActionEventArgs(this, CodeFluent.Runtime.CodeFluentEntityAction.CopyTo, false, dict));
        }
        
        protected void OnCollectionKeyChanged(System.Guid key)
        {
            if ((this.KeyChanged != null))
            {
                this.KeyChanged(this, new CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>(key));
            }
        }
        
        [System.Runtime.Serialization.OnSerializingAttribute()]
        protected internal void OnEntitySerializing(System.Runtime.Serialization.StreamingContext context)
        {
            this.IsSerializing = true;
        }
        
        [System.Runtime.Serialization.OnSerializedAttribute()]
        protected internal void OnEntitySerialized(System.Runtime.Serialization.StreamingContext context)
        {
            this.IsSerializing = false;
        }
        
        [System.Runtime.Serialization.OnDeserializedAttribute()]
        protected internal void OnEntityDeserialized(System.Runtime.Serialization.StreamingContext context)
        {
            this.IsDeserializing = false;
            System.Collections.IDictionary relations;
            if ((this._publicites == null))
            {
                this._publicites = new TheSaucisseFactory.MediaCollection();
            }
            relations = ((CodeFluent.Runtime.ICodeFluentSet)(this._publicites)).Relations;
            relations.Clear();
            CodeFluent.Runtime.Utilities.ConvertUtilities.Copy(this._cf_rt_publicitesRelations, relations);
        }
        
        [System.Runtime.Serialization.OnDeserializingAttribute()]
        protected internal void OnEntityDeserializing(System.Runtime.Serialization.StreamingContext context)
        {
            this.IsDeserializing = true;
            this._raisePropertyChangedEvents = true;
            this._id = CodeFluentPersistence.DefaultGuidValue;
            this._nom = default(string);
            this._url = default(string);
            this._id = System.Guid.NewGuid();
            this._entityState = CodeFluent.Runtime.CodeFluentEntityState.Created;
            this._raisePropertyChangedEvents = true;
        }
    }
}
