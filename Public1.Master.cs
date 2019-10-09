using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class Public1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string s = "";
        public string GenarateMenu(int pid=0)
        {
            DAL.Category category = new DAL.Category();
            category.CategoryId = pid;
            DataTable dt = category.Select().Tables[0];

            if (dt.Rows.Count > 0)
            {
                if( pid != 0)
                    s += "<ul>";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    s += "<li><a href=\"Shop.aspx?category="+dt.Rows[i].ItemArray[1].ToString()+"\">" + dt.Rows[i].ItemArray[1].ToString() + "</a>\n";
                    GenarateMenu(Convert.ToInt32(dt.Rows[i].ItemArray[0]));
                    s += "</li>";
                }
                if(pid != 0)
                    s += "</ul>";
            }

            return s;
        }

        public string UserManu()
        {
            string s = "";
            if (Session["userType"].ToString() != "")
            {
                s += "<li><a href=\"myAccount.aspx?myId=" + Session["id"] + "\">" + Session["name"] + "</a></li>";
                //s += "<li><a href=\"../myAccount\">" + Session["name"] + "</a></li>";
                s += "<li><a href=\"../Logout.aspx\">Logout</a></li>";
                if (Session["userType"].ToString() == "Admin")
                {
                    s += "<li><a href=\"../DefaultAdmin.aspx\">Admin Panel</a></li>";
                }
            }
            else
            {
                s += "<li><a href=\"../Register.aspx\">Register</a></li>";
                s += "<li><a href=\"../Login.aspx\">Login</a></li>";
            }   
            return s;
        }
    }
}