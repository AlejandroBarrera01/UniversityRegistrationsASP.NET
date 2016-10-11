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
    public partial class SchoolAdvisor : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Show();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //if (txtAdvisorID.Text != " " || txtAdvisorName.Text != " " || txtAdvisorLastname.Text != " " || txtAdvisorEmail.Text != " " || txtAdvisorPhone.Text != " ")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please Enter the Requirement Fields" + "');", true);
            //}

            //else
            //{
                int Id = Convert.ToInt32(txtAdvisorID.Text);
                string Name = txtAdvisorName.Text;
                string lastname = txtAdvisorLastname.Text;
                string email = txtAdvisorEmail.Text;
                string phone = txtAdvisorPhone.Text;
                string username = txtAdvisorUsername.Text;
                string Pas = txtAdvisorPassword.Text;

              SqlCommand p = new SqlCommand();
                p.Connection = con;
                p.CommandType = CommandType.StoredProcedure;
                p.CommandText = "InsertAdvisor";
                con.Open();
            
                p.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
                p.Parameters.Add("@Name", SqlDbType.VarChar).Value = Name;
                p.Parameters.Add("@LastName", SqlDbType.VarChar).Value = lastname;
                p.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
                p.Parameters.Add("@Contact", SqlDbType.VarChar).Value = phone;
                p.Parameters.Add("@userna", SqlDbType.VarChar).Value = username;
                p.Parameters.Add("@userpass", SqlDbType.VarChar).Value = Pas;
            
               p.ExecuteNonQuery();
                con.Close();

            Response.Write("<script>window.alert('You have been resgister!');</script>");

            txtAdvisorID.Text = string.Empty;
                txtAdvisorName.Text = string.Empty;
                txtAdvisorLastname.Text = string.Empty;
                txtAdvisorEmail.Text = string.Empty;
                txtAdvisorPhone.Text = string.Empty;
                txtAdvisorUsername.Text = string.Empty;
                txtAdvisorPassword.Text = string.Empty;
               

                Show();

            //}
        }

        private void Show()
        {
            con.Open();
            SqlDataAdapter ad = new SqlDataAdapter("select * from SchoolAdvisors", con);
            DataSet ds = new DataSet();
            ad.Fill(ds, "SchoolAdvisors");
            AdvisorDv.DataSource = ds;
            AdvisorDv.DataBind();
            con.Close();

        }

        protected void AdvisorDv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Edit and Show
            AdvisorDv.EditIndex = e.NewEditIndex;
            Show();

        }

        protected void AdvisorDv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //Cancel

            AdvisorDv.EditIndex = -1;
            Show();

        }

        protected void AdvisorDv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Updating Registration

            TextBox AdvisorN = (TextBox)AdvisorDv.Rows[e.RowIndex].FindControl("txtAdvisorName");

            TextBox AdvisorLN = (TextBox)AdvisorDv.Rows[e.RowIndex].FindControl("txtAdvisorLastname");

            TextBox AdvisorE = (TextBox)AdvisorDv.Rows[e.RowIndex].FindControl("txtAdvisorEmail");

            TextBox AdvisorC = (TextBox)AdvisorDv.Rows[e.RowIndex].FindControl("txtAdvisorPhone");


            var IDAdvi = AdvisorDv.DataKeys[e.RowIndex].Value;

            SqlCommand cd = new SqlCommand();
            cd.Connection = con;
            con.Open();

            cd.CommandText = "Update SchoolAdvisors set Name='" + AdvisorN.Text + "',LastName='" + AdvisorLN.Text + "',Email='" + AdvisorE.Text + "',Contact#='" + txtAdvisorPhone.Text + "' Where Id__Advisor='" + IDAdvi + "'";

            cd.ExecuteNonQuery();
            con.Close();

            AdvisorDv.EditIndex = -1;

            Show();

        }

        protected void AdvisorDv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var IdAdvi = AdvisorDv.DataKeys[e.RowIndex].Value;

            SqlCommand command = new SqlCommand();
            command.Connection = con;

            command.CommandText = "Delete from SchoolAdvisors Where Id_Advisor ='" + IdAdvi + "'";

            con.Open();
            command.ExecuteNonQuery();
            AdvisorDv.EditIndex = -1;
            con.Close();

            this.Show();

        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/PestanasUni/Logins.aspx");
        }
    }
}