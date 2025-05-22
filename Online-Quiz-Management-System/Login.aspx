<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Views_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="../Assets/Lib/Bootstrap/css/bootstrap.min.css" />
    <style>
        * {
            font-family: Poppins;
        }
        body {
            background-image: url("../Assets/Images/background.jpg");
            background-size: cover;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row" style="height: 100px;"></div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4 bg-light rounded-3 mt-4 shadow-lg">
                    <h4 class="text-danger text-center mt-2">Online Quiz System</h4>
                    <div class="mb-3">
                        <label for="LEmailTb" class="form-label">Email Address</label>
                        <asp:TextBox ID="LEmailTb" runat="server" CssClass="form-control" autocomplete="off" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="*"
                            ForeColor="Red"
                            SetFocusOnError="True"
                            ControlToValidate="LEmailTb" />
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ErrorMessage="*"
                            ForeColor="Red"
                            SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="LEmailTb" />
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                    </div>
                    <div class="mb-3">
                        <label for="LPassTb" class="form-label">Password</label>
                        <asp:TextBox ID="LPassTb" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ErrorMessage="*"
                            ForeColor="Red"
                            ControlToValidate="LPassTb" />
                    </div>
                    <div class="mb-3 form-check">
                        <label class="form-check-label"><a class="text-danger" href="Admin/AdminLogin.aspx">Admin</a></label>
                        <label class="form-check-label"><a class="text-danger" href="Register.aspx">Register</a></label>
                    </div>
                    <div class="mb-3 d-grid">
                        <asp:Label ID="ErrMsg" runat="server" CssClass="text-danger" Text=""></asp:Label>
                        <asp:Button ID="LoginBtn" runat="server" Text="Login" class="btn btn-danger btn-block" onclick="LoginBtn_Click" />
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </form>
</body>
</html>
