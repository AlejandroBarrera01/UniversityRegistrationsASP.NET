using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace University.PestanasUni
{
    public partial class Register : System.Web.UI.Page
    {
        //ConnectionState to SQL

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);

        string Sql = "select Id_Advisor, Name +' '+LastName as NAME from SchoolAdvisors ";
        static string Drop = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Functions
            if (!IsPostBack)
            {
                Show();
                Advisor();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
          

                int Id = Convert.ToInt32(txtStudentID.Text);
                string Name = txtName.Text;
                string LastName = txtLastname.Text;
                string username = TxtUsername.Text;
                string pass = TxtPassword.Text;
                Drop = ddlAdvisor.SelectedValue;
               

                SqlCommand a = new SqlCommand();
                a.Connection = con;
                a.CommandType = CommandType.StoredProcedure;
                a.CommandText = "InsertStudents";
                con.Open();

                a.Parameters.Add("@ID", SqlDbType.Int).Value = Id;
                a.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
                a.Parameters.Add("@LastName", SqlDbType.VarChar).Value = LastName;
                a.Parameters.Add("@UserN", SqlDbType.VarChar).Value = username;
                a.Parameters.Add("@Pass", SqlDbType.VarChar).Value = pass;   
                a.Parameters.Add("@AdvisorId", SqlDbType.Int).Value = Drop;
                

                a.ExecuteNonQuery();
                con.Close();

                txtStudentID.Text = string.Empty;
                txtName.Text = string.Empty;
                txtLastname.Text = string.Empty;
                TxtUsername.Text = string.Empty;
                TxtPassword.Text = string.Empty;

            Response.Write("<script>window.alert('You have been resgister!');</script>");
            Show();

            //}

        }
        private void Show()
        {
            //Prints the table on the Grid

            con.Open();
            SqlDataAdapter ad = new SqlDataAdapter("Select * from Student", con);
            DataSet ds = new DataSet();
            ad.Fill(ds,"Student");
            Student.DataSource = ds;
            Student.DataBind();
            con.Close();
        }

        private void Advisor()
        {
            //Passing the table of Advisor to the Dropbox

            SqlDataAdapter Adap = new SqlDataAdapter(Sql, con);
            DataSet data2 = new DataSet();
            Adap.Fill(data2, "SchoolAdvisors");
            ddlAdvisor.DataSource = data2.Tables["SchoolAdvisors"].DefaultView;
            ddlAdvisor.DataTextField = "Name";
            ddlAdvisor.DataValueField = "Id_Advisor";
            ddlAdvisor.DataBind();

         }

        protected void Student_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Edit and Show
            Student.EditIndex = e.NewEditIndex;
            Show();
        }

        protected void Student_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Cancel

            Student.EditIndex = -1;
            Show();
        }

        protected void Student_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Update Registration

            TextBox StudentNam = (TextBox)Student.Rows[e.RowIndex].FindControl("txtStudentName");

            TextBox StudentLastName = (TextBox)Student.Rows[e.RowIndex].FindControl("txtLastname");

            TextBox AdvisorID = (TextBox)Student.Rows[e.RowIndex].FindControl("ddlAdvisor");

            var IDClient = Student.DataKeys[e.RowIndex].Value;

            SqlCommand cn = new SqlCommand();
            cn.Connection = con;
            con.Open();

            cn.CommandText = "Update Student set Name='" + StudentNam.Text + "',LastName='" + StudentLastName.Text + "',AdvisorID='" + AdvisorID.Text + "' Where Id_Student='" + IDClient + "'";

            cn.ExecuteNonQuery();
            con.Close();

            Student.EditIndex = -1;

            Show();
        }

        protected void Student_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var idClien = Student.DataKeys[e.RowIndex].Value;

            SqlCommand co = new SqlCommand();
            co.Connection = con;

            co.CommandText = "Delete from Student Where Id_Student='" + idClien + "'";

            con.Open();
            co.ExecuteNonQuery();
            Student.EditIndex = -1;
            con.Close();


            this.Show();

        }
    }
}