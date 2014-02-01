[%@ template enumerable='Producer.VisibleEntities' enumerableItemName="entity" enumerableTargetPathFunc='Path.Combine(Path.GetDirectoryName(TargetPath), RelativePath(entity)) + "Form.aspx" + Template.FileExtension' inherits="CodeFluent.Producers.UI.BaseTemplate" %]
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
    public partial class [%=entity.Name%]Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			string formName = Utilities.GetFormName(HttpContext.Current);
			switch(formName)
			{
				[%foreach(VisibleForm form in GetVisibleForms(entity)) {%]
				case "[%=form.IdentifierName.ToLowerInvariant()%]":
					[%=form.IdentifierName%]Form.Visible = true;
					break;
				[%}%]
				default:
					[%if (entity.DefaultForm != null) {%]
					[%=entity.DefaultForm.IdentifierName%]Form.Visible = true;
					[%}%]
					break;
			}
        }
		
		protected void OnItemInserted(object sender, FormViewInsertedEventArgs e)
		{
            if (e.Exception == null)
            {
                Utilities.WriteWindowClose();
            }
            else
            {
                Utilities.OnError(Page, false, e.Exception);
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }
        }

		protected void OnItemUpdated(object sender, FormViewUpdatedEventArgs e)
		{
            if (e.Exception == null)
            {
                Utilities.WriteWindowClose();
            }
            else
            {
                Utilities.OnError(Page, false, e.Exception);
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
        }
    }
}
