using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontOffice
{
    public partial class Games : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //1er élément sélectionné par défaut
                m_liGames.Attributes["class"] = "active";
            }
        }

        /// <summary>
        /// Evénnement au clic sur un menu item
        /// Permet d'activer ou de supprimer l'attribut "active"
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MenuItem_SetActive(object sender, EventArgs e)
        {
            LinkButton l_link = (LinkButton)sender;

            if (l_link != null && !string.IsNullOrEmpty(l_link.CommandArgument))
            {
                if (l_link.CommandArgument.Equals("Games"))
                {
                    m_liEcoins.Attributes["class"] = "";
                    m_liGames.Attributes["class"] = "active";
                }
                else
                {
                    m_liEcoins.Attributes["class"] = "active";
                    m_liGames.Attributes["class"] = "";
                }
            }

        }
    }
}