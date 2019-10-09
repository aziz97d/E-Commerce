<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="E_Commerce.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Shop.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-sumury"> <%= ((List<E_Commerce.DAL.Item>)Session["cart"]).Sum(i=>i.Qty) %> Items in Cart, Total: <%= ((List<E_Commerce.DAL.Item>)Session["cart"]).Sum(i=>i.SubTotal) %> BDT/= <a href="checkout.aspx">Check Out</a></div>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource">
        <ItemTemplate>
            <div class="product">
                <h2><%# Eval("name") +","+ Eval("code")%></h2>
                <img src="../Image/<%# Eval("image") %>" />
                <div>
                    <span><del><%# Eval("price") %></del>-<%#Eval("discount") %>=<%#Eval("finalPrice") %>BDT/=</span>
                    <p><%#Eval("description") %></p>
                    <p><asp:Button ID="btnAddToCart" runat="server" CommandArgument='<%#Eval("id") %>' OnClick="btnAddToCart_OnClick" Text="Add To Cart" /></p>
                </div>
                
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name], [code], [tag], [categoryId], [category], [brandId], [brand], [unitId], [unit], [description], [price], [finalPrice], [discount], [lastUpdate], [Comments], [Likes], [image] FROM [vwProduct] WHERE ([category] = @category)">
        <SelectParameters>
            <asp:QueryStringParameter Name="category" QueryStringField="category" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT [id], [name], [code], [tag], [categoryId], [category], [brandId], [brand], [unitId], [unit], [description], [price], [finalPrice], [discount], [lastUpdate], [Comments], [Likes], [image] FROM [vwProduct] WHERE ([categoryId] = @categoryId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="categoryId" QueryStringField="ctg" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
