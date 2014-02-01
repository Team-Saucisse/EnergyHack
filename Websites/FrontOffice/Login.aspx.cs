using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheSaucisseFactory;


namespace FrontOffice
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BatimentCollection l_buildings = BatimentCollection.LoadByResidence(ResidenceCollection.LoadAll().FirstOrDefault());
                m_ddlBuildings.DataSource = l_buildings;
                m_ddlBuildings.DataTextField = "CamelID";
                m_ddlBuildings.DataValueField = "Id";
                m_ddlBuildings.DataBind();

                if (l_buildings.Count == 1)
                {

                }
            }
        }

        protected void LoadAppartementList(object sender, EventArgs e)
        {
            Guid l_batimentID=new Guid(((DropDownList)(sender)).SelectedValue);
            Batiment l_batiment = Batiment.LoadById(l_batimentID);
            AppartementCollection l_appartements = AppartementCollection.LoadByBatiment(l_batiment);

            m_ddlApparments.DataSource = l_appartements;
            m_ddlApparments.DataTextField = "CamelID";
            m_ddlApparments.DataValueField = "Id";
            m_ddlApparments.DataBind();
        }

        protected void SetConnexionInfos(object sender, EventArgs e)
        {
            (Page.Master as FrontOffice.Site1).CurrentAppartement = AppartmentID.Value;
        }
    }
}