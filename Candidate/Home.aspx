<%@ Page Title="" Language="C#"AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Views_Candidate_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body{
            background-image:url("../../Assets/Images/background.jpg");
            background-size:cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" Runat="Server">

        <div class="row" style="height:100px">

        </div>
        <div class="row">
            <div class="col bg-light border-top-2 border-bottom-2">
                <div class="row pt-3 pb-3">
                    <div class="col-2"></div>
                    <div class="col-2">
                        <label class="form-label text-center text-success h4">Select your quiz</label>
                    </div>
                    <div class="col-4">
                        <asp:DropDownList ID="QuesTb" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                    <div class="col-4">
                        <asp:Button ID="HomeSubmit" CssClass="btn btn-success" runat="server" 
                            Text="Submit" onclick="HomeSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>

</asp:Content>

