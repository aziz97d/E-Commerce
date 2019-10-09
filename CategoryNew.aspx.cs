using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class CategoryNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DropDownList ddlCategory = (DropDownList) dvCategory.FindControl("ddlCategory");
            //ddlCategory.Items.Clear();
            //DAL.Category category = new DAL.Category();
            //DataSet ds = category.Select();
            
            //for (int i = 0; i < category.Select().Tables[0].Rows.Count; i++)
            //{
            //    ddlCategory.Items.Add(new ListItem(ds.Tables[0].Rows[i].ItemArray[1].ToString(), ds.Tables[0].Rows[i].ItemArray[0].ToString()));
            //}
        }

        protected void dvCategory_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            lblMessage.Text = "Category Added";
            lblMessage.ForeColor = Color.Green;
        }
    }
}