﻿using System;
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
    public partial class AppartementController : Controller
    {
        public virtual ActionResult Index(string currentFilter, string searchString, int? page)
        {
            // On commence par charger tout
			// avec un tri par nom 
            PageOptions l_pageOptions = new PageOptions();
            l_pageOptions.OrderByArguments = new OrderByArgumentCollection();
            l_pageOptions.OrderByArguments.Add("[Contenu].[Nom]", System.ComponentModel.ListSortDirection.Ascending);
			
			IEnumerable<TheSaucisseFactory.Appartement> l_items = TheSaucisseFactory.AppartementCollection.PageLoadAll(int.MinValue, int.MaxValue, l_pageOptions);

			
            // S'il y a une chaine recherchée...
			if (!string.IsNullOrEmpty(searchString))
            {
				// alors, il faut se re-positionner sur la 1ère page
                page = 1;
            }
            else
            {
				// sinon, il suffit de remettre comme chaine l'éventuel filtre courant
                searchString = currentFilter;
            }

			// On sauvegarde le filtre courant
            ViewBag.CurrentFilter = searchString;
			
			// Et on limitte le résultat à ce filtre
			if (!string.IsNullOrEmpty(searchString))
			{
				l_items = l_items.Where(entity => entity.Nom.ToLower().Contains(searchString.ToLower()));
			}
			
			
            int pageSize = int.Parse(WebConfigurationManager.AppSettings["ListMaxSize"]);
            int pageNumber = (page ?? 1);
            
            return View("Appartement/Index", l_items.ToPagedList(pageNumber, pageSize));
        }

        public virtual ActionResult Details(string entityKey)
        {
            TheSaucisseFactory.Appartement entity = TheSaucisseFactory.Appartement.LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return new EmptyResult();
			}
				
            return View("Appartement/Details", entity);
        }
		
        public virtual ActionResult Create()
        {
            // Sauvegarde de l'url de celui qui demande une création
            TheSaucisseFactory.Administration.SessionHelper.CreateOrEditRequester = Request.UrlReferrer;
            
            TheSaucisseFactory.Appartement entity = new TheSaucisseFactory.Appartement();
            return View("Appartement/Create", entity);
        }
		
		[HttpPost]
        public virtual ActionResult Create(TheSaucisseFactory.Appartement entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("Appartement/Create", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("Appartement/Create", entity);
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

            TheSaucisseFactory.Appartement entity = TheSaucisseFactory.Appartement.LoadByEntityKey(entityKey);
            if (entity == null)
			{
	            return RedirectToAction("Index");
			}
				
            // Stocker en session l'identifiant du marché en modification
            // pour filtrer les images dans le navigateur d'images de l'éventuel éditeur de texte riche
            TheSaucisseFactory.Administration.SessionHelper.ContenuInModificationId = entity.Id;
            return View("Appartement/Edit", entity);
        }
		
		[HttpPost]
        public virtual ActionResult Edit(string entityKey, TheSaucisseFactory.Appartement entity)
        {
            if (entity == null)
			{
                throw new ArgumentNullException("entity");
			}

            if (!ModelState.IsValid)
			{
                return View("Appartement/Edit", entity);
			}

            try
            {
				entity.Save();
            }
            catch (CodeFluentDuplicateException e) // violation d'une contraine "unique"
            {
				TempData["Error"] = e.ToString();
                return View("Appartement/Edit", entity);
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
            EntityDescriptor ed = ProjectDescriptor.Current.GetEntityDescriptor(typeof(TheSaucisseFactory.Appartement), true);
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