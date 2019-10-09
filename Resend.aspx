<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="Resend.aspx.cs" Inherits="E_Commerce.Resend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>Please follow the instruction to activate your account</p>
    <br/>
    <p>Check your email we send you confirmation email there.</p>
    <br/>
    <p>If you don't get the email please enter your email and press the resend to get confirmation email</p>
    <br/>
    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:Button ID="btnResend" CssClass="btn btn-info" runat="server" Text="Resend" OnClick="btnResend_Click" />

</asp:Content>
