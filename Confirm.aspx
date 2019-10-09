<%@ Page Title="" Language="C#" MasterPageFile="~/Public1.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="E_Commerce.Confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" ShowFooter="True" >
        <Columns>
            <asp:TemplateField HeaderText="ProductId" SortExpression="ProductId" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblProductId" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="Product">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Product") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Product") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate" SortExpression="Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty" SortExpression="Qty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtQty" runat="server" Text='<%# Bind("Qty") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SubTotal" SortExpression="SubTotal">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubTotal") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("SubTotal") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lblGrandTotal" runat="server"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:Label ID="Label4" runat="server" Text="Delivary Charge"></asp:Label>
    <asp:TextBox ID="txtDelivaryCharge" ReadOnly="True" Text="100" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label5" runat="server" Text="Other Charge"></asp:Label>
    <asp:TextBox ID="txtOtherCharge" ReadOnly="True" Text="30" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Payment Method"></asp:Label>
    <asp:DropDownList ID="ddlPaymentMethod" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [paymentMethod]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Location"></asp:Label>
    <asp:DropDownList ID="ddlLocation" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyCon %>" SelectCommand="SELECT * FROM [location]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>

    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" OnClick="btnSubmit_Click" />
</asp:Content>
