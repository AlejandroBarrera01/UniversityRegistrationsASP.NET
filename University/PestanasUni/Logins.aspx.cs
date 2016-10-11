using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace University.PestanasUni
{
    public partial class Logins : System.Web.UI.Page
    {

        SqlConnection cnn;

        protected void Page_Load(object sender, EventArgs e)
        {



        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

            if (txtUserAdvisor.Text == "" || txtpasswordAdvisor.Text == "")
            {
                Message.Text = " Please Enter Username and Password";
            }
            else
            {

                string Advisorname = string.Empty;
                string Dataa = string.Empty;
                SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);
                SqlCommand cd = cn.CreateCommand();
                DataTable dtadvi = LogginClass.search("Select wb.IdUser,NameUser from WebUser_ wb ",
                    "inner join SchoolAdvisors sa on wb.IdUser=sa.IdUser ",
                    "Where wb.NameUser='" + txtUserAdvisor.Text + "' and Password_='" + txtpasswordAdvisor.Text + "'", cn);

                if (dtadvi == null)
                {
                    return;
                }

                if (dtadvi.Rows.Count > 0)
                {
                    LogginClass.Iduser = dtadvi.Rows[0][0].ToString();

                    foreach (DataRow DR in dtadvi.Rows)
                    {
                        Session["NameUser"] = DR["NameUser"].ToString();
                        Session["IdUser"] = DR["IdUser"].ToString();
                        Response.Redirect("~/PestanasUni/SchoolAdvisor.aspx");

                    }
                }
                else
                {
                    Message.Text = "Wrong Username and Password ";
                }
            }


        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            if (Txtuser.Text == "" || (txtpass.Text) == "")
            {
                Message.Text = "Please Enter Username and Password";
            }
            else
            {
                string name = string.Empty;
                string data = string.Empty;
                cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);
                SqlCommand cmd = cnn.CreateCommand();
                DataTable dt_user = LogginClass.search("Select wu.IdUser,NameUser from WebUser_ wu ",
                    "INNER JOIN Student s on wu.IdUser=s.IdUser ",
                    "Where wu.NameUser='" + Txtuser.Text + "' and wu.Password_='" + txtpass.Text + "'", cnn);

                if (dt_user == null)
                {
                    return;
                }
                if (dt_user.Rows.Count > 0)
                {
                    LogginClass.Iduser = dt_user.Rows[0][0].ToString();

                    foreach (DataRow dtt in dt_user.Rows)
                    {
                        Session["NameUser"] = dtt["NameUser"].ToString();
                        Session["IdUser"] = dtt["IdUser"].ToString();
                        Response.Redirect("~/PestanasUni/Classes.aspx");
                    }
                }
                else
                {
                    Message.Text = " Wrong Username and Password ";
                }

            }
        }
    }
}