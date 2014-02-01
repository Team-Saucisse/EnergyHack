﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//     Version du runtime :
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
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
    [System.Diagnostics.DebuggerDisplayAttribute("Count={Count}")]
    [System.ComponentModel.TypeConverterAttribute(typeof(CodeFluent.Runtime.Design.CollectionTypeConverter))]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(TheSaucisseFactory.Residence))]
    [System.Runtime.Serialization.CollectionDataContractAttribute(Namespace="http://schemas.thesaucissefactory.com", ItemName="Residence")]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(TheSaucisseFactory.Residence))]
    public partial class ResidenceCollection : System.Collections.IList, System.Collections.ICollection, CodeFluent.Runtime.ICodeFluentSet, System.Collections.Generic.IList<TheSaucisseFactory.Residence>, System.Collections.Generic.ICollection<TheSaucisseFactory.Residence>, System.ComponentModel.IRaiseItemChangedEvents, System.ICloneable, System.ComponentModel.INotifyPropertyChanged, System.Collections.Specialized.INotifyCollectionChanged, System.ComponentModel.IBindingList, System.ComponentModel.ICancelAddNew
    {
        
        private bool _raisePropertyChangedEvents = true;
        
        private bool _raiseCollectionChangedEvents = true;
        
        [System.NonSerializedAttribute()]
        private System.Collections.Generic.List<TheSaucisseFactory.Residence> _baseList = new System.Collections.Generic.List<TheSaucisseFactory.Residence>();
        
        [System.NonSerializedAttribute()]
        private System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Residence> _baseTable = new System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Residence>();
        
        [System.NonSerializedAttribute()]
        private System.Collections.Hashtable _relations = new System.Collections.Hashtable();
        
        private int _maxCount = 2147483647;
        
        [System.NonSerializedAttribute()]
        private int _addNewPos = -1;
        
        [System.NonSerializedAttribute()]
        private CodeFluent.Runtime.Utilities.BindingListManager<TheSaucisseFactory.Residence> _blm852431836;
        
        private bool _raiseListChangedEvents = true;
        
        private System.Collections.Specialized.NotifyCollectionChangedEventHandler _h2943838991;

        event System.Collections.Specialized.NotifyCollectionChangedEventHandler System.Collections.Specialized.INotifyCollectionChanged.CollectionChanged{add{_h2943838991+=value;}remove{_h2943838991-=value;}}
        
        public ResidenceCollection()
        {
            this._blm852431836 = new CodeFluent.Runtime.Utilities.BindingListManager<TheSaucisseFactory.Residence>(this);
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
        
        public virtual bool RaiseCollectionChangedEvents
        {
            get
            {
                return this._raiseCollectionChangedEvents;
            }
            set
            {
                this._raiseCollectionChangedEvents = value;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        protected System.Collections.Generic.List<TheSaucisseFactory.Residence> BaseList
        {
            get
            {
                return this._baseList;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        protected System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Residence> BaseTable
        {
            get
            {
                return this._baseTable;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        System.Collections.IDictionary CodeFluent.Runtime.ICodeFluentSet.Relations
        {
            get
            {
                return this._relations;
            }
        }
        
        [System.Xml.Serialization.XmlElementAttribute(IsNullable=false)]
        public virtual int MaxCount
        {
            get
            {
                return this._maxCount;
            }
            set
            {
                this._maxCount = value;
            }
        }
        
        public TheSaucisseFactory.Residence this[int index]
        {
            get
            {
                return ((TheSaucisseFactory.Residence)(this.BaseList[index]));
            }
            set
            {
                this.BaseList[index] = value;
            }
        }
        
        object System.Collections.IList.this[int index]
        {
            get
            {
                object i = this.BaseList[index];
                return i;
            }
            set
            {
                this.BaseList[index] = ((TheSaucisseFactory.Residence)(value));
            }
        }
        
        public TheSaucisseFactory.Residence this[System.Guid id]
        {
            get
            {
                if ((id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
                {
                    throw new System.ArgumentNullException("id");
                }
                TheSaucisseFactory.Residence i = this.TryGetValue(id);
                return i;
            }
            set
            {
                if ((id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
                {
                    throw new System.ArgumentNullException("id");
                }
                if ((value == null))
                {
                    TheSaucisseFactory.Residence residence = this.TryGetValue(id);
                    if ((residence != null))
                    {
                        this.Remove(residence);
                    }
                    return;
                }
                TheSaucisseFactory.Residence existing = this.TryGetValue(value.Id);
                if ((existing != null))
                {
                    this.Remove(existing);
                }
                this.Add(value);
            }
        }
        
        public virtual int Count
        {
            get
            {
                int v = ((System.Collections.IList)(this.BaseList)).Count;
                return v;
            }
        }
        
        public virtual bool IsSynchronized
        {
            get
            {
                bool v = ((System.Collections.IList)(this.BaseList)).IsSynchronized;
                return v;
            }
        }
        
        public virtual object SyncRoot
        {
            get
            {
                object v = ((System.Collections.IList)(this.BaseList)).SyncRoot;
                return v;
            }
        }
        
        public virtual bool IsFixedSize
        {
            get
            {
                bool v = ((System.Collections.IList)(this.BaseList)).IsFixedSize;
                return v;
            }
        }
        
        public virtual bool IsReadOnly
        {
            get
            {
                bool v = ((System.Collections.IList)(this.BaseList)).IsReadOnly;
                return v;
            }
        }
        
        public virtual bool RaiseListChangedEvents
        {
            get
            {
                return this._raiseListChangedEvents;
            }
            set
            {
                this._raiseListChangedEvents = value;
            }
        }
        
        bool System.ComponentModel.IBindingList.AllowEdit
        {
            get
            {
                return this._blm852431836.AllowEdit;
            }
        }
        
        bool System.ComponentModel.IBindingList.AllowNew
        {
            get
            {
                return this._blm852431836.AllowNew;
            }
        }
        
        bool System.ComponentModel.IBindingList.AllowRemove
        {
            get
            {
                return this._blm852431836.AllowRemove;
            }
        }
        
        bool System.ComponentModel.IBindingList.IsSorted
        {
            get
            {
                return this._blm852431836.IsSorted;
            }
        }
        
        System.ComponentModel.ListSortDirection System.ComponentModel.IBindingList.SortDirection
        {
            get
            {
                return this._blm852431836.SortDirection;
            }
        }
        
        System.ComponentModel.PropertyDescriptor System.ComponentModel.IBindingList.SortProperty
        {
            get
            {
                return this._blm852431836.SortProperty;
            }
        }
        
        bool System.ComponentModel.IBindingList.SupportsChangeNotification
        {
            get
            {
                return true;
            }
        }
        
        bool System.ComponentModel.IBindingList.SupportsSearching
        {
            get
            {
                return this._blm852431836.SupportsSearching;
            }
        }
        
        bool System.ComponentModel.IBindingList.SupportsSorting
        {
            get
            {
                return this._blm852431836.SupportsSorting;
            }
        }
        
        bool System.ComponentModel.IRaiseItemChangedEvents.RaisesItemChangedEvents
        {
            get
            {
                return this.RaiseListChangedEvents;
            }
        }
        
        [field:System.NonSerializedAttribute()]
        public event System.ComponentModel.CollectionChangeEventHandler CollectionChanged;
        
        [field:System.NonSerializedAttribute()]
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        [field:System.NonSerializedAttribute()]
        public event System.ComponentModel.AddingNewEventHandler AddingNew;
        
        [field:System.NonSerializedAttribute()]
        public event System.ComponentModel.ListChangedEventHandler ListChanged;
        
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
        
        protected virtual void OnCollectionChanged(System.ComponentModel.CollectionChangeEventArgs e)
        {
            if ((this.RaiseCollectionChangedEvents == false))
            {
                return;
            }
            if ((this.CollectionChanged != null))
            {
                this.CollectionChanged(this, e);
            }
            CodeFluent.Runtime.ServiceModel.CollectionChangeNotifier.Notify(this, e, this._h2943838991);
            this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("Count"));
            this.OnPropertyChanged(new System.ComponentModel.PropertyChangedEventArgs("Item[]"));
        }
        
        protected virtual void Relate(TheSaucisseFactory.Residence item, CodeFluent.Runtime.CodeFluentRelationType relationType)
        {
            ((CodeFluent.Runtime.ICodeFluentSet)(this)).Relations[item] = relationType;
        }
        
        public int Add(TheSaucisseFactory.Residence residence)
        {
            int localAdd = this.BaseList.Count;
            this.BaseAdd(residence);
            return localAdd;
        }
        
        protected virtual int BaseAdd(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                throw new System.ArgumentNullException("residence");
            }
            if ((residence.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                CodeFluent.Runtime.CodeFluentRuntimeException.Throw("invalidEntityKey", "Id", "residence", "TheSaucisseFactory.Residence");
            }
            try
            {
                this.BaseTable.Add(residence.Id, residence);
            }
            catch (System.ArgumentNullException ane)
            {
                throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ResidenceCollection", residence.EntityKey), ane);
            }
            catch (System.ArgumentException ae)
            {
                throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ResidenceCollection", residence.Id), ae);
            }
            residence.KeyChanged += new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
            int localAdd = this.BaseList.Count;
            this.BaseList.Add(residence);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Add, residence, localAdd));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemAdded, localAdd));
            return localAdd;
        }
        
        int System.Collections.IList.Add(object value)
        {
            TheSaucisseFactory.Residence residence = null;
            try
            {
                residence = ((TheSaucisseFactory.Residence)(value));
            }
            catch (System.InvalidCastException )
            {
                string key = null;
                try
                {
                    key = ((string)(value));
                    int count = this.Count;
                    if ((this.AddByEntityKey(key) != null))
                    {
                        return 1;
                    }
                    return 0;
                }
                catch (System.InvalidCastException )
                {
                }
                if ((key == null))
                {
                    throw new System.ArgumentException("value");
                }
            }
            if ((residence == null))
            {
                throw new System.ArgumentException("value");
            }
            int localAdd = this.Add(residence);
            return localAdd;
        }
        
        void System.Collections.Generic.ICollection<TheSaucisseFactory.Residence>.Add(TheSaucisseFactory.Residence residence)
        {
            this.BaseAdd(residence);
        }
        
        public virtual TheSaucisseFactory.Residence AddByEntityKey(string key)
        {
            TheSaucisseFactory.Residence residence = TheSaucisseFactory.Residence.LoadByEntityKey(key);
            if (((residence != null) 
                        && (this.Contains(residence) == false)))
            {
                this.Add(residence);
            }
            return residence;
        }
        
        public void Sort()
        {
            this.Sort(null);
        }
        
        public virtual void Sort(System.Collections.Generic.IComparer<TheSaucisseFactory.Residence> comparer)
        {
            this.BaseList.Sort(comparer);
        }
        
        public void CopyTo(TheSaucisseFactory.Residence[] array, int index)
        {
            this.BaseCopyTo(array, index);
        }
        
        protected virtual void BaseCopyTo(TheSaucisseFactory.Residence[] array, int index)
        {
            this.BaseList.CopyTo(array, index);
        }
        
        void System.Collections.ICollection.CopyTo(System.Array array, int index)
        {
            CodeFluent.Runtime.Utilities.ConvertUtilities.CopyTo(this, array, index);
        }
        
        public bool Contains(TheSaucisseFactory.Residence residence)
        {
            bool localContains = this.BaseContains(residence);
            return localContains;
        }
        
        protected virtual bool BaseContains(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                return false;
            }
            bool localContains = this.BaseTable.ContainsKey(residence.Id);
            return localContains;
        }
        
        bool System.Collections.IList.Contains(object value)
        {
            TheSaucisseFactory.Residence residence;
			residence = value as TheSaucisseFactory.Residence;
            return this.Contains(residence);
        }
        
        public int IndexOf(TheSaucisseFactory.Residence residence)
        {
            int localIndexOf = this.BaseIndexOf(residence);
            return localIndexOf;
        }
        
        protected virtual int BaseIndexOf(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                return -1;
            }
            int localIndexOf = this.BaseList.IndexOf(residence);
            return localIndexOf;
        }
        
        int System.Collections.IList.IndexOf(object value)
        {
            TheSaucisseFactory.Residence residence;
			residence = value as TheSaucisseFactory.Residence;
            return this.IndexOf(residence);
        }
        
        public void Insert(int index, TheSaucisseFactory.Residence residence)
        {
            this.BaseInsert(index, residence);
        }
        
        protected virtual void BaseInsert(int index, TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                throw new System.ArgumentNullException("residence");
            }
            try
            {
                this.BaseTable.Add(residence.Id, residence);
            }
            catch (System.ArgumentNullException ane)
            {
                throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ResidenceCollection", residence.EntityKey), ane);
            }
            catch (System.ArgumentException ae)
            {
                throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ResidenceCollection", residence.Id), ae);
            }
            this.BaseList.Insert(index, residence);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Add, residence, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemAdded, index));
        }
        
        void System.Collections.IList.Insert(int index, object value)
        {
            TheSaucisseFactory.Residence residence;
			residence = value as TheSaucisseFactory.Residence;
            this.Insert(index, residence);
        }
        
        public virtual void Clear()
        {
            int index;
            int count = this.Count;
            for (index = 0; (index < count); index = (index + 1))
            {
                TheSaucisseFactory.Residence Residence = this[0];
                this.BaseRemove(Residence);
            }
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Refresh, null));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.Reset, -1));
        }
        
        public bool Remove(TheSaucisseFactory.Residence residence)
        {
            return this.BaseRemove(residence);
        }
        
        protected virtual bool BaseRemove(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                throw new System.ArgumentNullException("residence");
            }
            int index = this.IndexOf(residence);
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(((System.ComponentModel.ListChangedType)(CodeFluent.Runtime.Utilities.SortableBindingList<TheSaucisseFactory.Residence>.ListChangedTypeDeleting)), index));
            bool ret;
            ret = this.BaseList.Remove(residence);
            residence.KeyChanged -= new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
            ret = this.BaseTable.Remove(residence.Id);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Remove, residence, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemDeleted, index));
            return ret;
        }
        
        void System.Collections.IList.Remove(object value)
        {
            TheSaucisseFactory.Residence residence;
			residence = value as TheSaucisseFactory.Residence;
            this.Remove(residence);
        }
        
        public virtual void RemoveAt(int index)
        {
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(((System.ComponentModel.ListChangedType)(CodeFluent.Runtime.Utilities.SortableBindingList<TheSaucisseFactory.Residence>.ListChangedTypeDeleting)), index));
            TheSaucisseFactory.Residence residence = this.BaseList[index];
            if ((residence != null))
            {
                residence.KeyChanged -= new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
                this.BaseTable.Remove(residence.Id);
            }
            this.BaseList.RemoveAt(index);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Remove, residence, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemDeleted, index));
        }
        
        public virtual System.Collections.Generic.IEnumerator<TheSaucisseFactory.Residence> GetEnumerator()
        {
            System.Collections.Generic.IEnumerator<TheSaucisseFactory.Residence> e = this.BaseList.GetEnumerator();
            return e;
        }
        
        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return this.BaseList.GetEnumerator();
        }
        
        private TheSaucisseFactory.Residence TryGetValue(System.Guid key)
        {
            TheSaucisseFactory.Residence residence;
            if ((this.BaseTable.TryGetValue(key, out residence) == true))
            {
                return residence;
            }
            return null;
        }
        
        public virtual void SaveAll()
        {
            int index;
            for (index = (this.Count - 1); (index >= 0); index = (index - 1))
            {
                TheSaucisseFactory.Residence residence = this[index];
                residence.Save();
                if ((residence.EntityState == CodeFluent.Runtime.CodeFluentEntityState.Deleted))
                {
                    this.Remove(residence);
                }
            }
        }
        
        private void LoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, System.Data.IDataReader reader)
        {
            if ((reader == null))
            {
                throw new System.ArgumentNullException("reader");
            }
            if ((pageIndex < 0))
            {
                pageIndex = 0;
            }
            if ((pageSize < 0))
            {
                if ((pageOptions != null))
                {
                    pageSize = pageOptions.DefaultPageSize;
                }
                else
                {
                    pageSize = int.MaxValue;
                }
            }
            this.BaseList.Clear();
            this.BaseTable.Clear();
            int count = 0;
            int readCount = 0;
            bool readerRead;
            for (readerRead = reader.Read(); ((readerRead == true) 
                        && ((count < this.MaxCount) 
                        && (count < pageSize))); readerRead = reader.Read())
            {
                readCount = (readCount + 1);
                if ((CodeFluent.Runtime.CodeFluentPersistence.CanAddEntity(pageIndex, pageSize, pageOptions, readCount) == true))
                {
                    TheSaucisseFactory.Residence residence = new TheSaucisseFactory.Residence();
                    ((CodeFluent.Runtime.ICodeFluentEntity)(residence)).ReadRecord(reader);
                    if ((this.BaseContains(residence) == false))
                    {
                        this.BaseAdd(residence);
                        count = (count + 1);
                    }
                    residence.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                }
            }
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.ResidenceCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
        {
            if ((pageIndex < 0))
            {
                pageIndex = 0;
            }
            if ((pageSize < 0))
            {
                if ((pageOptions != null))
                {
                    pageSize = pageOptions.DefaultPageSize;
                }
                else
                {
                    pageSize = int.MaxValue;
                }
            }
            TheSaucisseFactory.ResidenceCollection ret = new TheSaucisseFactory.ResidenceCollection();
            System.Data.IDataReader reader = null;
            try
            {
                reader = TheSaucisseFactory.ResidenceCollection.PageDataLoadAll(pageOptions);
                if ((reader == null))
                {
                    return ret;
                }
                ret.LoadAll(pageIndex, pageSize, pageOptions, reader);
            }
            finally
            {
                if ((reader != null))
                {
                    reader.Dispose();
                }
                CodeFluent.Runtime.CodeFluentPersistence.CompleteCommand(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName);
            }
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.ResidenceCollection LoadAll()
        {
            TheSaucisseFactory.ResidenceCollection ret = TheSaucisseFactory.ResidenceCollection.PageLoadAll(int.MinValue, int.MaxValue, null);
            return ret;
        }
        
        public static System.Data.IDataReader PageDataLoadAll(CodeFluent.Runtime.PageOptions pageOptions)
        {
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Residence", "LoadAll");
            if ((pageOptions != null))
            {
                System.Collections.IEnumerator enumerator = pageOptions.OrderByArguments.GetEnumerator();
                bool b;
                int index = 0;
                for (b = enumerator.MoveNext(); b; b = enumerator.MoveNext())
                {
                    CodeFluent.Runtime.OrderByArgument argument = ((CodeFluent.Runtime.OrderByArgument)(enumerator.Current));
                    persistence.AddParameter(string.Format("@_orderBy{0}", index), argument.Name);
                    persistence.AddParameter(string.Format("@_orderByDirection{0}", index), ((int)(argument.Direction)));
                    index = (index + 1);
                }
            }
            System.Data.IDataReader reader = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence.ExecuteReader();
            return reader;
        }
        
        public static System.Data.IDataReader DataLoadAll()
        {
            System.Data.IDataReader reader = TheSaucisseFactory.ResidenceCollection.PageDataLoadAll(null);
            return reader;
        }
        
        protected virtual void BaseTrace(System.CodeDom.Compiler.IndentedTextWriter writer)
        {
            writer.Write("[");
            writer.Write(string.Concat("Count=", this.Count));
            writer.Write("]");
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
        
        public virtual void CopyTo(TheSaucisseFactory.ResidenceCollection collection, bool deep)
        {
            if ((typeof(System.ICloneable).IsAssignableFrom(typeof(TheSaucisseFactory.Residence)) == false))
            {
                deep = false;
            }
            System.Collections.Generic.IEnumerator<TheSaucisseFactory.Residence> enumerator = this.GetEnumerator();
            bool b;
            for (b = enumerator.MoveNext(); b; b = enumerator.MoveNext())
            {
                if ((deep == true))
                {
                    collection.Add(((TheSaucisseFactory.Residence)(((System.ICloneable)(enumerator.Current)).Clone())));
                }
                else
                {
                    collection.Add(enumerator.Current);
                }
            }
        }
        
        public virtual TheSaucisseFactory.ResidenceCollection Clone(bool deep)
        {
            TheSaucisseFactory.ResidenceCollection ret = new TheSaucisseFactory.ResidenceCollection();
            this.CopyTo(ret, deep);
            return ret;
        }
        
        object System.ICloneable.Clone()
        {
            return this.Clone(true);
        }
        
        public virtual void CancelNew(int index)
        {
            if (((this._addNewPos >= 0) 
                        && (this._addNewPos == index)))
            {
                this.RemoveAt(index);
                this._addNewPos = -1;
            }
        }
        
        public virtual void EndNew(int index)
        {
            if (((this._addNewPos >= 0) 
                        && (this._addNewPos == index)))
            {
                this._addNewPos = -1;
            }
        }
        
        void System.ComponentModel.IBindingList.AddIndex(System.ComponentModel.PropertyDescriptor property)
        {
            this._blm852431836.AddIndex(property);
        }
        
        protected virtual void OnAddingNew(System.ComponentModel.AddingNewEventArgs e)
        {
            if ((this.AddingNew != null))
            {
                this.AddingNew(this, e);
            }
        }
        
        object System.ComponentModel.IBindingList.AddNew()
        {
            TheSaucisseFactory.Residence add = new TheSaucisseFactory.Residence();
            System.ComponentModel.AddingNewEventArgs e = new System.ComponentModel.AddingNewEventArgs(add);
            this.OnAddingNew(e);
            add = ((TheSaucisseFactory.Residence)(e.NewObject));
            if ((add == null))
            {
                add = new TheSaucisseFactory.Residence();
            }
            add.Id = System.Guid.NewGuid();
            this._addNewPos = this.Add(add);
            return add;
        }
        
        void System.ComponentModel.IBindingList.ApplySort(System.ComponentModel.PropertyDescriptor property, System.ComponentModel.ListSortDirection direction)
        {
            this._blm852431836.ApplySort(property, direction);
        }
        
        int System.ComponentModel.IBindingList.Find(System.ComponentModel.PropertyDescriptor property, object key)
        {
            return this._blm852431836.Find(property, key);
        }
        
        void System.ComponentModel.IBindingList.RemoveIndex(System.ComponentModel.PropertyDescriptor property)
        {
            this._blm852431836.RemoveIndex(property);
        }
        
        void System.ComponentModel.IBindingList.RemoveSort()
        {
            this._blm852431836.RemoveSort();
        }
        
        protected virtual void OnListChanged(System.ComponentModel.ListChangedEventArgs e)
        {
            if ((e == null))
            {
                throw new System.ArgumentNullException("e");
            }
            if ((this.RaiseListChangedEvents == false))
            {
                return;
            }
            if ((((e.ListChangedType == System.ComponentModel.ListChangedType.Reset) 
                        == false) 
                        && (e.NewIndex < 0)))
            {
                return;
            }
            if ((this.ListChanged != null))
            {
                this.ListChanged(this, e);
            }
        }
        
        public void AddRange(System.Collections.Generic.IEnumerable<TheSaucisseFactory.Residence> collection)
        {
            CodeFluent.Runtime.Utilities.ConvertUtilities.AddRange(this, collection);
        }
        
        private void OnItemKeyChanged(object sender, CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid> e)
        {
            if ((e == null))
            {
                throw new System.ArgumentNullException("e");
            }
            TheSaucisseFactory.Residence existing;
            if ((this.BaseTable.TryGetValue(e.OldKey, out existing) == false))
            {
                return;
            }
            if (((sender != null) 
                        && (typeof(CodeFluent.Runtime.Utilities.IKeyable<System.Guid>).IsAssignableFrom(sender.GetType()) == true)))
            {
                CodeFluent.Runtime.Utilities.IKeyable<System.Guid> item = ((CodeFluent.Runtime.Utilities.IKeyable<System.Guid>)(sender));
                try
                {
                    this.BaseTable.Add(item.Key, existing);
                }
                catch (System.ArgumentNullException ane)
                {
                    throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ResidenceCollection", ((CodeFluent.Runtime.ICodeFluentEntity)(item)).EntityKey), ane);
                }
                catch (System.ArgumentException ae)
                {
                    throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ResidenceCollection", item.Key), ae);
                }
                this.BaseTable.Remove(e.OldKey);
            }
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.ResidenceCollection PageLoadAll(int pageIndex, int pageSize)
        {
            return TheSaucisseFactory.ResidenceCollection.PageLoadAll(pageIndex, pageSize, null);
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static bool Save(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                return false;
            }
            bool ret = residence.Save();
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public static bool Insert(TheSaucisseFactory.Residence residence)
        {
            bool ret = TheSaucisseFactory.Residence.Save(residence);
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static bool Delete(TheSaucisseFactory.Residence residence)
        {
            if ((residence == null))
            {
                return false;
            }
            bool ret = residence.Delete();
            return ret;
        }
    }
}