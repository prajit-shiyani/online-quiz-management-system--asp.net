using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Views_Admin_Quiz : System.Web.UI.Page
{
    string connectionString = @"SERVER=localhost; UID=root; PASSWORD=; DATABASE=onlinequiz;";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        if (!IsPostBack)
        {
            showQuiz();
            EditBtn.Enabled = false;
            DeleteBTn.Enabled = false;
        }
    }
    private void showQuiz()
    {
        MySqlConnection con = new MySqlConnection();
        con.ConnectionString = connectionString;
        con.Open();
        string query = "SELECT Qid as `Quiz Id`, QName as `Name`, QQtNbr as `Total Question`, QMarksByAns as `Mark By Ans` FROM quiztbl";
        MySqlDataAdapter msda = new MySqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        msda.Fill(ds);
        QuizList.DataSource = ds.Tables[0];
        QuizList.DataBind();
        con.Close();
    }
    private void reset()
    {
        QuizNameTb.Value = "";
        QuestionsTb.Value = "";
        AnsByQuestTb.Value = "";
        QuizList.SelectedIndex = -1;
        EditBtn.Enabled = false;
        DeleteBTn.Enabled = false;
        SaveBTn.Enabled = true;
    }
    protected void SaveBTn_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection con = new MySqlConnection();
            con.ConnectionString = connectionString;
            con.Open();
            string query = "INSERT INTO quiztbl(QName, QQtNbr, QMarksByAns) VALUES('" + QuizNameTb.Value + "'," + QuestionsTb.Value + "," + AnsByQuestTb.Value + ");";
            MySqlCommand msc = new MySqlCommand();
            msc.CommandType = System.Data.CommandType.Text;
            msc.CommandText = query;
            msc.Connection = con;
            msc.ExecuteNonQuery();
            con.Close();
            ErrMsg.Text = "Quiz Added!!!";
            showQuiz();
            reset();
        }
        catch (Exception Ex)
        {

            ErrMsg.Text = Ex.Message;
        }
    }
    protected void QuizList_SelectedIndexChanged(object sender, EventArgs e)
    {
        QuizNameTb.Value = QuizList.SelectedRow.Cells[2].Text;
        QuestionsTb.Value = QuizList.SelectedRow.Cells[3].Text;
        AnsByQuestTb.Value = QuizList.SelectedRow.Cells[4].Text;
        EditBtn.Enabled = true;
        DeleteBTn.Enabled = true;
        SaveBTn.Enabled = false;
    }
    protected void EditBtn_Click(object sender, EventArgs e)
    {
        try
        {
            MySqlConnection con = new MySqlConnection();
            con.ConnectionString = connectionString;
            con.Open();
            string query = "UPDATE quiztbl SET QName='" + QuizNameTb.Value + "', QQtNbr='" + QuestionsTb.Value + "', QMarksByAns='" + AnsByQuestTb.Value + "' WHERE Qid=" + QuizList.SelectedRow.Cells[1].Text;
            MySqlCommand mscd = new MySqlCommand();
            mscd.CommandType = CommandType.Text;
            mscd.CommandText = query;
            mscd.Connection = con;
            mscd.ExecuteNonQuery();
            con.Close();
            ErrMsg.Text = "Quiz updated.";
            showQuiz();
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
            string query = "DELETE FROM quiztbl WHERE Qid =" + QuizList.SelectedRow.Cells[1].Text;
            MySqlCommand msd = new MySqlCommand();
            msd.CommandType = CommandType.Text;
            msd.CommandText = query;
            msd.Connection = con;
            msd.ExecuteNonQuery();
            con.Close();
            ErrMsg.Text = "Quiz deleted.";
            showQuiz();
            reset();
        }
        catch (Exception Ex)
        {

            ErrMsg.Text = Ex.Message;
        }
    }
}