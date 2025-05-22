using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;


public partial class Views_Candidate_Test : System.Web.UI.Page
{
    string connectionString = @"SERVER=localhost; USER=root; PASSWORD=; DATABASE=onlinequiz;";
    static int i = 0;
    static int score = 0;
    static string WrongAnsList = "";
    static string WrongQuesList = "";
    static string RightAnsList = "";
    static string RightQuesList = "";
    static DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["resQuizCode"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            score = 0;
            i = 0;
            getQuestion();
            WrongQuesList = "";
            RightQuesList = "";
        }
        else {
            if (Session["resQuizCode"] == null)
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
    private void printQues() { 
    
    }
    private void checkRightWrong() {
        if (Ans1Tb.Checked || Ans2Tb.Checked || Ans3Tb.Checked || Ans4Tb.Checked)
        {
            selectedAns();
            int DataRightNum = Convert.ToInt32(dt.Rows[i][7].ToString());
            int slenth = RightQuesList.Length;
            if (AnsNumber == DataRightNum)
            {
                //Session["score"] = Convert.ToInt32(Session["score"].ToString()) + 1;
                score = score + 1;
                if (RightQuesList.Length == 0)
                {
                    RightQuesList = dt.Rows[i][2].ToString();
                }
                else 
                {
                    RightQuesList = RightQuesList + "<br>" + dt.Rows[i][2].ToString();
                }
                
                scoreInfo.InnerHtml = "Score :- "+score;

            }
            else
            {
                if (WrongQuesList.Length == 0)
                {
                    WrongQuesList = dt.Rows[i][2].ToString();
                }
                else
                {
                    WrongQuesList = WrongQuesList + "<br>" + dt.Rows[i][2].ToString();
                }
                //WrongQuesList = WrongQuesList + "<br>" + dt.Rows[i][2].ToString();
                scoreInfo.InnerHtml = "Score :- " +score;

            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Answar are not selected.')", true);
        }
    }
    private void NextQuestion()
    {
        if (Session["resQuizCode"] == null) {
            Response.Redirect("Home.aspx");
        }
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query = "SELECT * FROM questiontbl WHERE Quiz=" + Session["resQuizCode"].ToString();
        MySqlDataAdapter msda = new MySqlDataAdapter(query, con);
        dt = new DataTable();
        msda.Fill(dt);
        con.Close();
        int quesNum = dt.Rows.Count;
        if (i < quesNum)
        {
                    QuesTb.InnerHtml = dt.Rows[i][2].ToString();
                    Ans1Lbl.InnerHtml = dt.Rows[i][3].ToString();
                    Ans2Lbl.InnerHtml = dt.Rows[i][4].ToString();
                    Ans3Lbl.InnerHtml = dt.Rows[i][5].ToString();
                    Ans4Lbl.InnerHtml = dt.Rows[i][6].ToString();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Score :- " + score + "')", true);
            //Ans1Lbl.Visible = false;
            //Ans2Lbl.Visible = false;
            //Ans3Lbl.Visible = false;
            //Ans4Lbl.Visible = false;
            Ans1Tb.Visible = false;
            Ans2Tb.Visible = false;
            Ans3Tb.Visible = false;
            Ans4Tb.Visible = false;
            Ans1Lbl.InnerHtml = "Right Question";
            Ans2Lbl.InnerHtml = RightQuesList;

            Ans3Lbl.Style.Add("color","red");
            //$("#Ans3Lbl").removeClass("text-success");
            Ans3Lbl.Attributes.Remove("class");
            Ans3Lbl.InnerHtml = "Wrong Question";
            QuesTb.InnerHtml = "";

            Ans4Lbl.Style.Add("color","red");
            Ans4Lbl.Attributes.Remove("class");
            Ans4Lbl.InnerHtml = WrongQuesList;
            scoreInfo.Visible = false;
            totalScoreInfo.InnerHtml = "Total Question : "+quesNum+" to right Ans : "+score;
            Session["resQuizCode"] = null;
        }
    }
    private void getQuestion()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query = "SELECT * FROM questiontbl WHERE Quiz=" + Session["resQuizCode"].ToString();
        MySqlDataAdapter msda = new MySqlDataAdapter(query, con);
        dt = new DataTable();
        msda.Fill(dt);
        int quesNum = dt.Rows.Count;
        if (i < quesNum)
        {
            QuesTb.InnerHtml = dt.Rows[i][2].ToString();
            Ans1Lbl.InnerHtml = dt.Rows[i][3].ToString();
            Ans2Lbl.InnerHtml = dt.Rows[i][4].ToString();
            Ans3Lbl.InnerHtml = dt.Rows[i][5].ToString();
            Ans4Lbl.InnerHtml = dt.Rows[i][6].ToString();
            con.Close();
            
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('No More Question')", true);
        }
    }
    int AnsNumber;
    private void selectedAns()
    {
        if (Ans1Tb.Checked)
        {
            AnsNumber = 1;
        }
        else if (Ans2Tb.Checked)
        {
            AnsNumber = 2;
        }
        else if (Ans3Tb.Checked)
        {
            AnsNumber = 3;
        }
        else
        {
            AnsNumber = 4;
        }
    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        if (Session["resQuizCode"] == null)
        {
            Response.Redirect("Home.aspx");
        }
        checkRightWrong();
        i++;
        NextQuestion();
    }
}
