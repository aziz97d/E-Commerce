<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="E_Commerce.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" />
    <br />
    <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Cancel" />
    <br />
    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
    <br />
    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
    </asp:DropDownList>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:GridView ID="GridView1" CssClass="table table-striped" Width="100%" runat="server">
        <HeaderStyle CssClass="thead-light" />
    </asp:GridView>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server"  Height="50px" Width="40%" BackColor="#FFFFCC" BorderColor="#33CC33" CssClass="table" GridLines="Horizontal">
        <FieldHeaderStyle BackColor="#CCFFCC" Width="50%" />
        <InsertRowStyle BackColor="White" Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:DetailsView>


    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-success" runat="server"></asp:HyperLink>
</asp:Content>
