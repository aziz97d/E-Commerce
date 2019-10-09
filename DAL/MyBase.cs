using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace E_Commerce.DAL
{
    public class MyBase
    {
        protected SqlCommand MyCommand { get; set; }
        protected SqlDataReader MyReader { get; set; }
        public int LastId { get; set; }
        private string _error;
        public string Error
        {
            get { return _error; }
        }
        //String for search
        protected string Search { get; set; }

        //private SqlConnection CN = new SqlConnection("Data Source=DESKTOP-002O19U;Initial Catalog=dbUniversityAdvising;Integrated Security=True");
        private SqlConnection CN = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyCon"].ConnectionString); 
        private bool Connection()
        {
            if (MyReader !=null && !MyReader.IsClosed)
                MyReader.Close();
            
            if (CN.State==ConnectionState.Open)
                return true;
            
            try
            {
                CN.Open();
                return true;
            }
            catch (Exception exception)
            {
                _error = exception.Message;
                return false;
            }

        }

        protected bool ExecuteNQ(SqlCommand cmd)
        {
            if (!Connection())
                return false;

            try
            {
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exception)
            {
                _error = exception.Message;
            }
            return false;
        }
        protected bool ExecuteScaler(SqlCommand cmd)
        {
            if (!Connection())
                return false;

            try
            {
                LastId = Convert.ToInt32(cmd.ExecuteScalar());
                return true;
            }
            catch (Exception exception)
            {
                _error = exception.Message;
            }
            return false;
        }

        protected SqlCommand CommandBuilder(string sql)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = CN;
            cmd.CommandText = sql;
            return cmd;
        }

        protected SqlDataReader ExecuteReader(SqlCommand cmd)
        {
            if (!Connection())
                return null;
            return cmd.ExecuteReader();
        }


        protected DataSet ExecuteDataSet(string sql)
        {
            if (!Connection())
                return null;

            SqlCommand cmd = CommandBuilder(sql);
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet);
            return dataSet;
        }
        protected DataSet ExecuteDataSet(SqlCommand cmd)
        {
            if (!Connection())
                return null;
            DataSet dataSet = new DataSet();
            try
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                //DataSet dataSet = new DataSet();
                dataAdapter.Fill(dataSet);
                //return dataSet;
            }
            catch (Exception ex)
            {
                _error = ex.Message;
            }
            finally
            {
                CN.Close();
            }
            return dataSet;
            
        }
    }
}
