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
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(TheSaucisseFactory.Challenge))]
    [System.Runtime.Serialization.CollectionDataContractAttribute(Namespace="http://schemas.thesaucissefactory.com", ItemName="Challenge")]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(TheSaucisseFactory.Challenge))]
    public partial class ChallengeCollection : System.Collections.IList, System.Collections.ICollection, CodeFluent.Runtime.ICodeFluentSet, System.Collections.Generic.IList<TheSaucisseFactory.Challenge>, System.Collections.Generic.ICollection<TheSaucisseFactory.Challenge>, System.ComponentModel.IRaiseItemChangedEvents, System.ICloneable, System.ComponentModel.INotifyPropertyChanged, System.Collections.Specialized.INotifyCollectionChanged, System.ComponentModel.IBindingList, System.ComponentModel.ICancelAddNew
    {
        
        private bool _raisePropertyChangedEvents = true;
        
        private bool _raiseCollectionChangedEvents = true;
        
        [System.NonSerializedAttribute()]
        private System.Collections.Generic.List<TheSaucisseFactory.Challenge> _baseList = new System.Collections.Generic.List<TheSaucisseFactory.Challenge>();
        
        [System.NonSerializedAttribute()]
        private System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Challenge> _baseTable = new System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Challenge>();
        
        [System.NonSerializedAttribute()]
        private System.Collections.Hashtable _relations = new System.Collections.Hashtable();
        
        private int _maxCount = 2147483647;
        
        [System.NonSerializedAttribute()]
        private int _addNewPos = -1;
        
        [System.NonSerializedAttribute()]
        private CodeFluent.Runtime.Utilities.BindingListManager<TheSaucisseFactory.Challenge> _blm1922347233;
        
        private bool _raiseListChangedEvents = true;
        
        private System.Collections.Specialized.NotifyCollectionChangedEventHandler _h2943838991;

        event System.Collections.Specialized.NotifyCollectionChangedEventHandler System.Collections.Specialized.INotifyCollectionChanged.CollectionChanged{add{_h2943838991+=value;}remove{_h2943838991-=value;}}
        
        public ChallengeCollection()
        {
            this._blm1922347233 = new CodeFluent.Runtime.Utilities.BindingListManager<TheSaucisseFactory.Challenge>(this);
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
        protected System.Collections.Generic.List<TheSaucisseFactory.Challenge> BaseList
        {
            get
            {
                return this._baseList;
            }
        }
        
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        protected System.Collections.Generic.Dictionary<System.Guid, TheSaucisseFactory.Challenge> BaseTable
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
        
        public TheSaucisseFactory.Challenge this[int index]
        {
            get
            {
                return ((TheSaucisseFactory.Challenge)(this.BaseList[index]));
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
                this.BaseList[index] = ((TheSaucisseFactory.Challenge)(value));
            }
        }
        
        public TheSaucisseFactory.Challenge this[System.Guid id]
        {
            get
            {
                if ((id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
                {
                    throw new System.ArgumentNullException("id");
                }
                TheSaucisseFactory.Challenge i = this.TryGetValue(id);
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
                    TheSaucisseFactory.Challenge challenge = this.TryGetValue(id);
                    if ((challenge != null))
                    {
                        this.Remove(challenge);
                    }
                    return;
                }
                TheSaucisseFactory.Challenge existing = this.TryGetValue(value.Id);
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
                return this._blm1922347233.AllowEdit;
            }
        }
        
        bool System.ComponentModel.IBindingList.AllowNew
        {
            get
            {
                return this._blm1922347233.AllowNew;
            }
        }
        
        bool System.ComponentModel.IBindingList.AllowRemove
        {
            get
            {
                return this._blm1922347233.AllowRemove;
            }
        }
        
        bool System.ComponentModel.IBindingList.IsSorted
        {
            get
            {
                return this._blm1922347233.IsSorted;
            }
        }
        
        System.ComponentModel.ListSortDirection System.ComponentModel.IBindingList.SortDirection
        {
            get
            {
                return this._blm1922347233.SortDirection;
            }
        }
        
        System.ComponentModel.PropertyDescriptor System.ComponentModel.IBindingList.SortProperty
        {
            get
            {
                return this._blm1922347233.SortProperty;
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
                return this._blm1922347233.SupportsSearching;
            }
        }
        
        bool System.ComponentModel.IBindingList.SupportsSorting
        {
            get
            {
                return this._blm1922347233.SupportsSorting;
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
        
        protected virtual void Relate(TheSaucisseFactory.Challenge item, CodeFluent.Runtime.CodeFluentRelationType relationType)
        {
            ((CodeFluent.Runtime.ICodeFluentSet)(this)).Relations[item] = relationType;
        }
        
        public int Add(TheSaucisseFactory.Challenge challenge)
        {
            int localAdd = this.BaseList.Count;
            this.BaseAdd(challenge);
            return localAdd;
        }
        
        protected virtual int BaseAdd(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                throw new System.ArgumentNullException("challenge");
            }
            if ((challenge.Id.Equals(CodeFluentPersistence.DefaultGuidValue) == true))
            {
                CodeFluent.Runtime.CodeFluentRuntimeException.Throw("invalidEntityKey", "Id", "challenge", "TheSaucisseFactory.Challenge");
            }
            try
            {
                this.BaseTable.Add(challenge.Id, challenge);
            }
            catch (System.ArgumentNullException ane)
            {
                throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ChallengeCollection", challenge.EntityKey), ane);
            }
            catch (System.ArgumentException ae)
            {
                throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ChallengeCollection", challenge.Id), ae);
            }
            challenge.KeyChanged += new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
            int localAdd = this.BaseList.Count;
            this.BaseList.Add(challenge);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Add, challenge, localAdd));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemAdded, localAdd));
            return localAdd;
        }
        
        int System.Collections.IList.Add(object value)
        {
            TheSaucisseFactory.Challenge challenge = null;
            try
            {
                challenge = ((TheSaucisseFactory.Challenge)(value));
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
            if ((challenge == null))
            {
                throw new System.ArgumentException("value");
            }
            int localAdd = this.Add(challenge);
            return localAdd;
        }
        
        void System.Collections.Generic.ICollection<TheSaucisseFactory.Challenge>.Add(TheSaucisseFactory.Challenge challenge)
        {
            this.BaseAdd(challenge);
        }
        
        public virtual TheSaucisseFactory.Challenge AddByEntityKey(string key)
        {
            TheSaucisseFactory.Challenge challenge = TheSaucisseFactory.Challenge.LoadByEntityKey(key);
            if (((challenge != null) 
                        && (this.Contains(challenge) == false)))
            {
                this.Add(challenge);
            }
            return challenge;
        }
        
        public void Sort()
        {
            this.Sort(null);
        }
        
        public virtual void Sort(System.Collections.Generic.IComparer<TheSaucisseFactory.Challenge> comparer)
        {
            this.BaseList.Sort(comparer);
        }
        
        public void CopyTo(TheSaucisseFactory.Challenge[] array, int index)
        {
            this.BaseCopyTo(array, index);
        }
        
        protected virtual void BaseCopyTo(TheSaucisseFactory.Challenge[] array, int index)
        {
            this.BaseList.CopyTo(array, index);
        }
        
        void System.Collections.ICollection.CopyTo(System.Array array, int index)
        {
            CodeFluent.Runtime.Utilities.ConvertUtilities.CopyTo(this, array, index);
        }
        
        public bool Contains(TheSaucisseFactory.Challenge challenge)
        {
            bool localContains = this.BaseContains(challenge);
            return localContains;
        }
        
        protected virtual bool BaseContains(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                return false;
            }
            bool localContains = this.BaseTable.ContainsKey(challenge.Id);
            return localContains;
        }
        
        bool System.Collections.IList.Contains(object value)
        {
            TheSaucisseFactory.Challenge challenge;
			challenge = value as TheSaucisseFactory.Challenge;
            return this.Contains(challenge);
        }
        
        public int IndexOf(TheSaucisseFactory.Challenge challenge)
        {
            int localIndexOf = this.BaseIndexOf(challenge);
            return localIndexOf;
        }
        
        protected virtual int BaseIndexOf(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                return -1;
            }
            int localIndexOf = this.BaseList.IndexOf(challenge);
            return localIndexOf;
        }
        
        int System.Collections.IList.IndexOf(object value)
        {
            TheSaucisseFactory.Challenge challenge;
			challenge = value as TheSaucisseFactory.Challenge;
            return this.IndexOf(challenge);
        }
        
        public void Insert(int index, TheSaucisseFactory.Challenge challenge)
        {
            this.BaseInsert(index, challenge);
        }
        
        protected virtual void BaseInsert(int index, TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                throw new System.ArgumentNullException("challenge");
            }
            try
            {
                this.BaseTable.Add(challenge.Id, challenge);
            }
            catch (System.ArgumentNullException ane)
            {
                throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ChallengeCollection", challenge.EntityKey), ane);
            }
            catch (System.ArgumentException ae)
            {
                throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ChallengeCollection", challenge.Id), ae);
            }
            this.BaseList.Insert(index, challenge);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Add, challenge, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemAdded, index));
        }
        
        void System.Collections.IList.Insert(int index, object value)
        {
            TheSaucisseFactory.Challenge challenge;
			challenge = value as TheSaucisseFactory.Challenge;
            this.Insert(index, challenge);
        }
        
        public virtual void Clear()
        {
            int index;
            int count = this.Count;
            for (index = 0; (index < count); index = (index + 1))
            {
                TheSaucisseFactory.Challenge Challenge = this[0];
                this.BaseRemove(Challenge);
            }
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Refresh, null));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.Reset, -1));
        }
        
        public bool Remove(TheSaucisseFactory.Challenge challenge)
        {
            return this.BaseRemove(challenge);
        }
        
        protected virtual bool BaseRemove(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                throw new System.ArgumentNullException("challenge");
            }
            int index = this.IndexOf(challenge);
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(((System.ComponentModel.ListChangedType)(CodeFluent.Runtime.Utilities.SortableBindingList<TheSaucisseFactory.Challenge>.ListChangedTypeDeleting)), index));
            bool ret;
            ret = this.BaseList.Remove(challenge);
            challenge.KeyChanged -= new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
            ret = this.BaseTable.Remove(challenge.Id);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Remove, challenge, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemDeleted, index));
            return ret;
        }
        
        void System.Collections.IList.Remove(object value)
        {
            TheSaucisseFactory.Challenge challenge;
			challenge = value as TheSaucisseFactory.Challenge;
            this.Remove(challenge);
        }
        
        public virtual void RemoveAt(int index)
        {
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(((System.ComponentModel.ListChangedType)(CodeFluent.Runtime.Utilities.SortableBindingList<TheSaucisseFactory.Challenge>.ListChangedTypeDeleting)), index));
            TheSaucisseFactory.Challenge challenge = this.BaseList[index];
            if ((challenge != null))
            {
                challenge.KeyChanged -= new System.EventHandler<CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid>>(this.OnItemKeyChanged);
                this.BaseTable.Remove(challenge.Id);
            }
            this.BaseList.RemoveAt(index);
            this.OnCollectionChanged(new CodeFluent.Runtime.Utilities.IndexedCollectionChangeEventArgs(System.ComponentModel.CollectionChangeAction.Remove, challenge, index));
            this.OnListChanged(new System.ComponentModel.ListChangedEventArgs(System.ComponentModel.ListChangedType.ItemDeleted, index));
        }
        
        public virtual System.Collections.Generic.IEnumerator<TheSaucisseFactory.Challenge> GetEnumerator()
        {
            System.Collections.Generic.IEnumerator<TheSaucisseFactory.Challenge> e = this.BaseList.GetEnumerator();
            return e;
        }
        
        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return this.BaseList.GetEnumerator();
        }
        
        private TheSaucisseFactory.Challenge TryGetValue(System.Guid key)
        {
            TheSaucisseFactory.Challenge challenge;
            if ((this.BaseTable.TryGetValue(key, out challenge) == true))
            {
                return challenge;
            }
            return null;
        }
        
        public virtual void SaveAll()
        {
            int index;
            for (index = (this.Count - 1); (index >= 0); index = (index - 1))
            {
                TheSaucisseFactory.Challenge challenge = this[index];
                challenge.Save();
                if ((challenge.EntityState == CodeFluent.Runtime.CodeFluentEntityState.Deleted))
                {
                    this.Remove(challenge);
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
                    TheSaucisseFactory.Challenge challenge = new TheSaucisseFactory.Challenge();
                    ((CodeFluent.Runtime.ICodeFluentEntity)(challenge)).ReadRecord(reader);
                    if ((this.BaseContains(challenge) == false))
                    {
                        this.BaseAdd(challenge);
                        count = (count + 1);
                    }
                    challenge.EntityState = CodeFluent.Runtime.CodeFluentEntityState.Unchanged;
                }
            }
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.ChallengeCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
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
            TheSaucisseFactory.ChallengeCollection ret = new TheSaucisseFactory.ChallengeCollection();
            System.Data.IDataReader reader = null;
            try
            {
                reader = TheSaucisseFactory.ChallengeCollection.PageDataLoadAll(pageOptions);
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
        public static TheSaucisseFactory.ChallengeCollection LoadAll()
        {
            TheSaucisseFactory.ChallengeCollection ret = TheSaucisseFactory.ChallengeCollection.PageLoadAll(int.MinValue, int.MaxValue, null);
            return ret;
        }
        
        public static System.Data.IDataReader PageDataLoadAll(CodeFluent.Runtime.PageOptions pageOptions)
        {
            CodeFluent.Runtime.CodeFluentPersistence persistence = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName).Persistence;
            persistence.CreateStoredProcedureCommand(null, "Challenge", "LoadAll");
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
            System.Data.IDataReader reader = TheSaucisseFactory.ChallengeCollection.PageDataLoadAll(null);
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
        
        public virtual void CopyTo(TheSaucisseFactory.ChallengeCollection collection, bool deep)
        {
            if ((typeof(System.ICloneable).IsAssignableFrom(typeof(TheSaucisseFactory.Challenge)) == false))
            {
                deep = false;
            }
            System.Collections.Generic.IEnumerator<TheSaucisseFactory.Challenge> enumerator = this.GetEnumerator();
            bool b;
            for (b = enumerator.MoveNext(); b; b = enumerator.MoveNext())
            {
                if ((deep == true))
                {
                    collection.Add(((TheSaucisseFactory.Challenge)(((System.ICloneable)(enumerator.Current)).Clone())));
                }
                else
                {
                    collection.Add(enumerator.Current);
                }
            }
        }
        
        public virtual TheSaucisseFactory.ChallengeCollection Clone(bool deep)
        {
            TheSaucisseFactory.ChallengeCollection ret = new TheSaucisseFactory.ChallengeCollection();
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
            this._blm1922347233.AddIndex(property);
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
            TheSaucisseFactory.Challenge add = new TheSaucisseFactory.Challenge();
            System.ComponentModel.AddingNewEventArgs e = new System.ComponentModel.AddingNewEventArgs(add);
            this.OnAddingNew(e);
            add = ((TheSaucisseFactory.Challenge)(e.NewObject));
            if ((add == null))
            {
                add = new TheSaucisseFactory.Challenge();
            }
            add.Id = System.Guid.NewGuid();
            this._addNewPos = this.Add(add);
            return add;
        }
        
        void System.ComponentModel.IBindingList.ApplySort(System.ComponentModel.PropertyDescriptor property, System.ComponentModel.ListSortDirection direction)
        {
            this._blm1922347233.ApplySort(property, direction);
        }
        
        int System.ComponentModel.IBindingList.Find(System.ComponentModel.PropertyDescriptor property, object key)
        {
            return this._blm1922347233.Find(property, key);
        }
        
        void System.ComponentModel.IBindingList.RemoveIndex(System.ComponentModel.PropertyDescriptor property)
        {
            this._blm1922347233.RemoveIndex(property);
        }
        
        void System.ComponentModel.IBindingList.RemoveSort()
        {
            this._blm1922347233.RemoveSort();
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
        
        public void AddRange(System.Collections.Generic.IEnumerable<TheSaucisseFactory.Challenge> collection)
        {
            CodeFluent.Runtime.Utilities.ConvertUtilities.AddRange(this, collection);
        }
        
        private void OnItemKeyChanged(object sender, CodeFluent.Runtime.Utilities.KeyChangedEventArgs<System.Guid> e)
        {
            if ((e == null))
            {
                throw new System.ArgumentNullException("e");
            }
            TheSaucisseFactory.Challenge existing;
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
                    throw new System.ArgumentNullException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.VoidCollectionKey, "TheSaucisseFactory.ChallengeCollection", ((CodeFluent.Runtime.ICodeFluentEntity)(item)).EntityKey), ane);
                }
                catch (System.ArgumentException ae)
                {
                    throw new System.ArgumentException(TheSaucisseFactory.Resources.Manager.GetUserMessage(null, CodeFluent.Runtime.UserExceptionType.ItemAlreadyAdded, "TheSaucisseFactory.ChallengeCollection", item.Key), ae);
                }
                this.BaseTable.Remove(e.OldKey);
            }
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
        public static TheSaucisseFactory.ChallengeCollection PageLoadAll(int pageIndex, int pageSize)
        {
            return TheSaucisseFactory.ChallengeCollection.PageLoadAll(pageIndex, pageSize, null);
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
        public static bool Save(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                return false;
            }
            bool ret = challenge.Save();
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, true)]
        public static bool Insert(TheSaucisseFactory.Challenge challenge)
        {
            bool ret = TheSaucisseFactory.Challenge.Save(challenge);
            return ret;
        }
        
        [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
        public static bool Delete(TheSaucisseFactory.Challenge challenge)
        {
            if ((challenge == null))
            {
                return false;
            }
            bool ret = challenge.Delete();
            return ret;
        }
    }
}
