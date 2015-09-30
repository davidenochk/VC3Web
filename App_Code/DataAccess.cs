using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for DataAccess
/// </summary>
public class DataAccess
{
    public string connectionString { get; set; }
    public SqlConnection connection { get; set; }
    public DataAccess()
    {
        connectionString = ConfigurationManager.ConnectionStrings["VC3DataGoDaddy"].ConnectionString;
    }
    public DataSet GetDataSet(string procName, object[] parameters)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            if(parameters != null && parameters.Length > 0)
            {
                foreach (SqlParameter p in parameters)
                    cmd.Parameters.Add(p);
            }
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet resultDS = new DataSet();
            da.Fill(resultDS);
            return resultDS;
        }
    }
    public DataSet GetDataSet(string procName)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet resultDS = new DataSet();
            da.Fill(resultDS);
            return resultDS;
        }
    }

    public string GetScalar(string procName, object[] parameters)
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procName;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = con;
            foreach (SqlParameter p in parameters)
                cmd.Parameters.Add(p);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet resultDS = new DataSet();
            da.Fill(resultDS);
            return (resultDS.Tables[0].Rows[0][0].ToString());
        }
    }
}