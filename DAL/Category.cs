using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce.DAL
{
    public class Category:MyBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public DataSet Select()
        {
            MyCommand = CommandBuilder("Select id, name from category where id>0");
            if (!string.IsNullOrEmpty(Name))
            {
                MyCommand.CommandText += " and name = @name";
                MyCommand.Parameters.AddWithValue("@name", Name);
            }
            if (CategoryId > 0)
            {
                MyCommand.CommandText += " and categoryId=@categoryId";
                MyCommand.Parameters.AddWithValue("@categoryId", CategoryId);
            }
            else
            {
                MyCommand.CommandText += " and categoryId is null";
            }
            return ExecuteDataSet(MyCommand);
        }
        public DataSet SelectCategoryByParentName(string parentName)
        {
            MyCommand = CommandBuilder("Select c1.id , c1.name, c2.name as category from category as c1 left join category as c2 on c1.categoryId = c2.id where c1.id>0");

            if (!string.IsNullOrEmpty(parentName))
            {
                MyCommand.CommandText += " and c2.name = @parentName";
                MyCommand.Parameters.AddWithValue("@parentName", parentName);
            }
            return ExecuteDataSet(MyCommand);
        }
    }
}