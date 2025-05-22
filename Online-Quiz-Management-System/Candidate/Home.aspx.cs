using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


public partial class Views_Candidate_Home : System.Web.UI.Page
{
    string connectionString = @"SERVER=localhost; USER=root; PASSWORD=; DATABASE=onlinequiz;";
    //public static string resQuizName;
    //public static int resQuizCode;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["loging"] == null) {
                Response.Redirect("../Login.aspx");
            }
            getQuiz();
        }
    }
    private void getQuiz()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query = "SELECT * FROM quiztbl";
        MySqlDataAdapter msda = new MySqlDataAdapter(query, con);
        DataTable dt = new DataTable();
        msda.Fill(dt);
        QuesTb.DataTextField = dt.Columns["QName"].ToString();
        QuesTb.DataValueField = dt.Columns["Qid"].ToString();
        QuesTb.DataSource = dt;
        QuesTb.DataBind();
        con.Close();
    }
    protected void HomeSubmit_Click(object sender, EventArgs e)
    {
        Session["resQuizName"] = QuesTb.SelectedItem.ToString();
        Session["resQuizCode"] = Convert.ToInt32(QuesTb.SelectedValue);
        Response.Redirect("Test.aspx");
    }
}
