using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce.DAL
{
    public class Orders:MyBase
    {
        public int Id { get; set; }
        public string Number { get; set; }
        public int UserId { get; set; }
        public double Total { get; set; }
        public double DelivaryCharge { get; set; }
        public double OthersCharge { get; set; }
        public int PaymentMethodId { get; set; }
        public string DelivaryAddress { get; set; }
        public int LocationId { get; set; }

        public bool Insert()
        {
            MyCommand = CommandBuilder("INSERT INTO Orders (number, userId, total, delivaryCharge, othersCharge, paymentMethodId," +
                                       " delivaryAddress, locationId) VALUES (@number, @userId, @total, @delivaryCharge, @othersCharge, @paymentMethodId, @delivaryAddress, @locationId) select @@identity");
            MyCommand.Parameters.AddWithValue("@number", Number);
            MyCommand.Parameters.AddWithValue("@userId", UserId);
            MyCommand.Parameters.AddWithValue("@total", Total);
            MyCommand.Parameters.AddWithValue("@delivaryCharge", DelivaryCharge);
            MyCommand.Parameters.AddWithValue("@othersCharge", OthersCharge);
            MyCommand.Parameters.AddWithValue("@paymentMethodId", PaymentMethodId);
            MyCommand.Parameters.AddWithValue("@delivaryAddress", DelivaryAddress);
            MyCommand.Parameters.AddWithValue("@locationId", LocationId);

            return ExecuteScaler(MyCommand);

        }

        public bool Update()
        {
            MyCommand = CommandBuilder("UPDATE Orders SET number=@number, userId=@userId, total=@total, delivaryCharge=@delivaryCharge, othersCharge=@othersCharge, paymentMethodId=@paymentMethodeId, delivaryAddress=@delivaryAddress, locationId=@locationId WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);
            MyCommand.Parameters.AddWithValue("@number", Number);
            MyCommand.Parameters.AddWithValue("@userId", UserId);
            MyCommand.Parameters.AddWithValue("@total", Total);
            MyCommand.Parameters.AddWithValue("@delivaryCharge", DelivaryCharge);
            MyCommand.Parameters.AddWithValue("@othersCharge", OthersCharge);
            MyCommand.Parameters.AddWithValue("@paymentMethodId", PaymentMethodId);
            MyCommand.Parameters.AddWithValue("@delivaryAddress", DelivaryAddress);
            MyCommand.Parameters.AddWithValue("@locationId", LocationId);

            return ExecuteNQ(MyCommand);
        }

        public bool Delete()
        {
            MyCommand = CommandBuilder("DELETE FROM Orders WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            return ExecuteNQ(MyCommand);
        }
        public bool SelectById()
        {
            MyCommand = CommandBuilder("SELECT id, number, userId, total, delivaryCharge, othersCharge, paymentMethodid," +
                                       " delivaryAddress, locationId FROM Orders WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Number = MyReader["number"].ToString();
                UserId = Convert.ToInt32(MyReader["userId"]);
                Total = Convert.ToDouble(MyReader["total"]);
                DelivaryCharge = Convert.ToDouble(MyReader["delivaryCharge"]);
                OthersCharge = Convert.ToDouble(MyReader["othersCharge"]);
                PaymentMethodId = Convert.ToInt32(MyReader["paymentMethodId"]);
                DelivaryAddress = MyReader["delivaryAddress"].ToString();
                LocationId = Convert.ToInt32(MyReader["locationId"]);
                return true;
            }
            return false;
        }

        public DataSet Select()
        {
            MyCommand =
                MyCommand = CommandBuilder("SELECT id, number, userId, total, delivaryCharge, othersCharge, paymentMethodid," +
                                       " delivaryAddress, locationId FROM Orders");

            return ExecuteDataSet(MyCommand);

        }
    }
}