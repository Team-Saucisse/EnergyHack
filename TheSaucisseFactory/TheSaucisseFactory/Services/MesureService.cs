﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheSaucisseFactory.Services
{
    using CodeFluent.Runtime;
    using CodeFluent.Runtime.Utilities;
    
    
    // CodeFluent Entities generated .
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    public partial class MesureService : TheSaucisseFactory.Services.IMesureService
    {
        
        public virtual string Validate(TheSaucisseFactory.Mesure mesure, string culture)
        {
            System.Globalization.CultureInfo cultureInfo = ConvertUtilities.ToCultureInfo(culture);
            TheSaucisseFactory.Mesure mesure1 = mesure;
            if ((mesure1 == null))
            {
                return default(string);
            }
            return mesure1.Validate(cultureInfo);
        }
        
        public virtual bool Delete(TheSaucisseFactory.Mesure mesure)
        {
            TheSaucisseFactory.Mesure mesure1 = mesure;
            if ((mesure1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return mesure1.Delete();
        }
        
        public virtual TheSaucisseFactory.Mesure Load(System.Guid id)
        {
            return TheSaucisseFactory.Mesure.Load(id);
        }
        
        public virtual TheSaucisseFactory.Mesure LoadById(System.Guid id)
        {
            return TheSaucisseFactory.Mesure.LoadById(id);
        }
        
        public virtual bool Save(TheSaucisseFactory.Mesure mesure)
        {
            TheSaucisseFactory.Mesure mesure1 = mesure;
            if ((mesure1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return mesure1.Save();
        }
        
        public virtual bool SaveByRef(ref TheSaucisseFactory.Mesure mesure)
        {
            TheSaucisseFactory.Mesure mesure1 = mesure;
            if ((mesure1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            bool ret = mesure1.Save();
            mesure = mesure1;
            return ret;
        }
        
        public virtual TheSaucisseFactory.Mesure LoadByEntityKey(string key)
        {
            return TheSaucisseFactory.Mesure.LoadByEntityKey(key);
        }
        
        public virtual bool DeleteByKey(System.Guid id)
        {
            TheSaucisseFactory.Mesure mesure = TheSaucisseFactory.Mesure.Load(id);
            if ((mesure == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return mesure.Delete();
        }
        
        public virtual void SaveAll(TheSaucisseFactory.MesureCollection mesureCollection)
        {
            TheSaucisseFactory.MesureCollection mesureCollection1 = mesureCollection;
            mesureCollection1.SaveAll();
        }
        
        public virtual TheSaucisseFactory.MesureCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
        {
            return TheSaucisseFactory.MesureCollection.PageLoadAll(pageIndex, pageSize, pageOptions);
        }
        
        public virtual TheSaucisseFactory.MesureCollection LoadAll()
        {
            return TheSaucisseFactory.MesureCollection.LoadAll();
        }
        
        public virtual TheSaucisseFactory.MesureCollection PageLoadByAppartement(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string appartementEntityKey)
        {
            if ((appartementEntityKey == null))
            {
                throw new System.ArgumentNullException("appartementEntityKey");
            }
            TheSaucisseFactory.Appartement appartement = TheSaucisseFactory.Appartement.LoadByEntityKey(appartementEntityKey);
            return TheSaucisseFactory.MesureCollection.PageLoadByAppartement(pageIndex, pageSize, pageOptions, appartement);
        }
        
        public virtual TheSaucisseFactory.MesureCollection LoadByAppartement(string appartementEntityKey)
        {
            if ((appartementEntityKey == null))
            {
                throw new System.ArgumentNullException("appartementEntityKey");
            }
            TheSaucisseFactory.Appartement appartement = TheSaucisseFactory.Appartement.LoadByEntityKey(appartementEntityKey);
            return TheSaucisseFactory.MesureCollection.LoadByAppartement(appartement);
        }
    }
}
