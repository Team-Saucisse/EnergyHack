using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TheSaucisseFactory.Administration
{
    /// <summary>
    /// Gère des données en session
    /// </summary>
    public static class SessionHelper
    {
        /// <summary>
        /// Identifiant du contenu en cours de modification
        /// </summary>
        public static Guid? ContenuInModificationId
        {
            get
            {
                return HttpContext.Current.Session["ContenuInModificationId"] as Guid?;
            }

            set
            {
                HttpContext.Current.Session["ContenuInModificationId"] = value;
            }
        }

        /// <summary>
        /// Obtient l'URI à l'origine d'une demande d'édition ou création
        /// </summary>
        public static Uri CreateOrEditRequester
        {
            get
            {
                return HttpContext.Current.Session["CreateOrEditRequester"] as Uri;
            }
            set
            {
                HttpContext.Current.Session["CreateOrEditRequester"] = value;
            }
        }

        /// <summary>
        /// Message page login
        /// </summary>
        public static string SuccessMessage
        {
            get
            {
                if (HttpContext.Current.Session["SuccessMessage"] != null)
                {
                    return HttpContext.Current.Session["SuccessMessage"].ToString();
                }
                return null;
            }
            set
            {
                HttpContext.Current.Session["SuccessMessage"] = value;
            }
        }

        /// <summary>
        /// Message erreur page login
        /// </summary>
        public static string ModelErrorMessage
        {
            get
            {
                if (HttpContext.Current.Session["ModelErrorMessage"] != null)
                {
                    return HttpContext.Current.Session["ModelErrorMessage"].ToString();
                }
                return null;
            }
            set
            {
                HttpContext.Current.Session["ModelErrorMessage"] = value;
            }
        }
    }
}