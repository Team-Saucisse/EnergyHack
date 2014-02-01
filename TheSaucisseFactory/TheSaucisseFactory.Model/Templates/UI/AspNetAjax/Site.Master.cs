using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeFluent.Runtime.Web.UI.WebControls;

namespace $safeprojectname$
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CultureDropDownList.SetContentLanguageMetas(Page);
        }
    }
}
