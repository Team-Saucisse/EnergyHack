﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
// CodeFluent Entities generated (http://www.softfluent.com). Date: .
namespace TheSaucisseFactory.Web
{
	
    [System.CodeDom.Compiler.GeneratedCodeAttribute("CodeFluent Entities", "1.0.01234.05678")]
    public partial class TheSaucisseFactoryBitsServer: CodeFluent.Runtime.BinaryServices.BitsServer
    {
		private static TheSaucisseFactoryBitsServer _current;

		public TheSaucisseFactoryBitsServer()
			:this(CodeFluent.Runtime.CodeFluentContext.Get(TheSaucisseFactory.Constants.TheSaucisseFactoryStoreName))
		{
		}
		
		public TheSaucisseFactoryBitsServer(CodeFluent.Runtime.CodeFluentContext context)
			:base(context)
		{
		}

        protected override void OnInformation(object ctx)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");
                
            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
			string entityTypeName;
			string propertyName;
			string entityKey;
			ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
			
			if (entityTypeName == "TheSaucisseFactory.Media")
			{
				
				if (propertyName == "Fichier")
				{
					TheSaucisseFactory.Media entity = TheSaucisseFactory.Media.LoadByEntityKey(entityKey);
					if (entity != null)
					{
						OnInformation(context, entity.Fichier);
						return;
					}
					throw new System.InvalidOperationException(TheSaucisseFactory.Resources.Manager.GetStringWithDefault("bitsServerEntityNotFound", "Entity of type '{0}' with entity key '{1}' was not found.", new object[]{entityTypeName, entityKey}));
				}
				
			}
			
			throw new System.InvalidOperationException(TheSaucisseFactory.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }

        protected override long OnDownload(object ctx, long start, long end)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");
                
            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
			string entityTypeName;
			string propertyName;
			string entityKey;
			ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
			
			if (entityTypeName == "TheSaucisseFactory.Media")
			{
				
				if (propertyName == "Fichier")
				{
					TheSaucisseFactory.Media entity = TheSaucisseFactory.Media.LoadByEntityKey(entityKey);
					if (entity != null)
					{
						return OnDownload(context, entity.Fichier, start, end);
					}
					throw new System.InvalidOperationException(TheSaucisseFactory.Resources.Manager.GetStringWithDefault("bitsServerEntityNotFound", "Entity of type '{0}' with entity key '{1}' was not found.", new object[]{entityTypeName, entityKey}));
				}
				
			}
			
			throw new System.InvalidOperationException(TheSaucisseFactory.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }
		
		protected override void OnSessionClose(object ctx, CodeFluent.Runtime.BinaryServices.Session session)
        {
            if (ctx == null)
                throw new System.ArgumentNullException("ctx");

            if (session == null)
                throw new System.ArgumentNullException("session");

            if (!OnSessionChange(session, CodeFluent.Runtime.BinaryServices.SessionChangeType.Closing, ctx, true, null))
                return;

            System.Net.HttpListenerContext context = (System.Net.HttpListenerContext)ctx;
            
            string entityTypeName;
            string propertyName;
            string entityKey;
            ParseUri(context.Request.Url, out entityTypeName, out propertyName, out entityKey);
            OnSessionClose(context, session, entityTypeName, propertyName, entityKey);
            OnSessionChange(session, CodeFluent.Runtime.BinaryServices.SessionChangeType.Closed, ctx, false, null);
        }
        
        protected virtual void OnSessionClose(System.Net.HttpListenerContext context, CodeFluent.Runtime.BinaryServices.Session session, string entityTypeName, string propertyName, string entityKey)
        {
			
			if (entityTypeName == "TheSaucisseFactory.Media")
			{
				
				if (propertyName == "Fichier")
				{
					TheSaucisseFactory.Media entity = TheSaucisseFactory.Media.LoadByEntityKey(entityKey);
					if (entity != null)
					{
						CloseSession(context, entity.Fichier, session);
						return;
					}
				}
				
			}
			
			throw new System.InvalidOperationException(TheSaucisseFactory.Resources.Manager.GetStringWithDefault("bitsServerInvalidUrl", "Invalid url '{0}'.", new object[]{context.Request.Url}));
        }

		public static TheSaucisseFactoryBitsServer Current
		{
			get
			{
				if (_current == null)
				{
					_current = new TheSaucisseFactoryBitsServer();
				}
				return _current;
			}
		}
    }
	
}
