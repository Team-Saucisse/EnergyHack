﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TheSaucisseFactory;
using System.Web.Services;

namespace FrontOffice
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string CurrentAppartement { get { return (string)Session["CurrentAppartement"]; } set { Session["CurrentAppartement"] = value; } }

        public bool? IsWelcomeMessageShowed
        {
            get
            {
                if (((bool?)Session["WelcomeMessage"]) == null)
                {
                    Session["WelcomeMessage"] = false;
                }

                return ((bool?)Session["WelcomeMessage"]);
            }
            set
            {
                Session["WelcomeMessage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

}