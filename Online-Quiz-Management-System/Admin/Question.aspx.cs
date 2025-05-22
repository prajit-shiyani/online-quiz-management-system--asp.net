using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Views_Admin_Question : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            getQuiz();
            getQuestion();
            EditBtn.Enabled = false;
            DeleteBTn.Enabled = false;
        }
    }
    string connectionString = @"SERVER=localhost; USER=root; PASSWORD=; DATABASE=onlinequiz";

    private void getQuestion()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query1 = "SELECT * FROM questiontbl";
        MySqlDataAdapter msda = new MySqlDataAdapter(query1, con);
        DataSet ds = new DataSet();
        msda.Fill(ds);
        QuestionList.DataSource = ds.Tables[0];
        QuestionList.DataBind();
        con.Close();
    }

    private void reset()
    {
        QuizTb.SelectedIndex = -1;
        QuestionTb.Value = "";
        Ans1Tb.Value = "";
        Ans2Tb.Value = "";
        Ans3Tb.Value = "";
        Ans4Tb.Value = "";
        CorrectTb.Value = "";
        QuestionList.SelectedIndex = -1;
        EditBtn.Enabled = false;
        DeleteBTn.Enabled = false;
        SaveBTn.Enabled = true;
    }

    private void getQuiz()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query = "SELECT * FROM quiztbl";
        MySqlDataAdapter msda = new MySqlDataAdapter(query, con);
        DataTable ds = new DataTable();
        msda.Fill(ds);
        QuizTb.DataTextField = ds.Columns["QName"].ToString();
        QuizTb.DataValueField = ds.Columns["Qid"].ToString();
        QuizTb.DataSource = ds;
        QuizTb.DataBind();
        con.Close();
    }

    protected void SaveBTn_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection con = new MySqlConnection();
            con.ConnectionString = connectionString;
            con.Open();
            string query = "INSERT INTO questiontbl(Quiz, Question, Ans1, Ans2, Ans3, Ans4, Correct) VALUES(" + QuizTb.SelectedItem.Value + ",'" + QuestionTb.Value + "','" + Ans1Tb.Value + "','" + Ans2Tb.Value + "','" + Ans3Tb.Value + "','" + Ans4Tb.Value + "'," + CorrectTb.Value + ")";
            MySqlCommand mscd = new MySqlCommand();
            mscd.CommandType = CommandType.Text;
            mscd.CommandText = query;
            mscd.Connection = con;
            mscd.ExecuteNonQuery();
            con.Close();
            ErrMsg.Text = "Question added...";
            getQuestion();
            reset();
        }
        catch (Exception Ex)
        {

            ErrMsg.Text = Ex.Message;
        }
    }
    protected void QuestionList_SelectedIndexChanged(object sender, EventArgs e)
    {
        QuizTb.SelectedItem.Value = QuestionList.SelectedRow.Cells[2].Text;
        QuestionTb.Value = QuestionList.SelectedRow.Cells[3].Text;
        Ans1Tb.Value = QuestionList.SelectedRow.Cells[4].Text;
        Ans2Tb.Value = QuestionList.SelectedRow.Cells[5].Text;
        Ans3Tb.Value = QuestionList.SelectedRow.Cells[6].Text;
        Ans4Tb.Value = QuestionList.SelectedRow.Cells[7].Text;
        CorrectTb.Value = QuestionList.SelectedRow.Cells[8].Text;
        SaveBTn.Enabled = false;
        EditBtn.Enabled = true;
        DeleteBTn.Enabled = true;
    }
    protected void EditBtn_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection con = new MySqlConnection();
            con.ConnectionString = connectionString;
            con.Open();
            string query = "UPDATE questiontbl SET Quiz=" + QuizTb.SelectedItem.Value + ",Question='" + QuestionTb.Value + "',Ans1='" + Ans1Tb.Value + "',Ans2='" + Ans2Tb.Value + "',Ans3='" + Ans3Tb.Value + "',Ans4='" + Ans4Tb.Value + "',Correct='" + CorrectTb.Value + "' WHERE QuesId=" + QuestionList.SelectedRow.Cells[1].Text;
            MySqlCommand mscd = new MySqlCommand();
            mscd.CommandType = CommandType.Text;
            mscd.CommandText = query;
            mscd.Connection = con;
            mscd.ExecuteNonQuery();
            con.Close();
            ErrMsg.Text = "Question Edited...";
            getQuestion();
            reset();
        }
        catch (Exception Ex)
        {

            ErrMsg.Text = Ex.Message;
        }
    }
    protected void DeleteBTn_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection con = new MySqlConnection();
            con.ConnectionString = connectionString;
            con.Open();
            string query = "DELETE FROM questiontbl WHERE QuesId=" + QuestionList.SelectedRow.Cells[1].Text;
            MySqlCommand mscd = new MySqlCommand();
            mscd.CommandType = CommandType.Text;
            mscd.CommandText = query;
            mscd.Connection = con;
            mscd.ExecuteNonQuery();
            ErrMsg.Text = "Question deleted....";
            con.Close();
            getQuestion();
            reset();
        }
        catch (Exception Ex)
        {

            ErrMsg.Text = Ex.Message;
        }
    }
}