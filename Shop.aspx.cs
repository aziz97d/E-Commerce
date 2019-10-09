using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;
using E_Commerce.DAL;

namespace E_Commerce
{
    public partial class Shop : System.Web.UI.Page
    {
        private string allCategory = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string category = Request.QueryString["category"];
            allCategory += "'"+category+"'";
            SqlDataSource.SelectCommand =
                "SELECT [id], [name], [code], [tag], [categoryId], [category], [brandId], [brand], [unitId], [unit], [description], [price], [finalPrice], [discount], [lastUpdate], [Comments], [Likes], [image] FROM [vwProduct] WHERE id>0";
            if (!string.IsNullOrEmpty(category))
            {
                SqlDataSource.SelectCommand += " and category in("+FindSubCategory(category)+")";
            }
        }

        private string FindSubCategory(string category)
        {
            DAL.Category c = new DAL.Category();
            DataTable dt = c.SelectCategoryByParentName(category).Tables[0];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                allCategory +=",'"+ dt.Rows[i].ItemArray[1].ToString()+"'";
                FindSubCategory(dt.Rows[i].ItemArray[1].ToString());
            }
            return allCategory;
        }

        protected void btnAddToCart_OnClick(object sender, EventArgs e)
        {
            List<DAL.Item> items = (List<DAL.Item>) Session["cart"];
            DAL.Product product = new DAL.Product();
            Button btn = (Button) sender;
            product.Id = Convert.ToInt32(btn.CommandArgument);

            if (btn.Text == "Remove")
            {
                var v = items.Where(i => i.ProductId == product.Id).First();
                items.Remove(v);
                btn.Text = "Add To Cart";
            }
            else
            {
                btn.Text = "Remove";
                var v = items.Where(i => i.ProductId == product.Id);
                if (v.Count() > 0)
                {
                    return;
                }
                product.SelectById();
                items.Add(new Item() { Product = product.Name, ProductId = product.Id, Qty = 1, Rate = (product.Price - (product.Price * product.Discount) / 100) });
                Session["cart"] = items;
            }

            
        }
    }
}