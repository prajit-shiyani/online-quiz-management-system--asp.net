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
        // Check if all required fields are filled
        if (string.IsNullOrEmpty(CNameTb.Text) || string.IsNullOrEmpty(CEmailTb.Text) || string.IsNullOrEmpty(PasswordTb.Text))
        {
            ErrMsg.Text = "Please fill all required fields";
            return;
        }

        try
        {
            ConnectionStringSettings mysetting = ConfigurationManager.ConnectionStrings["projectDbConnection"];
            using (MySqlConnection con = new MySqlConnection(mysetting.ConnectionString))
            {
                con.Open();

                // First check if email already exists
                string checkEmailQuery = "SELECT COUNT(*) FROM candidatetbl WHERE CandEmail = @email";
                using (MySqlCommand cmdCheck = new MySqlCommand(checkEmailQuery, con))
                {
                    cmdCheck.Parameters.AddWithValue("@email", CEmailTb.Text);
                    int emailCount = Convert.ToInt32(cmdCheck.ExecuteScalar());
                    if (emailCount > 0)
                    {
                        ErrMsg.Text = "Email already registered. Please use a different email.";
                        return;
                    }
                }

                // Insert new user with parameterized query for security
                string query = "INSERT INTO candidatetbl (CandName, CandEmail, CandPass, CandCollege) VALUES (@name, @email, @password, @college)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@name", CNameTb.Text);
                    cmd.Parameters.AddWithValue("@email", CEmailTb.Text);
                    cmd.Parameters.AddWithValue("@password", PasswordTb.Text);
                    cmd.Parameters.AddWithValue("@college", CollegeTb.Text);
                    cmd.ExecuteNonQuery();
                }

                ErrMsg.Text = "Successfully registered! Please login now.";
            }
        }
        catch (Exception ex)
        {
            ErrMsg.Text = "An error occurred: " + ex.Message;
        }
    }
}