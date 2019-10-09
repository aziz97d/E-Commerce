using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using E_Commerce.DAL;

namespace E_Commerce.DAL
{
    class Users:MyBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Contact { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public DateTime JoinDate { get; set; }
        public string JoinIp { get; set; }
        public string UserType { get; set; }
        public string Address { get; set; }
        public int CityId { get; set; }


        public bool Active()
        {
            MyCommand = CommandBuilder("INSERT INTO usersActive (email, dateTime, ip) VALUES (@email, @dateTime, @ip)");
            MyCommand.Parameters.AddWithValue("@email", Email);
            MyCommand.Parameters.AddWithValue("@dateTime", DateTime.Now);
            MyCommand.Parameters.AddWithValue("@ip", JoinIp);

            return ExecuteNQ(MyCommand);
        }

        public bool Insert()
        {
            MyCommand = CommandBuilder("INSERT INTO users (name, email, contact, password, gender, dateOfBirth, userType, joinDate, joinIp, address, cityId) VALUES (@name, @email, @contact, @password, @gender, @dateOfBirth, @userType, @joinDate, @joinIp, @address, @cityId)");
            MyCommand.Parameters.AddWithValue("@name",Name);
            MyCommand.Parameters.AddWithValue("@email",Email);
            MyCommand.Parameters.AddWithValue("@contact",Contact);
            MyCommand.Parameters.AddWithValue("@password",Password);
            MyCommand.Parameters.AddWithValue("@gender", Gender);
            MyCommand.Parameters.AddWithValue("@dateOfBirth", DateOfBirth);
            MyCommand.Parameters.AddWithValue("@userType",UserType);
            MyCommand.Parameters.AddWithValue("@joinDate", JoinDate);
            MyCommand.Parameters.AddWithValue("@joinIp", JoinIp);
            MyCommand.Parameters.AddWithValue("@address", Address);
            MyCommand.Parameters.AddWithValue("@cityId", CityId);
            return ExecuteNQ(MyCommand);
        }

        public bool Update()
        {
            MyCommand = CommandBuilder("UPDATE users SET name=@name, email=@email, contact=@contact, password=@password, gender=@gender, dateOfBirth=@dateOfBirth, usertype=@userType, joinDate=@joinDate, joinIp=@joinIp, address=@address, cityId=@cityId WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);
            MyCommand.Parameters.AddWithValue("@name", Name);
            MyCommand.Parameters.AddWithValue("@email", Email);
            MyCommand.Parameters.AddWithValue("@contact", Contact);
            MyCommand.Parameters.AddWithValue("@password", Password);
            MyCommand.Parameters.AddWithValue("@gender", Gender);
            MyCommand.Parameters.AddWithValue("@dateOfBirth", DateOfBirth);
            MyCommand.Parameters.AddWithValue("@userType", UserType);
            MyCommand.Parameters.AddWithValue("@joinDate", JoinDate);
            MyCommand.Parameters.AddWithValue("@joinIp", JoinIp);
            MyCommand.Parameters.AddWithValue("@address", Address);
            MyCommand.Parameters.AddWithValue("@cityId", CityId);

            return ExecuteNQ(MyCommand);
        }

        public bool Delete()
        {
            MyCommand = CommandBuilder("DELETE FROM users WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            return ExecuteNQ(MyCommand);
        }
        public DataSet Select()
        {
            MyCommand = CommandBuilder("SELECT id, name, email, contact, password, gender, dateOfBirth, userType, joinDate, joinIp, address, cityId FROM users");
            if (!string.IsNullOrEmpty(Search))
            {
                MyCommand.CommandText += " WHERE name LIKE @search";
                MyCommand.Parameters.AddWithValue("@search", "%" + Search + "%");
            }

            return ExecuteDataSet(MyCommand);
        }
        public bool SelectById()
        {
            MyCommand = CommandBuilder("SELECT id, name, email, contact, password, gender, dateOfBirth, userType, joinDate, joinIp, address, cityId FROM users WHERE id=@id");
            MyCommand.Parameters.AddWithValue("@id", Id);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                Email = MyReader["email"].ToString();
                Contact = MyReader["contact"].ToString();
                Password = MyReader["password"].ToString();
                Gender = MyReader["gender"].ToString();
                DateOfBirth = Convert.ToDateTime(MyReader["dateOfBirth"]);
                UserType = MyReader["userType"].ToString();
                JoinDate = Convert.ToDateTime(MyReader["joinDate"].ToString());
                JoinIp = MyReader["joinIp"].ToString();
                Address = MyReader["address"].ToString();
                CityId = Convert.ToInt32(MyReader["cityId"].ToString());


                return true;
            }
            return false;
        }
        public bool Login()
        {
            MyCommand = CommandBuilder("SELECT id, name, email, contact, password, userType FROM users WHERE (email=@email or contact=@email) and password=@password");
            MyCommand.Parameters.AddWithValue("@email", Email);
            MyCommand.Parameters.AddWithValue("@Password", Password);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                Email = MyReader["email"].ToString();
                Contact = MyReader["contact"].ToString();
                Password = MyReader["password"].ToString();
                UserType = MyReader["userType"].ToString();
                return true;
            }
            return false;
        }
        public bool IsActive(string email)
        {
            MyCommand = CommandBuilder("SELECT email FROM usersActive WHERE email=@email");
            MyCommand.Parameters.AddWithValue("@email", email);

            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                return true;
            }
            return false;
        }
        public bool SelectByOthers()
        {
            MyCommand = CommandBuilder("SELECT id, name, email, contact, password, gender, dateOfBirth, userType, joinDate, joinIp, address, cityId FROM users where id>0");
            if (Email != null && Email != "")
            {
                MyCommand.CommandText += " and email=@email ";
                MyCommand.Parameters.AddWithValue("@email", Email);
            }
            if (Password != null && Password != "")
            {
                MyCommand.CommandText += " and password = @password";
                MyCommand.Parameters.AddWithValue("@password", Password);
            }
            
            MyReader = ExecuteReader(MyCommand);
            while (MyReader.Read())
            {
                Id = Convert.ToInt32(MyReader["id"]);
                Name = MyReader["name"].ToString();
                Email = MyReader["email"].ToString();
                Password = MyReader["password"].ToString();
                Gender = MyReader["gender"].ToString();
                DateOfBirth = Convert.ToDateTime(MyReader["dateOfBirth"]);
                UserType = MyReader["userType"].ToString();
                JoinDate = Convert.ToDateTime(MyReader["joinDate"]);
                JoinIp = MyReader["joinIp"].ToString();
                Address = MyReader["address"].ToString();
                CityId = Convert.ToInt32(MyReader["cityId"]);

                return true;
            }
            return false;
        }
    }
}
