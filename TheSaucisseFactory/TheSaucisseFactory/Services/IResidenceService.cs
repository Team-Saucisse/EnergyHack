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
    public partial interface IResidenceService
    {
        
        [System.ServiceModel.OperationContractAttribute()]
        string Validate(TheSaucisseFactory.Residence residence, string culture);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Delete(TheSaucisseFactory.Residence residence);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Residence Load(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Residence LoadById(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Save(TheSaucisseFactory.Residence residence);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool SaveByRef(ref TheSaucisseFactory.Residence residence);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Residence LoadByEntityKey(string key);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool DeleteByKey(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        void SaveAll(TheSaucisseFactory.ResidenceCollection residenceCollection);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.ResidenceCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.ResidenceCollection LoadAll();
    }
}
