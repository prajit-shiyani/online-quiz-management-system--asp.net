using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Admin_AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            if (EmailTb.Value == "" && PasswordTb.Value == "")
            {
                ErrMsg.Text = "Missing Info";
            }
            else if (EmailTb.Value == "Admin@gmail.com" && PasswordTb.Value == "Admin")
            {
                Session["Admin"] = true;
                Response.Redirect("ViewCandidates.aspx");
            }
            else
            {
                ErrMsg.Text = "Emain and Password Wrong!!";
            }
        }
    }