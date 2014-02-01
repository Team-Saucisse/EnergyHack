[%@ template enumerable='Producer.VisibleMethodForms' enumerableItemName="form" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(form)) + ".ascx" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace [%=Producer.WebNamespace(form)%]
{
    public partial class [%=ClassName(form)%] : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}