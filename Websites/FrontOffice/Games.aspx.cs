using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using TheSaucisseFactory;

namespace FrontOffice
{
    public partial class Games : System.Web.UI.Page
    {
        public string CurrentAppartement { get { return ((FrontOffice.Site1)Page.Master).CurrentAppartement; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(((FrontOffice.Site1)Page.Master).CurrentAppartement))
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                //1er élément sélectionné par défaut
                m_liGames.Attributes["class"] = "active";

                Appartement l_appartement = Appartement.LoadById(new Guid(CurrentAppartement));
                playTank.NavigateUrl = "games/TankOp/index.html?ec=" + l_appartement.SoldeEnergyCoin;
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

        protected void SetEcoinsAmount(object sender, EventArgs e)
        {

        }
    }
}