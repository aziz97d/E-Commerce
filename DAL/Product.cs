using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using E_Commerce.DAL;

namespace E_Commerce.DAL
{
    internal class Product : MyBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Tag { get; set; }
        public int CategoryId { get; set; }
        public int BrandId { get; set; }
        public int UnitId { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public double Discount { get; set; }
        public DateTime LastUpdate { get; set; }


        public bool Insert()
        {
            MyCommand = CommandBuilder(@"INSERT INTO product (name, code, tag, categoryId, brandId, unitId, description, price, discount, lastUpdate)
                                        VALUES  (@name,@code,@tag, @categoryId, @branddId, @unitId, @description, @lastUpdate)");
            MyCommand.Parameters.AddWithValue("@name", Name);
            MyCommand.Parameters.AddWithValue("@code", Code);
            MyCommand.Parameters.AddWithValue("@tag", Tag);
            MyCommand.Parameters.AddWithValue("@categoryId", CategoryId);
            MyCommand.Parameters.AddWithValue("@brandId", BrandId);
            MyCommand.Parameters.AddWithValue("@unitId", UnitId);
            MyCommand.Parameters.AddWithValue("@description", Description);
            MyCommand.Parameters.AddWithValue("@price", Price);
            MyCommand.Parameters.AddWithValue("@discount", Discount);
            MyCommand.Parameters.AddWithValue("@lastUpdate", LastUpdate);


            

            return ExecuteNQ(MyCommand);
        }

        public bool Update()
        {
            MyCommand =
                CommandBuilder(
                    @"UPDATE product SET name=@name, code=@code, tag=@tag, categoryId=@categoryId, brandId=@brandId, unitId=@unitId, description=@description, price=@price, discount=@discount, lastUpdate=@lastUpdate  WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);
            MyCommand.Parameters.AddWithValue("@name", Name);
            MyCommand.Parameters.AddWithValue("@code", Code);
            MyCommand.Parameters.AddWithValue("@tag", Tag);
            MyCommand.Parameters.AddWithValue("@categoryId", CategoryId);
            MyCommand.Parameters.AddWithValue("@brandId", BrandId);
            MyCommand.Parameters.AddWithValue("@unitId", UnitId);
            MyCommand.Parameters.AddWithValue("@description", Description);
            MyCommand.Parameters.AddWithValue("@price", Price);
            MyCommand.Parameters.AddWithValue("@discount", Discount);
            MyCommand.Parameters.AddWithValue("@lastUpdate", LastUpdate);
           
            return ExecuteNQ(MyCommand);
        }
        public bool Delete()
        {
            MyCommand = CommandBuilder(@"DELETE product WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            return ExecuteNQ(MyCommand);
        }

        public DataSet Select()
        {
            MyCommand = CommandBuilder(@"SELECT name, code, tag, categoryId, brandId, unitId, description, price, discount, lastUpdate FROM Product");
            

            return ExecuteDataSet(MyCommand);
        }

        public bool SelectById()
        {
            MyCommand = CommandBuilder(@"SELECT name, code, tag, categoryId, brandId, unitId, description, price, discount, lastUpdate FROM Product where id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Name = MyReader["name"].ToString();
                Code = MyReader["code"].ToString();
                Tag = MyReader["tag"].ToString();
                CategoryId = Convert.ToInt32(MyReader["categoryId"]);
                BrandId = Convert.ToInt32(MyReader["brandId"]);
                UnitId = Convert.ToInt32(MyReader["unitId"]);
                Description = MyReader["description"].ToString();
                Price = Convert.ToDouble(MyReader["price"]);
                Discount = Convert.ToDouble(MyReader["discount"]);
                //LastUpdate = Convert.ToDateTime(MyReader["lastUpdate"]);

                return true;
            }
            return false;
        }
    }
}
