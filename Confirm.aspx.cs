using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using E_Commerce.DAL;

namespace E_Commerce
{
    public partial class Confirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var items = (List<Item>)Session["cart"];
                GridView1.DataSource = items;
                GridView1.DataBind();

                try
                {
                    ((Label)GridView1.FooterRow.FindControl("lblGrandTotal")).Text = items.Sum(i => i.SubTotal).ToString();
                }
                catch { }
                

                DAL.Users users = new Users();
                users.Id = Convert.ToInt32(Session["id"].ToString());
                users.SelectById();
                txtAddress.Text = users.Address;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var items = (List<Item>)Session["cart"];
            DAL.Orders ord = new Orders();
            ord.DelivaryAddress = txtAddress.Text;
            ord.DelivaryCharge = Convert.ToDouble(txtDelivaryCharge.Text);
            ord.OthersCharge = Convert.ToDouble(txtOtherCharge.Text);
            ord.LocationId = Convert.ToInt32(ddlLocation.SelectedValue);
            ord.PaymentMethodId = Convert.ToInt32(ddlPaymentMethod.SelectedValue);
            ord.Number = DateTime.Now.ToString();
            ord.Total = Convert.ToDouble(items.Sum(i => i.SubTotal));
            ord.UserId = (Int32) Session["id"];

            if (ord.Insert())
            {
                foreach (var item in items)
                {
                    DAL.OrderDetails ordD = new DAL.OrderDetails();
                    ordD.OrderId = ord.LastId;
                    ordD.ProductId = item.ProductId;
                    ordD.Qty = item.Qty;
                    ordD.Rate = item.Rate;
                    ordD.Remarks = item.Remarks;

                    ordD.Insert();
                }
                Response.Redirect("OrderSuccessful.aspx?orderId="+ord.LastId);
            }

        }
    }
}