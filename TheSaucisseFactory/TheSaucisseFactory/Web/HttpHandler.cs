﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheSaucisseFactory.Web
{
    using CodeFluent.Runtime;
    using CodeFluent.Runtime.Utilities;
    
    
    // CodeFluent Entities generated (http://www.softfluent.com). Date: .
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    public partial class HttpHandler : CodeFluent.Runtime.Web.UI.BinaryLargeObjectHttpHandler
    {
        
        private CodeFluent.Runtime.CodeFluentContext _context;
        
        public override CodeFluent.Runtime.CodeFluentContext CodeFluentContext
        {
            get
            {
                if ((this._context == null))
                {
                    if ((this.EntityClrFullTypeName == "TheSaucisseFactory.Media"))
                    {
                        this._context = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName);
                        return this._context;
                    }
                    this._context = CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName);
                }
                return this._context;
            }
        }
        
        public override CodeFluent.Runtime.BinaryServices.BinaryLargeObject LoadBinaryLargeObject(System.Web.HttpContext context, string propertyName, object[] identifiersValues)
        {
            if ((this.EntityClrFullTypeName == "TheSaucisseFactory.Media"))
            {
                TheSaucisseFactory.Media Media = TheSaucisseFactory.Media.Load(((System.Guid)(ConvertUtilities.ChangeType(identifiersValues[0], typeof(System.Guid), CodeFluentPersistence.DefaultGuidValue))));
                if ((Media == null))
                {
                    return null;
                }
                if ((propertyName == "Fichier"))
                {
                    return Media.Fichier;
                }
            }
            return null;
        }
    }
}
