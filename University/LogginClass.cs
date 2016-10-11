using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using System.Web.Security;

namespace University
{

    

    public class LogginClass
    {
        public static string Iduser;

        public static DataTable search(string chain, string table, string status, SqlConnection cn)
        {
            try
            {
                DataSet ds = new DataSet();
                SqlDataAdapter da;
                DataTable dt;
                string consult = chain + table + status;
                cn.Open();
                da = new SqlDataAdapter(consult, cn);
                da.Fill(ds);
                cn.Close();
                dt = ds.Tables[0];
                
                return (dt);
                
            }
            catch
            {
                cn.Close();
                return null;
            }

        } 
        
           
    }
}