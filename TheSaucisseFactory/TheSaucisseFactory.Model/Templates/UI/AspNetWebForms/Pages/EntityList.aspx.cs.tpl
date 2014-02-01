[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "List.aspx" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeFluent.Runtime;
using CodeFluent.Runtime.Utilities;
using CodeFluent.Runtime.Web.UI.WebControls;
using [%=Producer.WebAssemblyNamespace%];

namespace [%=Producer.WebNamespace(entity)%]
{
    public partial class [%=entity.Name%]List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			string viewName = Utilities.GetViewName(HttpContext.Current);
			switch(viewName)
			{
				[%foreach(VisibleView view in Producer.GetVisibleViews(entity)) {%]
				case "[%=view.Name.ToLowerInvariant()%]":
					[%=view.Name%]Grid.DataSourceID = "DataSource";
					break;
				[%}%]
				default:
					[%if (entity.DefaultView != null) {%]
					[%=entity.DefaultView.Name%]Grid.DataSourceID = "DataSource";
					[%}%]
					break;
			}
        }
        
        protected void Page_PreRender(object sender, EventArgs e)
		{
			ClientScript.GetPostBackEventReference(new Literal(), string.Empty);
		}
		
		protected void OnError(object sender, EntityDataSourceErrorEventArgs e)
		{
			e.Handled = true;
			
            CodeFluentCoercionException cce = e.Error as CodeFluentCoercionException;
            if (cce != null)
            {
                string rawResult = string.Format("Raw result: {0}", cce.Value);
                string viewName = Utilities.GetViewName(HttpContext.Current);
                switch (viewName)
                {
					[%foreach(VisibleView view in Producer.GetVisibleViews(entity)) {%]
					case "[%=view.Name.ToLowerInvariant()%]":
						[%=view.Name%]Grid.EmptyDataText = rawResult;
						break;
					[%}%]
					default:
						[%if (entity.DefaultView != null) {%]
						[%=entity.DefaultView.Name%]Grid.EmptyDataText = rawResult;
						[%}%]
						break;
                }
                return;
            }
            
			if (e.ExpectedResultType == typeof(IEnumerable)) // Select
			{
				e.Result = new CodeFluentSet();
			}
			else
			{
				e.Result = 0;
			}
		
            Utilities.OnError(Page, false, e.Error);
		}
    }
}
