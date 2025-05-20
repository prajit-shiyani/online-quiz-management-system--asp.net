<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Register</title>
    <style>
        * {
            font-family: Poppins;
        }
        body {
            background-image:<img src="Assets/Images/background.jpg" />");
            background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="height: 25px"></div>
            <div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-3 bg-light rounded-3 mt-4 shadow-lg">
                    <h4 class="text-danger text-center">Online Quiz System</h4>
                    <h6 class="text-success text-center">Register</h6>
                    <div class="mb-3">
                        <label for="CNameTb" class="form-label">Candidate Name</label>
                        <asp:TextBox ID="CNameTb" runat="server" CssClass="form-control" autocomplete="off" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ErrorMessage="*"
                            ControlToValidate="CNameTb"
                            ForeColor="Red"
                            SetFocusOnError="True"
                            ValidationExpression="^[a-zA-Z\s]+$">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ErrorMessage="*"
                            ControlToValidate="CNameTb"
                            ForeColor="Red"
                            SetFocusOnError="True">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="CEmailTb" class="form-label">Email Address</label>
                        <asp:TextBox ID="CEmailTb" runat="server" CssClass="form-control" autocomplete="off" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            runat="server"
                            ErrorMessage="*"
                            ControlToValidate="CEmailTb"
                            ForeColor="Red"
                            SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="*"
                            ControlToValidate="CEmailTb"
                            ForeColor="Red"
                            SetFocusOnError="True">
                        </asp:RequiredFieldValidator>
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label for="PasswordTb" class="form-label">Password</label>
                        <asp:TextBox ID="PasswordTb" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ErrorMessage="*"
                            ControlToValidate="PasswordTb"
                            ForeColor="Red"
                            SetFocusOnError="True">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-3">
                        <label for="CollegeTb" class="form-label">College</label>
                        <asp:TextBox ID="CollegeTb" runat="server" CssClass="form-control" autocomplete="off" />
                    </div>
                    <div class="mb-3 form-check">
                        <label class="form-check-label text-center">
                            <a class="text-danger" href="Login.aspx">Login</a>
                        </label>
                    </div>
                    <div class="mb-3 d-grid">
                        <asp:Label ID="ErrMsg" runat="server" CssClass="text-danger" Text=""></asp:Label>
                        <asp:Button ID="RegisterBtn" runat="server" Text="Register" class="btn btn-success btn-block" onclick="RegisterBtn_Click" />
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </form>
</body>
</html>
