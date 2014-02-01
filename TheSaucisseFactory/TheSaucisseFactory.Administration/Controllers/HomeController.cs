using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TheSaucisseFactory.Web.Controllers
{
    /// <summary>
    /// Contrôleur de l'accueil
    /// </summary>
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Bienvenue dans l'administration du backoffice TheSaucisseFactory";

            return View();
        }

        public ActionResult ShowView(string viewName)
        {
            return View(viewName);
        }
    }
}
