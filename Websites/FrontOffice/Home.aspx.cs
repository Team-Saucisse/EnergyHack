using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheSaucisseFactory;

namespace FrontOffice
{
    public partial class _Default : System.Web.UI.Page
    {

        public string CurrentAppartement { get { return ((FrontOffice.Site1)Page.Master).CurrentAppartement; } }

        /// <summary>
        /// Chargement de la page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //1er élément sélectionné par défaut
                m_liEcoins.Attributes["class"] = "active";

                SetDataSource();
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

        protected void SetDataSource()
        {
            List<GainEnergyCoin> l_gains = GainEnergyCoinCollection.LoadAll().Where(g => g.AppartementId == new Guid(CurrentAppartement)).ToList();

            ChallengeCollection l_challenges = ChallengeCollection.LoadAll();

            foreach (Challenge l_challenge in l_challenges)
            {
                if (l_challenge.GainsEnergyCoin.Where(g => g.AppartementId == new Guid(CurrentAppartement)).Count() == 0)
                {
                    GainEnergyCoin l_emptyGain = new GainEnergyCoin();
                    l_emptyGain.Quantite = 0;
                    l_emptyGain.Challenge = l_challenge;
                    l_gains.Add(l_emptyGain);
                }
            }

            m_rptChallenges.DataSource = l_gains;
            m_rptChallenges.DataBind();

            
        }

        protected void ChallengesItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                GainEnergyCoin l_gain = (GainEnergyCoin)e.Item.DataItem;

                ((Label)e.Item.FindControl("m_lblChallengeName")).Text = l_gain.Challenge.Nom;
                ((Label)e.Item.FindControl("m_lblChallengeGain")).Text = l_gain.Quantite.ToString();
            }
        }
    }
}