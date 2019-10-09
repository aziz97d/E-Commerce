using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class NewLocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int countryId = Convert.ToInt32(((DropDownList)dvLocation.FindControl("ddlCountry")).SelectedValue);

                SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
                cn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cn;
                cmd.CommandText = "select id, name, countryId from city where countryId = @countryId";
                cmd.Parameters.AddWithValue("@countryId", countryId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                cn.Close();

                DropDownList ddlCity = (DropDownList)dvLocation.FindControl("ddlCity");
                //ddlCity.DataSource = ds.Tables[0];
                //ddlCity.DataTextField = "name";
                //ddlCity.DataValueField = "id";
                //ddlCity.DataBind();
                ddlCity.Items.Clear();

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    ddlCity.Items.Add(new ListItem(ds.Tables[0].Rows[i].ItemArray[1].ToString(), ds.Tables[0].Rows[i].ItemArray[0].ToString()));
                }
            }
            catch (Exception em)
            {
                lblMessage.Text = em.Message;
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void dvLocation_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Location Added";
            lblMessage.ForeColor = Color.Green;
        }
    }
}