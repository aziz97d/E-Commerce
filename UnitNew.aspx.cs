﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class UnitNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvUnit_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Unit Added";
            lblMessage.ForeColor = Color.Green;
        }
    }
}