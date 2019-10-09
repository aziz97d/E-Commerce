﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOdrDetails_OnClick(object sender, EventArgs e)
        {
            int orderId = Convert.ToInt32(((Button)sender).CommandArgument);
            Response.Redirect("OrderDetails.aspx?orderId=" + orderId);
        }

    }
}