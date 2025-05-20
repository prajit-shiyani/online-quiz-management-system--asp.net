<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Quiz.aspx.cs" Inherits="Views_Admin_Quiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" Runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <h5 class="text-danger text-center">Manage Quiz</h5> 
                  <div class="mb-3">
                    <label for="QuizNameTb" class="form-label">Quiz Name</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
                          ControlToValidate="QuizNameTb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="QuizNameTb" autocomplete="off"/>
                  </div>
                  <div class="mb-3">
                    <label for="QuizNameTb" class="form-label">Questions Numbers</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
                          ControlToValidate="QuestionsTb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RangeValidator
                            ID="RangeValidator1" runat="server" ErrorMessage="*" 
                          ControlToValidate="QuestionsTb" ForeColor="Red" MaximumValue="50" 
                          MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator>
                    <input type="text" class="form-control" runat="server" id="QuestionsTb" autocomplete="off"/>
                  </div>
                  <div class="mb-3">
                    <label for="AnsByQuestTb" class="form-label">Mark by ans</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
                          ControlToValidate="AnsByQuestTb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RangeValidator
                            ID="RangeValidator2" runat="server" ErrorMessage="*" 
                          ControlToValidate="AnsByQuestTb" ForeColor="Red" MaximumValue="20" 
                          MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator>
                    <input type="text" class="form-control" runat="server" id="AnsByQuestTb" autocomplete="off"/>
                  </div>
                  <div class="row">
                    <asp:Label ID="ErrMsg" runat="server" CssClass="text-danger" Text=""></asp:Label>
                    <div class="col mb-3 d-grid">
                        
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" 
                            class="btn btn-warning btn-block" onclick="EditBtn_Click"/>
                    </div>
                    <div class="col mb-3 d-grid">
                        
                        <asp:Button ID="SaveBTn" runat="server" Text="Save" 
                            class="btn btn-primary btn-block" onclick="SaveBTn_Click"/>
                    </div>
                    <div class="col mb-3 d-grid">
                        
                        <asp:Button ID="DeleteBTn" runat="server" Text="Delete" 
                            class="btn btn-danger btn-block" onclick="DeleteBTn_Click"/>
                    </div>
                  </div>
                       
            </div>
            <div class="col-md-8">
                <h3 class="text-danger text-center">Quiz List</h3>
                <asp:GridView CssClass="table" ID="QuizList" runat="server" 
                    AutoGenerateSelectButton="True" 
                    onselectedindexchanged="QuizList_SelectedIndexChanged">
                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>

