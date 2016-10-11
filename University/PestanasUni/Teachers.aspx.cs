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


    public partial class Teachers : System.Web.UI.Page

    {
        //Connection To SQL

        SqlConnection conn= new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);



        protected void Page_Load(object sender, EventArgs e)
        {

            Display();




        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //Declearing Variables, Opening Connection and Call of Storage Procedure

            //if (txtID.Text != " " || txtNameT.Text != " " || txtLastnameT.Text != " " || txtContactT.Text != " ")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please Enter The Requirement Fields" + "');", true);
            //}

            //else
            //{

                int id = Convert.ToInt32(txtID.Text);
                string Name = txtNameT.Text;
                string Lastname = txtLastnameT.Text;
                string Email = txtEmailT.Text;
                string Contact = txtContactT.Text;


                SqlCommand T = new SqlCommand();
                T.Connection = conn;
                T.CommandType = CommandType.StoredProcedure;
                T.CommandText = "InsertTeachers";
                conn.Open();

                T.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                T.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
                T.Parameters.Add("@LastName", SqlDbType.VarChar).Value = Lastname;
                T.Parameters.Add("@Email", SqlDbType.VarChar).Value = Email;
                T.Parameters.Add("@Contact", SqlDbType.VarChar).Value = Contact;

                T.ExecuteNonQuery();
                conn.Close();

            Response.Write("<script>window.alert('You have been resgister!');</script>");

            txtID.Text = string.Empty;
                txtNameT.Text = string.Empty;
                txtLastnameT.Text = string.Empty;
                txtEmailT.Text = string.Empty;
                txtContactT.Text = string.Empty;

                Display();
            //}
        }

        private void Display()
        {
            //Show Database infor on DataGrid

            conn.Open();
            SqlDataAdapter data = new SqlDataAdapter("select * from Teachers", conn);
            DataSet D = new DataSet();
            data.Fill(D,"Teachers");
            TeacherGv.DataSource = D;
            TeacherGv.DataBind();
            conn.Close();

            

        }

        protected void TeachersGV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            TeacherGv.EditIndex = -1;
            Display();
        }

        protected void TeachersGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox TeacherNam = (TextBox)TeacherGv.Rows[e.RowIndex].FindControl("txtTeacherName");

            TextBox TeacherLastNam = (TextBox)TeacherGv.Rows[e.RowIndex].FindControl("txtTeacherLastName");

            TextBox TeacherEmai = (TextBox)TeacherGv.Rows[e.RowIndex].FindControl("txtTeacherEmail");

            TextBox TeacherContac = (TextBox)TeacherGv.Rows[e.RowIndex].FindControl("txtTeacherContact");

            var IDTeach = TeacherGv.DataKeys[e.RowIndex].Value;

            SqlCommand c = new SqlCommand();
            c.Connection = conn;
            conn.Open();

            c.CommandText = "Update Teachers set Name='" + TeacherNam.Text + "',LastName='" + TeacherLastNam.Text + "',Email='" + TeacherEmai.Text + "',Contact='" + TeacherContac.Text + "' Where Teacher_ID='" + IDTeach + "'";

            c.ExecuteNonQuery();
            conn.Close();

            TeacherGv.EditIndex = -1;

            Display();
        }

        protected void TeachersGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var IdTeac = TeacherGv.DataKeys[e.RowIndex].Value;

            SqlCommand sqlc = new SqlCommand();
            sqlc.Connection = conn;

            sqlc.CommandText = "Delete from Teachers Where Teacher_ID='" + IdTeac + "'";

            conn.Open();
            sqlc.ExecuteNonQuery();
            TeacherGv.EditIndex = -1;
            conn.Close();

            this.Display();


        }

        protected void TeachersGv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TeacherGv.EditIndex = e.NewEditIndex;
            Display();
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/PestanasUni/Logins.aspx");
        }

        //protected void Teachers_RowEditing(object sender, GridViewEditEventArgs e)
        //{

        //}

        //protected void Teachers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{

        //}

        //protected void Teachers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{

        //}

        //protected void Teachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{

        //}
    }
}