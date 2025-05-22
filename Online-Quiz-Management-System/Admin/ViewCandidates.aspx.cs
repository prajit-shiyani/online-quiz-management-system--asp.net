using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;
using System.Data;

public partial class Views_Admin_ViewCandidates : System.Web.UI.Page
{
    String connectionString = @"SERVER=localhost; UID=root; PASSWORD=; DATABASE=onlinequiz";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (!IsPostBack) {
            showCandidates();
        }
    }
    private void showCandidates()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        String query = "SELECT CandId as Id, CandName as Name, CandEmail as Email, CandPass as Password, CandCollege as College FROM candidatetbl;";
        MySqlCommand mc = new MySqlCommand(query, con);
        MySqlDataAdapter mda = new MySqlDataAdapter(mc);
        DataSet dt = new DataSet();
        mda.Fill(dt);
        CandidatesList.DataSource = dt.Tables[0];
        CandidatesList.DataBind();
        con.Close();
    }
}