using System;
using System.Drawing;
using E_Commerce.DAL;

namespace E_Commerce
{
    public partial class UsersActive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Users user = new Users();
            user.Email = Request.QueryString["email"];
            user.JoinIp = Request.UserHostAddress;
            if (user.Active())
            {
                Label1.Text = "Congratulation your account is now activate.";
                Label1.ForeColor = Color.Green;
            }
            else
            {
                Label1.Text = user.Error;
                Label1.ForeColor = Color.Red;
            }
        }
    }
}