using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace E_Commerce.DAL
{
    public class OrderDetails:MyBase
    {
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Qty { get; set; }
        public double Rate { get; set; }
        public string Remarks { get; set; }


        public bool Insert()
        {
            MyCommand = CommandBuilder("INSERT INTO OrderDetails (orderId, productId, qty, rate, remarks) VALUES (@orderId, @productId, @qty, @rate, @remarks)");
            MyCommand.Parameters.AddWithValue("@orderId", OrderId);
            MyCommand.Parameters.AddWithValue("@productId", ProductId);
            MyCommand.Parameters.AddWithValue("@qty", Qty);
            MyCommand.Parameters.AddWithValue("@rate", Rate);
            MyCommand.Parameters.AddWithValue("@remarks", Remarks);
           

            return ExecuteNQ(MyCommand);

        }

        public bool Update()
        {
            MyCommand = CommandBuilder("UPDATE OrderDetails SET orderId=@orderId, productId=@productId, qty=@qty, remarks=@remarks WHERE productId=@productId and orderId=@orderId");
            MyCommand.Parameters.AddWithValue("@orderId", OrderId);
            MyCommand.Parameters.AddWithValue("@productId", ProductId);
            MyCommand.Parameters.AddWithValue("@qty", Qty);
            MyCommand.Parameters.AddWithValue("@rate", Rate);
            MyCommand.Parameters.AddWithValue("@remarks", Remarks);

            return ExecuteNQ(MyCommand);
        }

        public bool Delete()
        {
            MyCommand = CommandBuilder("DELETE FROM OrderDetails WHERE productId=@productId and orderId=@orderId");
            MyCommand.Parameters.AddWithValue("@orderId", OrderId);
            MyCommand.Parameters.AddWithValue("@productId", ProductId);

            return ExecuteNQ(MyCommand);
        }
        public bool SelectById()
        {
            MyCommand = CommandBuilder("SELECT orderId, productId, qty, rate, remarks FROM OrderDetails WHERE productId=@productId and orderId=@orderId");
            MyCommand.Parameters.AddWithValue("@orderId", OrderId);
            MyCommand.Parameters.AddWithValue("@productId", ProductId);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                OrderId = Convert.ToInt32(MyReader["orderId"]);
                ProductId = Convert.ToInt32(MyReader["productId"]);
                Qty = Convert.ToInt32(MyReader["qty"]);
                Rate = Convert.ToDouble(MyReader["rate"]);
                Remarks = MyReader["remarks"].ToString();
                return true;
            }
            return false;
        }

        public DataSet Select()
        {
            MyCommand =
                MyCommand = CommandBuilder("SELECT orderId, productId, qty, rate, remarks FROM OrderDetails");

            return ExecuteDataSet(MyCommand);

        }
    }
}