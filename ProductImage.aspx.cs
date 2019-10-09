using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce
{
    public partial class ProductImage : System.Web.UI.Page
    {
        private string fileName = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UploadImage(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Image/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }
            FileUpload imageUpload = (FileUpload) dvProductImage.FindControl("FileUpload1");
            //Save the File to the Directory (Folder).
            imageUpload.SaveAs(folderPath + Path.GetFileName(imageUpload.FileName));
            fileName = Path.GetFileName(imageUpload.FileName);
        }

        protected void dvProductImage_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            e.Values["image"] = fileName;
        }
    }
}