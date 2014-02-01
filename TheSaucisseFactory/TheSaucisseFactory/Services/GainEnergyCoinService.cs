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
    public partial class GainEnergyCoinService : TheSaucisseFactory.Services.IGainEnergyCoinService
    {
        
        public virtual string Validate(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin, string culture)
        {
            System.Globalization.CultureInfo cultureInfo = ConvertUtilities.ToCultureInfo(culture);
            TheSaucisseFactory.GainEnergyCoin gainEnergyCoin1 = gainEnergyCoin;
            if ((gainEnergyCoin1 == null))
            {
                return default(string);
            }
            return gainEnergyCoin1.Validate(cultureInfo);
        }
        
        public virtual bool Delete(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin)
        {
            TheSaucisseFactory.GainEnergyCoin gainEnergyCoin1 = gainEnergyCoin;
            if ((gainEnergyCoin1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return gainEnergyCoin1.Delete();
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoin Load(System.Guid id)
        {
            return TheSaucisseFactory.GainEnergyCoin.Load(id);
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoin LoadById(System.Guid id)
        {
            return TheSaucisseFactory.GainEnergyCoin.LoadById(id);
        }
        
        public virtual bool Save(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin)
        {
            TheSaucisseFactory.GainEnergyCoin gainEnergyCoin1 = gainEnergyCoin;
            if ((gainEnergyCoin1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return gainEnergyCoin1.Save();
        }
        
        public virtual bool SaveByRef(ref TheSaucisseFactory.GainEnergyCoin gainEnergyCoin)
        {
            TheSaucisseFactory.GainEnergyCoin gainEnergyCoin1 = gainEnergyCoin;
            if ((gainEnergyCoin1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            bool ret = gainEnergyCoin1.Save();
            gainEnergyCoin = gainEnergyCoin1;
            return ret;
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoin LoadByEntityKey(string key)
        {
            return TheSaucisseFactory.GainEnergyCoin.LoadByEntityKey(key);
        }
        
        public virtual bool DeleteByKey(System.Guid id)
        {
            TheSaucisseFactory.GainEnergyCoin gainEnergyCoin = TheSaucisseFactory.GainEnergyCoin.Load(id);
            if ((gainEnergyCoin == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return gainEnergyCoin.Delete();
        }
        
        public virtual void SaveAll(TheSaucisseFactory.GainEnergyCoinCollection gainEnergyCoinCollection)
        {
            TheSaucisseFactory.GainEnergyCoinCollection gainEnergyCoinCollection1 = gainEnergyCoinCollection;
            gainEnergyCoinCollection1.SaveAll();
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
        {
            return TheSaucisseFactory.GainEnergyCoinCollection.PageLoadAll(pageIndex, pageSize, pageOptions);
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection LoadAll()
        {
            return TheSaucisseFactory.GainEnergyCoinCollection.LoadAll();
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection PageLoadByAppartement(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string appartementEntityKey)
        {
            if ((appartementEntityKey == null))
            {
                throw new System.ArgumentNullException("appartementEntityKey");
            }
            TheSaucisseFactory.Appartement appartement = TheSaucisseFactory.Appartement.LoadByEntityKey(appartementEntityKey);
            return TheSaucisseFactory.GainEnergyCoinCollection.PageLoadByAppartement(pageIndex, pageSize, pageOptions, appartement);
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection LoadByAppartement(string appartementEntityKey)
        {
            if ((appartementEntityKey == null))
            {
                throw new System.ArgumentNullException("appartementEntityKey");
            }
            TheSaucisseFactory.Appartement appartement = TheSaucisseFactory.Appartement.LoadByEntityKey(appartementEntityKey);
            return TheSaucisseFactory.GainEnergyCoinCollection.LoadByAppartement(appartement);
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection PageLoadByChallenge(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string challengeEntityKey)
        {
            if ((challengeEntityKey == null))
            {
                throw new System.ArgumentNullException("challengeEntityKey");
            }
            TheSaucisseFactory.Challenge challenge = TheSaucisseFactory.Challenge.LoadByEntityKey(challengeEntityKey);
            return TheSaucisseFactory.GainEnergyCoinCollection.PageLoadByChallenge(pageIndex, pageSize, pageOptions, challenge);
        }
        
        public virtual TheSaucisseFactory.GainEnergyCoinCollection LoadByChallenge(string challengeEntityKey)
        {
            if ((challengeEntityKey == null))
            {
                throw new System.ArgumentNullException("challengeEntityKey");
            }
            TheSaucisseFactory.Challenge challenge = TheSaucisseFactory.Challenge.LoadByEntityKey(challengeEntityKey);
            return TheSaucisseFactory.GainEnergyCoinCollection.LoadByChallenge(challenge);
        }
    }
}
