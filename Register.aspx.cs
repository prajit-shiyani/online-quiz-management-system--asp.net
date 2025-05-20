using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;


public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        if (CNameTb.Value == "" && CEmailTb.Value == "" && PasswordTb.Value == "")
        {
            ErrMsg.Text = "Missing Info";
        }
        else
        {
            try
            {
                ConnectionStringSettings mysetting = ConfigurationManager.ConnectionStrings["projectDbConnection"];
                MySqlConnection con = new MySqlConnection();
                con.ConnectionString = mysetting.ConnectionString;
                con.Open();

                String query = "INSERT INTO candidatetbl (CandName, CandEmail, CandPass, CandCollege) VALUES ('" + CNameTb.Value + "','" + CEmailTb.Value + "','" + PasswordTb.Value + "','" + CollegeTb.Value + "')";

                MySqlCommand cmd = new MySqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ErrMsg.Text = "Successfully added...login now";
            }
            catch (Exception EX)
            {
                ErrMsg.Text = EX.Message;
            }
        }
    }
}