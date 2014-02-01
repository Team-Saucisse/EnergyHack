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
    [CodeFluent.Runtime.BinaryServices.BitsServerAttribute(typeof(TheSaucisseFactory.Web.TheSaucisseFactoryBitsServer))]
    public partial class MediaService : TheSaucisseFactory.Services.IMediaService, CodeFluent.Runtime.BinaryServices.ICodeFluentBinaryService
    {
        
        private static CodeFluent.Runtime.BinaryServices.WcfServer _cf_rt_wcfServer = new CodeFluent.Runtime.BinaryServices.WcfServer("MediaService");
        
        public virtual string Validate(TheSaucisseFactory.Media media, string culture)
        {
            System.Globalization.CultureInfo cultureInfo = ConvertUtilities.ToCultureInfo(culture);
            TheSaucisseFactory.Media media1 = media;
            if ((media1 == null))
            {
                return default(string);
            }
            return media1.Validate(cultureInfo);
        }
        
        public virtual bool Delete(TheSaucisseFactory.Media media)
        {
            TheSaucisseFactory.Media media1 = media;
            if ((media1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return media1.Delete();
        }
        
        public virtual TheSaucisseFactory.Media Load(System.Guid id)
        {
            return TheSaucisseFactory.Media.Load(id);
        }
        
        public virtual TheSaucisseFactory.Media LoadById(System.Guid id)
        {
            return TheSaucisseFactory.Media.LoadById(id);
        }
        
        public virtual bool Save(TheSaucisseFactory.Media media)
        {
            TheSaucisseFactory.Media media1 = media;
            if ((media1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return media1.Save();
        }
        
        public virtual bool SaveByRef(ref TheSaucisseFactory.Media media)
        {
            TheSaucisseFactory.Media media1 = media;
            if ((media1 == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            bool ret = media1.Save();
            media = media1;
            return ret;
        }
        
        public virtual TheSaucisseFactory.Media LoadByEntityKey(string key)
        {
            return TheSaucisseFactory.Media.LoadByEntityKey(key);
        }
        
        public virtual bool DeleteByKey(System.Guid id)
        {
            TheSaucisseFactory.Media media = TheSaucisseFactory.Media.Load(id);
            if ((media == null))
            {
                return CodeFluentPersistence.DefaultBooleanValue;
            }
            return media.Delete();
        }
        
        public virtual void SaveAll(TheSaucisseFactory.MediaCollection mediaCollection)
        {
            TheSaucisseFactory.MediaCollection mediaCollection1 = mediaCollection;
            mediaCollection1.SaveAll();
        }
        
        public virtual TheSaucisseFactory.MediaCollection PageLoadAll(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions)
        {
            return TheSaucisseFactory.MediaCollection.PageLoadAll(pageIndex, pageSize, pageOptions);
        }
        
        public virtual TheSaucisseFactory.MediaCollection LoadAll()
        {
            return TheSaucisseFactory.MediaCollection.LoadAll();
        }
        
        public virtual TheSaucisseFactory.MediaCollection PageLoadPublicitesCommercesByCommerce(int pageIndex, int pageSize, CodeFluent.Runtime.PageOptions pageOptions, string commerceEntityKey)
        {
            if ((commerceEntityKey == null))
            {
                throw new System.ArgumentNullException("commerceEntityKey");
            }
            TheSaucisseFactory.Commerce commerce = TheSaucisseFactory.Commerce.LoadByEntityKey(commerceEntityKey);
            return TheSaucisseFactory.MediaCollection.PageLoadPublicitesCommercesByCommerce(pageIndex, pageSize, pageOptions, commerce);
        }
        
        public virtual TheSaucisseFactory.MediaCollection LoadPublicitesCommercesByCommerce(string commerceEntityKey)
        {
            if ((commerceEntityKey == null))
            {
                throw new System.ArgumentNullException("commerceEntityKey");
            }
            TheSaucisseFactory.Commerce commerce = TheSaucisseFactory.Commerce.LoadByEntityKey(commerceEntityKey);
            return TheSaucisseFactory.MediaCollection.LoadPublicitesCommercesByCommerce(commerce);
        }
        
        public virtual CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage LoadFichier(CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage request)
        {
            if ((request == null))
            {
                throw new System.ArgumentNullException("request");
            }
            TheSaucisseFactory.Media media = TheSaucisseFactory.Media.LoadByEntityKey(request.EntityKey);
            if ((media == null))
            {
                return new CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage(request);
            }
            return MediaService._cf_rt_wcfServer.Load(media.Fichier, request);
        }
        
        public virtual CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage SaveFichier(CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage request)
        {
            if ((request == null))
            {
                throw new System.ArgumentNullException("request");
            }
            TheSaucisseFactory.Media media = TheSaucisseFactory.Media.LoadByEntityKey(request.EntityKey);
            if ((media == null))
            {
                return new CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage(request);
            }
            return MediaService._cf_rt_wcfServer.Save(media.Fichier, request);
        }
        
        CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage CodeFluent.Runtime.BinaryServices.ICodeFluentBinaryService.Load(CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage request)
        {
            if ((request == null))
            {
                throw new System.ArgumentNullException("request");
            }
            if ((request.PropertyName == "Fichier"))
            {
                return this.LoadFichier(request);
            }
            throw new System.NotSupportedException();
        }
        
        CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage CodeFluent.Runtime.BinaryServices.ICodeFluentBinaryService.Save(CodeFluent.Runtime.BinaryServices.BinaryLargeObjectMessage request)
        {
            if ((request == null))
            {
                throw new System.ArgumentNullException("request");
            }
            if ((request.PropertyName == "Fichier"))
            {
                return this.SaveFichier(request);
            }
            throw new System.NotSupportedException();
        }
    }
}
