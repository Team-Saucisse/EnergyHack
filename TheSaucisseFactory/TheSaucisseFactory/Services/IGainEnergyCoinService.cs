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
    
    
    // CodeFluent Entities generated (http://www.softfluent.com). Date: .
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    [System.ServiceModel.ServiceContractAttribute(Namespace="http://schemas.thesaucissefactory.com")]
    public partial interface IGainEnergyCoinService
    {
        
        [System.ServiceModel.OperationContractAttribute()]
        string Validate(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin, string culture);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Delete(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoin Load(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoin LoadById(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Save(TheSaucisseFactory.GainEnergyCoin gainEnergyCoin);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool SaveByRef(ref TheSaucisseFactory.GainEnergyCoin gainEnergyCoin);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoin LoadByEntityKey(string key);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool DeleteByKey(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        void SaveAll(TheSaucisseFactory.GainEnergyCoinCollection gainEnergyCoinCollection);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection LoadAll();
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection PageLoadByAppartement(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string appartementEntityKey);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection LoadByAppartement(string appartementEntityKey);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection PageLoadByChallenge(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string challengeEntityKey);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection LoadByChallenge(string challengeEntityKey);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection PageLoadByAppartementDateRange(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string appartementEntityKey, System.DateTime date);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.GainEnergyCoinCollection LoadByAppartementDateRange(string appartementEntityKey, System.DateTime date);
    }
}
