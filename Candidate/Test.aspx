<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Candidate/CandidateMaster.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Views_Candidate_Test"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background-image:url("../../Assets/Images/background.jpg");
            background-size:cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" Runat="Server">
<div class="container-fluid">
        <div class="row" style="height:100px">

        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 bg-white rounded-3">
                <div class="row bg-success">
                    <h3 class="text-light" id="QuesTb" runat="server">Your question here.</h3>
                </div>
                <div class="row">
                    <div class="m-1 m-3 form-check">
                        <label for="Ans1" id="Ans1Lbl" runat="server" class="form-label text-success">Answer 1</label>
                        <input type="radio" name="Ans" class="form-check-input" runat="server" id="Ans1Tb">
                    </div>
                    <div class="m-1 m-3 form-check">
                        <label for="Ans2" id="Ans2Lbl" runat="server" class="form-label text-success">Answer 2</label>
                        <input type="radio" name="Ans" class="form-check-input" runat="server" id="Ans2Tb">
                    </div>
                    <div class="m-1 m-3 form-check">
                        <label for="Ans3" id="Ans3Lbl" runat="server" class="form-label text-success">Answer 3</label>
                        <input type="radio" name="Ans" class="form-check-input" runat="server" id="Ans3Tb">
                    </div>
                    <div class="m-1 m-3 form-check">
                        <label for="Ans4" id="Ans4Lbl" runat="server" class="form-label text-success">Answer 4</label>
                        <input type="radio" name="Ans" class="form-check-input" runat="server" id="Ans4Tb">
                    </div>
                </div>
                <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <label id="totalScoreInfo" class="text-danger h5" runat="server"></label>
                </div>
                <div class="col-md-2 mb-3">
                    <label id="scoreInfo" class="text-danger" runat="server"></label>
                    <asp:Button ID="SubmitBtn" runat="server" CssClass="btn btn-success" 
                        Text="Submit" onclick="SubmitBtn_Click" UseSubmitBehavior="False"/>
                </div>
            </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</asp:Content>

