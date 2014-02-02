using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheSaucisseFactory;
using System.Web.Services;


namespace FrontOffice
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!Page.IsPostBack)
			{
				Session.Abandon();

				BatimentCollection l_buildings = BatimentCollection.LoadByResidence(ResidenceCollection.LoadAll().FirstOrDefault());
				m_ddlBuildings.DataSource = l_buildings;
				m_ddlBuildings.DataTextField = "CamelID";
				m_ddlBuildings.DataValueField = "Id";
				m_ddlBuildings.DataBind();

				m_ddlBuildings.Items.Insert(0, new ListItem("Sélectionner un bâtiment...", String.Empty));
			}
        }

		protected void LoginClick(object sender, EventArgs e)
		{
			// récupération et mise en session de la date
			if (!string.IsNullOrEmpty(dateChoice.SelectedValue))
			{
				DateTime l_date = DateTime.Parse(dateChoice.SelectedValue);
				Session["DateCourante"] = l_date;
			}

			Response.Redirect("~/Home.aspx");
		}

        protected void LoadAppartementList(object sender, EventArgs e)
        {
            Guid l_batimentID = new Guid(((DropDownList)(sender)).SelectedValue);
            Batiment l_batiment = Batiment.LoadById(l_batimentID);
            AppartementCollection l_appartements = AppartementCollection.LoadByBatiment(l_batiment);

            m_ddlApparments.DataSource = l_appartements;
            m_ddlApparments.DataTextField = "CamelID";
            m_ddlApparments.DataValueField = "Id";
            m_ddlApparments.DataBind();

            m_ddlApparments.Items.Insert(0, new ListItem("Sélectionner un appartement...", String.Empty));

            m_ddlApparments.Enabled = true;
        }

        protected void SelectedAppartementChanged(object sender, EventArgs e)
        {
            m_password.Enabled = true;
            m_btnLogin.Enabled = true;
            (Page.Master as FrontOffice.Site1).CurrentAppartement = m_ddlApparments.SelectedValue;
        }
    }
}