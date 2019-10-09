<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Commerce.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Email/Contact"></asp:Label>
    <br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:Label ID="lblEmail" runat="server" ForeColor="#FF3300"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
    <br />
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:Label ID="lblPassword" runat="server" ForeColor="#FF3300"></asp:Label>
    <br />
    <asp:CheckBox ID="chkRemember" runat="server" Text="Remember Me" />
    <br />
    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
    <br />
    <asp:HyperLink ID="hlForgetPassword" runat="server">Forget Password</asp:HyperLink>
&nbsp;&nbsp;&nbsp;
    <asp:HyperLink ID="hlRegister" runat="server">Register</asp:HyperLink>
    <br />
</asp:Content>
