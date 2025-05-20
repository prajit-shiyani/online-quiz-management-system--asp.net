<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="ViewCandidates.aspx.cs" Inherits="Views_Admin_ViewCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" Runat="Server">
    
    <div class="container-fluid">
        <div class="row" style="height:10px">

        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <h3 class="text-center text-danger">Register candidates</h3>
                <asp:GridView ID="CandidatesList" runat="server" class="table table-bordered table-dark table-hover"></asp:GridView>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</asp:Content>

