using System;

namespace E_Commerce
{
    public partial class Resend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            string subject = "Confirmation form E-Commarce";
            string to = txtEmail.Text;
            string message = "Dear " + txtEmail.Text;
            message += "<br>";
            message += ".<br> Please click this link to activate your account<a href=\"UsersActive.aspx?email=" + txtEmail.Text +"\">Active</a>";
            message += ".If your are not please click this link to Deactivate the account<a href=\"UsersActive.aspx?email=" + txtEmail.Text +"\">Deactive</a>";

            //System.Net.Mail.MailMessage msg = new MailMessage("admin@ecommarce.com",e.Values["email"].ToString());
            //msg.Body = message;
            //msg.IsBodyHtml = true;
            //msg.Subject = subject;

            //System.Net.Mail.SmtpClient sc = new SmtpClient();
            //sc.UseDefaultCredentials = true;
            //sc.Send(msg);

        }
    }
}