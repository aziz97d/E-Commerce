<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="E_Commerce.OrderDetails" Theme="BootstrapTheme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Order.aspx">Order List</asp:HyperLink>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="orderId,productId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="Order Id" SortExpression="orderId" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("orderId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("orderId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Order Number" SortExpression="orderNumber">
                <EditItemTemplate>
                    <asp:Label ID="Label55" runat="server" Text='<%# Eval("orderNumber") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label55" runat="server" Text='<%# Bind("orderNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product" SortExpression="productId">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("product") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("product") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty" SortExpression="qty">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rate" SortExpression="rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Remarks" SortExpression="remarks">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="Button2" runat="server" CssClass="btn btn-default" CausesValidation="False" CommandName="Select" Text="Select" />
                    &nbsp;<asp:Button ID="Button3" runat="server" CssClass="btn btn-danger" CausesValidation="False" CommandName="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MyCon %>" DeleteCommand="DELETE FROM [orderDetails] WHERE [orderId] = @original_orderId AND [productId] = @original_productId AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))" InsertCommand="INSERT INTO [orderDetails] ([orderId], [productId], [qty], [rate], [remarks]) VALUES (@orderId, @productId, @qty, @rate, @remarks)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT odd.[orderId], odd.[productId], odd.[qty], odd.[rate], odd.[remarks], p.name as product, odr.number as orderNumber FROM [orderDetails] as odd left join product as p on p.id=odd.productId left join orders as odr on odr.id=odd.orderId WHERE ([orderId] = @orderId)" UpdateCommand="UPDATE [orderDetails] SET [qty] = @qty, [rate] = @rate, [remarks] = @remarks WHERE [orderId] = @original_orderId AND [productId] = @original_productId AND (([qty] = @original_qty) OR ([qty] IS NULL AND @original_qty IS NULL)) AND (([rate] = @original_rate) OR ([rate] IS NULL AND @original_rate IS NULL)) AND (([remarks] = @original_remarks) OR ([remarks] IS NULL AND @original_remarks IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_qty" Type="Double" />
            <asp:Parameter Name="original_rate" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="orderId" Type="Int32" />
            <asp:Parameter Name="productId" Type="Int32" />
            <asp:Parameter Name="qty" Type="Double" />
            <asp:Parameter Name="rate" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="orderId" QueryStringField="orderId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="qty" Type="Double" />
            <asp:Parameter Name="rate" Type="Double" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="original_orderId" Type="Int32" />
            <asp:Parameter Name="original_productId" Type="Int32" />
            <asp:Parameter Name="original_qty" Type="Double" />
            <asp:Parameter Name="original_rate" Type="Double" />
            <asp:Parameter Name="original_remarks" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
