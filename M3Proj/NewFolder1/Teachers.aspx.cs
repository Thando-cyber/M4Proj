﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3Proj
{
    public partial class Teachers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Session["userType"].ToString().Equals("Administrator"))
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
    }
}