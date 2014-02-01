﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré par un outil.
//     Version du runtime :
//
//     Les modifications apportées à ce fichier peuvent provoquer un comportement incorrect et seront perdues si
//     le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheSaucisseFactory.Services
{
    using CodeFluent.Runtime;
    using CodeFluent.Runtime.Utilities;
    
    
    // CodeFluent Entities generated .
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    public partial class ResidenceService : TheSaucisseFactory.Services.IResidenceService
    {
        
        public virtual string Validate(TheSaucisseFactory.Residence residence, string culture)
        {
            System.Globalization.CultureInfo cultureInfo = ConvertUtilities.ToCultureInfo(culture);
            TheSaucisseFactory.Residence residence1 = residence;
            if ((residence1 == null))
            {
                return default(string);
            }
            return residence1.Validate(cultureInfo);
        }
        
        public virtual bool Delete(TheSaucisseFactory.Residence residence)
        {
            TheSaucisseFactory.Residence residence1 = residence;
            if ((residence1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return residence1.Delete();
        }
        
        public virtual TheSaucisseFactory.Residence Load(System.Guid id)
        {
            return TheSaucisseFactory.Residence.Load(id);
        }
        
        public virtual TheSaucisseFactory.Residence LoadById(System.Guid id)
        {
            return TheSaucisseFactory.Residence.LoadById(id);
        }
        
        public virtual bool Save(TheSaucisseFactory.Residence residence)
        {
            TheSaucisseFactory.Residence residence1 = residence;
            if ((residence1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return residence1.Save();
        }
        
        public virtual bool SaveByRef(ref TheSaucisseFactory.Residence residence)
        {
            TheSaucisseFactory.Residence residence1 = residence;
            if ((residence1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            bool ret = residence1.Save();
            residence = residence1;
            return ret;
        }
        
        public virtual TheSaucisseFactory.Residence LoadByEntityKey(string key)
        {
            return TheSaucisseFactory.Residence.LoadByEntityKey(key);
        }
        
        public virtual bool DeleteByKey(System.Guid id)
        {
            TheSaucisseFactory.Residence residence = TheSaucisseFactory.Residence.Load(id);
            if ((residence == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return residence.Delete();
        }
        
        public virtual void SaveAll(TheSaucisseFactory.ResidenceCollection residenceCollection)
        {
            TheSaucisseFactory.ResidenceCollection residenceCollection1 = residenceCollection;
            residenceCollection1.SaveAll();
        }
        
        public virtual TheSaucisseFactory.ResidenceCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
        {
            return TheSaucisseFactory.ResidenceCollection.PageLoadAll(pageIndex, pageSize, pageOptions);
        }
        
        public virtual TheSaucisseFactory.ResidenceCollection LoadAll()
        {
            return TheSaucisseFactory.ResidenceCollection.LoadAll();
        }
    }
}