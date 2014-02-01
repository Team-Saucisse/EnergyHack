using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using CodeFluent.Runtime;
using CodeFluent.Runtime.Model;
using PagedList;

namespace TheSaucisseFactory.Web
{
    public partial class MesureController : Controller
    {
        public virtual ActionResult Index(string currentFilter, string searchString, int? page)
        {
            // On commence par charger tout
			
			IEnumerable<TheSaucisseFactory.Mesure> l_items = TheSaucisseFactory.MesureCollection.LoadAll();

			
			
            int pageSize = int.Parse(WebConfigurationManager.AppSettings["ListMaxSize"]);
            int pageNumber = (page ?? 1);
            
            return View("Mesure/Index", l_items.ToPagedList(pageNumber, pageSize));
        }

        public virtual ActionResult Details(string entityKey)
        {
            TheSaucisseFactory.Mesure entity = TheSaucisseFactory.Mesure.LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return new EmptyResult();
			}
				
            return View("Mesure/Details", entity);
        }
		
        public virtual ActionResult Create()
        {
            // Sauvegarde de l'url de celui qui demande une création
            TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester = Request.UrlReferrer;
            
            TheSaucisseFactory.Mesure entity = new TheSaucisseFactory.Mesure();
            return View("Mesure/Create", entity);
        }
		
		[HttpPost]
        public virtual ActionResult Create(TheSaucisseFactory.Mesure entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("Mesure/Create", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("Mesure/Create", entity);
			}


			// Redirection si possible vers l'Url ayant demandé la modif, sinon, vers l'index
            if (TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester != null)
            {
                return Redirect(TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester.ToString());
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
		
		
        public virtual ActionResult Edit(string entityKey)
        {
            // Sauvegarde de l'url de celui qui demande une modification
            TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester = Request.UrlReferrer;

            TheSaucisseFactory.Mesure entity = TheSaucisseFactory.Mesure.LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return RedirectToAction("Index");
			}
				
            // Stocker en session l'identifiant du marché en modification
            // pour filtrer les images dans le navigateur d'images de l'éventuel éditeur de texte riche
            TheSaucisseFactory.Administration.SessionHelper.ContenuInModificationId = entity.Id;
            return View("Mesure/Edit", entity);
        }
		
		[HttpPost]
        public virtual ActionResult Edit(string entityKey, TheSaucisseFactory.Mesure entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("Mesure/Edit", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("Mesure/Edit", entity);
			}

			// Redirection si possible vers l'Url ayant demandé la modif, sinon, vers l'index
            if (TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester != null)
            {
                return Redirect(TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester.ToString());
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        /// <summary>
        /// Action de suppression de l'élément ayant l'id spécifié
        /// </summary>
        /// <param name="entityKey">Identifiant de l'élément</param>
        /// <returns>Vue index avec éventuelle erreur</returns>
		
        public virtual ActionResult Delete(string entityKey)
        {
            EntityDescriptor ed = ProjectDescriptor.Current.GetEntityDescriptor(typeof(TheSaucisseFactory.Mesure), true);
            try
            {
                ed.DeleteByEntityKey(entityKey, null);
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                // cas d'une contrainte d'intégrité violée
                if (e.Message.StartsWith("The DELETE statement conflicted with"))
                {
                    TempData["Error"] = "global::Resources.WebResources.DeleteNotAllowed /" + e.ToString();
                }
                else
                {
                    TempData["Error"] = "global::Resources.WebResources.DBErrorDeleteItem /" + e.ToString();
                }
            }
            return RedirectToAction("Index");
        }

        
	}
}