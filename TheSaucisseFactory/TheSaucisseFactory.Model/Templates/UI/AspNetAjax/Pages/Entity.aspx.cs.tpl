[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + ".aspx" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace [%=Producer.WebNamespace(entity)%]
{
    public partial class [%=entity.Name%] : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
