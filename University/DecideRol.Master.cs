using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Text;

namespace University
{
    public partial class DecideRol : System.Web.UI.MasterPage
    {
        SqlConnection cn;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Obtain Login credentials

            cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);
            SqlCommand cmd = cn.CreateCommand();
            DataTable Rol = LogginClass.search("select * from ",
                "Rol INNER JOIN UserRol on Rol.IdAccess=UserRol.IdAccess ",
                "Where UserRol.IdUser='" + LogginClass.Iduser + "'", cn);

            if(Rol == null)
            {
                return;
            }
            if(Rol.Rows.Count > 0)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("div class=''");
                sb.Append("<ul>");
                for (int row = 0; row < Rol.Rows.Count; row++ )
                {
                    if(Rol.Rows[row][0].ToString() == "1")
                    {
                        St.Visible = true;
                        Sc.Visible = false;
                        Te.Visible = true;
                        Ad.Visible = true;
                        Co.Visible = true;
                        Abo.Visible = true;

                    }
                    else if(Rol.Rows[row][0].ToString() == "2")
                    {
                        St.Visible = false;
                        Sc.Visible = true;
                        Te.Visible = false;
                        Ad.Visible = false;
                        Co.Visible = true;
                        Abo.Visible = true;


                    }
                }
                sb.Append("</ul>");
            }
            else
            {

            }
        }
    }
}