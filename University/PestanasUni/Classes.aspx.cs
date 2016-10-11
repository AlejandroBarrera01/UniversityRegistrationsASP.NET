using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Configuration;


namespace University.PestanasUni
{
    

    
    public partial class Classes : System.Web.UI.Page
    {
        //Connection to SQL

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectDataBase"].ConnectionString);
        string sqlCon = "select Id_S,Times from  Schedule";
        string sqlConTe = "select Teacher_ID, Lastname +' , '+ Name as N from Teachers";
        string sqlConLo = "select Id_Location, Room from Location";
        string sqlConSub = "select Id_Subject, name from Subjec";
        string sqlConQ = "Select Id_Quarter,Start_datee +' , '+ End_date as Date from School_Quarter";
        static string DD = "";
        static string DD1 = "";
        static string DD2 = "";
        static string DD3 = "";
        static string DD4 = "";
        int Value = 0;

  

        protected void Page_Load(object sender, EventArgs e)
        {
            //Methods & Refreshing them everything page loads.

            if (!IsPostBack)
            {
                Timex();
                Teach();
                Locati();
                Subj();
                Quart();
                DisplayStudentInfo();
            }


            if (Session["NameUser"] == null)
            {
                Response.Redirect("~/PestanasUni/Logins");

            }

            lbShow.Text = Convert.ToString(Session["NameUser"]);
            IdStuden.Text = Convert.ToString(Session["IdUser"]);
            Value = Convert.ToInt32(IdStuden.Text);



        }
        private void Timex()

        {
       
            SqlDataAdapter a = new SqlDataAdapter(sqlCon,con);
            DataSet dd = new DataSet();
            a.Fill(dd, "Schedule");
            Times.DataSource = dd.Tables[0];
            Times.DataTextField = "Times";
            Times.DataValueField = "Id_S";
            Times.DataBind();



        }
        private void Teach()
        {
            SqlDataAdapter b = new SqlDataAdapter(sqlConTe, con);
            DataSet ddd = new DataSet();
             b.Fill(ddd, "Teachers");
            Teacher.DataSource = ddd.Tables["Teachers"].DefaultView;
            Teacher.DataTextField = "N";
            Teacher.DataValueField = "Teacher_ID";
            Teacher.DataBind();
        }
        private void Locati()
        {
            SqlDataAdapter c = new SqlDataAdapter(sqlConLo, con);
            DataSet aaa = new DataSet();
            c.Fill(aaa, "Location");
            Location.DataSource = aaa.Tables[0];
            Location.DataTextField = "Room";
            Location.DataValueField = "Id_Location";
            Location.DataBind();
        }
        private void Subj()
        {
            SqlDataAdapter dd = new SqlDataAdapter(sqlConSub, con);
            DataSet cc = new DataSet();
            dd.Fill(cc, "Subjec");
            Subject.DataSource = cc.Tables[0];
            Subject.DataTextField = "Name";
            Subject.DataValueField = "Id_Subject";
            Subject.DataBind();

        }
        private void Quart()
        {
            SqlDataAdapter q = new SqlDataAdapter(sqlConQ, con);
            DataSet qq = new DataSet();
            q.Fill(qq, "School_Quarter");
            Quater.DataSource = qq.Tables["School_Quarter"].DefaultView;
            Quater.DataTextField = "Date";
            Quater.DataValueField = "Id_Quarter";
            Quater.DataBind();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            // Action of the Button (OnClick)

            int IdStuden = Convert.ToInt32(txtID.Text);
            DD = Times.SelectedValue;
            DD1 = Subject.SelectedValue;
            DD2 = Teacher.SelectedValue;
            DD3 = Location.SelectedValue;
            DD4 = Quater.SelectedValue;

            SqlCommand ab = new SqlCommand();
            ab.Connection = con;
            ab.CommandType = CommandType.StoredProcedure;
            ab.CommandText = "InsertSchedule";
            con.Open();
            ab.Parameters.AddWithValue("@Id_Student", IdStuden);
            ab.Parameters.AddWithValue("@Id_Subject", DD1);
            ab.Parameters.AddWithValue("@Id_Schedule", DD);
            ab.Parameters.AddWithValue("@Id_Quarter", DD4);
            ab.Parameters.AddWithValue("@M",this.Mon.Checked ? "1" : "0");
            ab.Parameters.AddWithValue("@T", this.Tues.Checked ? "1" : "0");
            ab.Parameters.AddWithValue("@W", this.Wed.Checked ? "1" : "0");
            ab.Parameters.AddWithValue("@Thur", this.Thur.Checked ? "1" : "0");
            ab.Parameters.AddWithValue("@F", this.Fri.Checked ? "1" : "0");
            ab.Parameters.AddWithValue("@Id_Location", DD3);
            ab.Parameters.AddWithValue("@Id_Teachers", DD2);
            ab.ExecuteNonQuery();
            con.Close();

            Response.Write("<script>window.alert('You have been resgister!');</script>");

            DisplayStudentInfo();



        }


        private void DisplayStudentInfo()
        {
            // Call of the Storage Procedure

            
      


            SqlCommand zz = new SqlCommand();
            zz.Connection = con;
            zz.CommandType = CommandType.StoredProcedure;
            zz.CommandText = "ShowStudentByID1";
            con.Open();
            zz.Parameters.Add("@idStuden", SqlDbType.Int).Value = Value;          
            zz.ExecuteNonQuery();
            con.Close();

            //SqlDataAdapter sda = new SqlDataAdapter(zz);
            //DataTable dd = new DataTable();
            //sda.Fill(dd);
            //GridViewShow.DataSource = dd;
            //GridViewShow.DataBind();

        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/PestanasUni/Logins.aspx");
        }
    }
}