<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="RegistrationSuccess.aspx.cs" Inherits="E_Commerce.RegistrationSuccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/>
   <p> <%= Session["message"].ToString() %> </p>
</asp:Content>
