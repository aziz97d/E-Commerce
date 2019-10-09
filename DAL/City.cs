using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace E_Commerce.DAL
{
    class City:MyBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CountryId { get; set; }

        public bool Insert()
        {
            MyCommand = CommandBuilder("INSERT INTO City (name) VALUES (@name)");
            MyCommand.Parameters.AddWithValue("@name", Name);
            
            return ExecuteNQ(MyCommand);
            
        }

        public bool Update()
        {
            MyCommand = CommandBuilder("UPDATE City SET name=@name WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);
            MyCommand.Parameters.AddWithValue("@name", Name);
           
            return ExecuteNQ(MyCommand);
        }

        public bool Delete()
        {
            MyCommand = CommandBuilder("DELETE FROM City WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            return ExecuteNQ(MyCommand);
        }
        public bool SelectById()
        {
            MyCommand = CommandBuilder("SELECT id, name FROM city WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                return true;
            }
            return false;
        }

        public DataSet Select()
        {
            MyCommand =
                CommandBuilder(
                    "SELECT ct.id, ct.name, cnt.name as country FROM city as ct left join country as cnt on ct.countryId = cnt.id WHERE countryId>0");
            if (CountryId > 0)
            {
                MyCommand.CommandText += " AND countryId=@countryId";
                MyCommand.Parameters.AddWithValue("@countryId", CountryId);
            }

            return ExecuteDataSet(MyCommand);

        }
    }
}
    