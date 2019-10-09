using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class UserNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dvUser_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "User Added";
            lblMessage.ForeColor = Color.Green;
        }

        protected void dvUser_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["joinIp"] = Request.UserHostAddress;
        }
    }
}