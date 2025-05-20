<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Views_Admin_Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyBody" Runat="Server">

<div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <h5 class="text-danger text-center">Manage Question</h5> 
                  <div class="mb-1">
                    <label for="QuizTb" class="form-label">Quiz</label>
                      <asp:DropDownList ID="QuizTb" runat="server" CssClass="form-control"></asp:DropDownList>
                  </div>
                  <div class="mb-1">
                    <label for="QuestionTb" class="form-label">Question</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" 
                          ControlToValidate="QuestionTb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="QuestionTb" autocomplete="off"/>
                  </div>
                  <div class="mb-1">
                    <label for="Ans1Tb" class="form-label">Option 1</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" 
                          ControlToValidate="Ans1Tb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="Ans1Tb" autocomplete="off"/>
                  </div>
                  <div class="mb-1">
                    <label for="Ans2Tb" class="form-label">Option 2</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" 
                          ControlToValidate="Ans2Tb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="Ans2Tb" autocomplete="off"/>
                  </div>
                  <div class="mb-1">
                    <label for="Ans3Tb" class="form-label">Option 3</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
                          ControlToValidate="Ans3Tb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="Ans3Tb" autocomplete="off"/>
                  </div>
                  <div class="mb-1">
                    <label for="Ans4Tb" class="form-label">Option 4</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" 
                          ControlToValidate="Ans4Tb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <input type="text" class="form-control" runat="server" id="Ans4Tb" autocomplete="off"/>
                  </div>
                  <div class="mb-1">
                    <label for="CorrectTb" class="form-label">Correct option</label><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" 
                          ControlToValidate="CorrectTb" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator><asp:RangeValidator
                              ID="RangeValidator1" runat="server" ErrorMessage="*" 
                          ControlToValidate="CorrectTb" ForeColor="Red" MaximumValue="4" MinimumValue="1" 
                          SetFocusOnError="True"></asp:RangeValidator>
                    <input type="text" class="form-control" runat="server" id="CorrectTb" autocomplete="off"/>
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
            <div class="col-md-9">
                <h3 class="text-danger text-center">Question List</h3>
                <asp:GridView CssClass="table" ID="QuestionList" runat="server" 
                    AutoGenerateSelectButton="True" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="QuestionList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </div>
            
        </div>
    </div>

</asp:Content>

