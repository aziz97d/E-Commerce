using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DAL;

namespace E_Commerce
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var items = (List<Item>)Session["cart"];
                GridView1.DataSource = items;
                GridView1.DataBind();

                ((Label)GridView1.FooterRow.FindControl("lblGrandTotal")).Text=items.Sum(i=>i.SubTotal).ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateGridView();
        }

        

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            UpdateGridView();

            if (Session["userType"].ToString() == "")
            {
                Session["msg"] = "You have to login to confirm order";
                Session["reDirect"] = "confirm.aspx";
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Redirect("Confirm.aspx");
            }
        }

        private void UpdateGridView()
        {
            List<Item> items = (List<Item>)Session["cart"];

            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                int pid = Convert.ToInt32(((Label)GridView1.Rows[i].FindControl("lblProductId")).Text);
                Item item = items.Where(it => it.ProductId == pid).First();
                item.Qty = Convert.ToInt32(((TextBox)GridView1.Rows[i].FindControl("txtQty")).Text);
                item.Remarks = ((TextBox)GridView1.Rows[i].FindControl("txtRemarks")).Text;
            }
            Session["cart"] = items;

            GridView1.DataSource = items;
            GridView1.DataBind();
            ((Label)GridView1.FooterRow.FindControl("lblGrandTotal")).Text = items.Sum(i => i.SubTotal).ToString();
        }
    }
}