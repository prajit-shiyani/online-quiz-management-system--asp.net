using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


public partial class Views_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    String connectionString = @"SERVER=localhost; UID=root; PASSWORD=; DATABASE=onlinequiz";

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        if (LPassTb.Value == "" && LEmailTb.Value == "")
        {
            ErrMsg.Text = "Missing Info";
        }
        else
        {
            try
            {
                MySqlConnection con = new MySqlConnection();
                con.ConnectionString = connectionString;
                con.Open();
                String query = "SELECT `CandName`, `CandEmail`, `CandPass`, `CandCollege` FROM candidatetbl WHERE CandEmail='" + LEmailTb.Value + "' AND CandPass='" + LPassTb.Value + "'";
                MySqlDataAdapter mda = new MySqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                mda.Fill(dt);
                if (dt.Rows.Count == 0)
                {
                    ErrMsg.Text = "Wrong Candidate!!!";
                }
                else
                {
                    Session["Loging"] = true;
                    Response.Redirect("Candidate/Home.aspx");
                }
                con.Close();
            }
            catch (Exception Ex)
            {
                ErrMsg.Text = Ex.Message;(heloooooooooooooo)
            }
        }
    }
}