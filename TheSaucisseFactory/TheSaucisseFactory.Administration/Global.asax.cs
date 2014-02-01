using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using TheSaucisseFactory.Administration.Code;
using System.Web.Optimization;

namespace TheSaucisseFactory.Administration
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterValueProviderFactories(ValueProviderFactoryCollection factories)
        {
            factories.Add(new EntityValueProviderFactory());
        }

        public static void RegisterBinderProviders(ModelBinderProviderCollection binderProviders)
        {
            binderProviders.Add(new EntityBinder());
        }

        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new System.Web.Mvc.AuthorizeAttribute());
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterDomainRoutes(RouteCollection routes)
        {
            // instruct Mvc to ignore all blob handler requests, from any path
            routes.IgnoreRoute("{*blobhandler}", new { blobhandler = new BlobHandlerRouteConstraint() });

            // add custom view location format
            var razor = ((RazorViewEngine)ViewEngines.Engines.First((e) => typeof(RazorViewEngine).IsAssignableFrom(e.GetType())));
            if (razor == null)
                throw new CodeFluent.Runtime.CodeFluentRuntimeWebException("Only the Razor View Engine is supported");

            var formats = new List<string>(razor.ViewLocationFormats);
            formats.Insert(0, "~/Views/Domain/{0}.cshtml");
            razor.ViewLocationFormats = formats.ToArray();

            // add a route to show views without a dedicated controller (action implemented in Home controller)
            routes.MapRoute("TheSaucisse.ShowView", "Show/{*viewName}", new { controller = "Home", action = "ShowView" });

            // routes are organized for most discriminant routes first

            routes.MapRoute("TheSaucisseFactory.Media", "Domain/Media/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Appartement", "Domain/Appartement/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Batiment", "Domain/Batiment/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Challenge", "Domain/Challenge/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Commerce", "Domain/Commerce/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.GainEnergyCoin", "Domain/GainEnergyCoin/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Mesure", "Domain/Mesure/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Residence", "Domain/Residence/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });

            routes.MapRoute("TheSaucisseFactory.Illustration", "Domain/Illustration/{controller}/{action}/{*params}",
                new { controller = "Home", action = "Index" }, new string[] { "TheSaucisseFactory.Web" });
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterValueProviderFactories(ValueProviderFactories.Factories);
            RegisterBinderProviders(ModelBinderProviders.BinderProviders);
            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterDomainRoutes(RouteTable.Routes);
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            BundleTable.Bundles.GetBundleFor("~/Content/css").Include("~/Content/cf-mvc.css");
        }
    }
}