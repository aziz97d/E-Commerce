using System;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList ddlCountry = (DropDownList)dvRegister.FindControl("ddlCountry");
                ddlCountry.Items.Insert(0,new ListItem("Select","0"));
            }

        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlCity = (DropDownList)dvRegister.FindControl("ddlCity");
            ddlCity.Items.Clear();

            DropDownList ddlCountry = (DropDownList)dvRegister.FindControl("ddlCountry");

            DAL.City city = new DAL.City();
            city.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
            ddlCity.DataSource = city.Select().Tables[0];
            ddlCity.DataTextField = "name";
            ddlCity.DataValueField = "id";
            ddlCity.DataBind();
            ddlCity.Items.Insert(0, new ListItem("Select", "0"));
        }

        protected void dvRegister_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["joinIp"] = Request.UserHostAddress;
            e.Values["joinDate"] = DateTime.Now;
            e.Values["userType"] = "User";
            e.Values["cityId"] = ((DropDownList) (dvRegister.FindControl("ddlCity"))).SelectedValue;

        }

        protected void dvRegister_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            string subject = "Confirmation form E-Commarce";
            string to = e.Values["email"].ToString();
            string message = "Dear " + e.Values["name"].ToString();
            message += "<br>";
            message += "You have recently register our website from IP = " + e.Values["joinIp"].ToString();
            message += ".<br> Please click this link to activate your account<a href=\"UsersActive.aspx?email=" + e.Values["email"] + "\">Active</a>";
            message += ".If your are not please click this link to Deactivate the account<a href=\"UsersActive.aspx?email="+e.Values["email"]+"\">Deactive</a>";

            //System.Net.Mail.MailMessage msg = new MailMessage("admin@ecommarce.com",e.Values["email"].ToString());
            //msg.Body = message;
            //msg.IsBodyHtml = true;
            //msg.Subject = subject;

            //System.Net.Mail.SmtpClient sc = new SmtpClient();
            //sc.UseDefaultCredentials = true;
            //sc.Send(msg);

            Session["message"] = message;
            Server.Transfer("RegistrationSuccess.aspx");
        }
    }
}