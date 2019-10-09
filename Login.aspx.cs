using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DAL;

namespace E_Commerce
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int er = 0;
            if (txtEmail.Text == "")
            {
                er++;
                lblEmail.Text = "Required";
            }
            if (txtPassword.Text == "")
            {
                er++;
                lblPassword.Text = "Required";
            }
            if(er>0)
                return;

            DAL.Users user = new Users();
            user.Email = txtEmail.Text;
            user.Password = txtPassword.Text;

            if (user.Login())
            {
                if (!user.IsActive(txtEmail.Text))
                {
                    Response.Redirect("Client/Resend.aspx");
                }

                Session["id"] = user.Id;
                Session["name"] = user.Name;
                Session["userType"] = user.UserType;
                Session["login"] = "Logout";
                if (Session["reDirect"].ToString() == "")
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Redirect(Session["reDirect"].ToString());
                }
                
            }
            else
            {
                lblMessage.Text = user.Error;
                lblMessage.ForeColor = Color.Red;
            }
        }
    }
}