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
    public partial interface IMediaService
    {
        
        [System.ServiceModel.OperationContractAttribute()]
        string Validate(TheSaucisseFactory.Media media, string culture);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Delete(TheSaucisseFactory.Media media);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Media Load(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Media LoadById(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool Save(TheSaucisseFactory.Media media);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool SaveByRef(ref TheSaucisseFactory.Media media);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.Media LoadByEntityKey(string key);
        
        [System.ServiceModel.OperationContractAttribute()]
        bool DeleteByKey(System.Guid id);
        
        [System.ServiceModel.OperationContractAttribute()]
        void SaveAll(TheSaucisseFactory.MediaCollection mediaCollection);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.MediaCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.MediaCollection LoadAll();
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.MediaCollection PageLoadPublicitesCommercesByCommerce(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string commerceEntityKey);
        
        [System.ServiceModel.OperationContractAttribute()]
        TheSaucisseFactory.MediaCollection LoadPublicitesCommercesByCommerce(string commerceEntityKey);
    }
}
